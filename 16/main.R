set.seed(2050320976)

## dat <- read.table("sp500.csv",sep=",",header=TRUE)
## plot(as.Date(dat$Date),dat$Close,
##   xlab="date",ylab="S&P 500",type="l")
## plot(as.Date(dat$Date),dat$Close, log="y",
##   xlab="date",ylab="S&P 500",type="l")

par(mfrow=c(1,2),mai=c(0.8,0.8,0.1,0.3))
dat <- read.table("sp500.csv",sep=",",header=TRUE)
plot(as.Date(dat$Date),dat$Close,
  xlab="date",ylab="S&P 500",type="l")
plot(as.Date(dat$Date),dat$Close, log="y",
  xlab="date",ylab="S&P 500",type="l")

## load(file="sp500-2002-2012.rda")
## plot(sp500.ret.demeaned, type="l",
##   xlab="business day (2002-2012)",ylab="demeaned S&P 500 return")

par(mai=c(0.8,0.8,0.1,0.1))
load(file="sp500-2002-2012.rda")
plot(sp500.ret.demeaned, type="l",
  xlab="business day (2002-2012)",ylab="demeaned S&P 500 return")

fit.garch <- tseries::garch(sp500.ret.demeaned,
  grad = "numerical", trace = FALSE)
L.garch <- tseries:::logLik.garch(fit.garch)

sp500_statenames <- c("H","G","Y_state")
sp500_rp_names <- c("sigma_nu","mu_h","phi","sigma_eta")
sp500_ivp_names <- c("G_0","H_0")
sp500_paramnames <- c(sp500_rp_names,sp500_ivp_names)

rproc1 <- "
  double beta,omega,nu;
  omega = rnorm(0,sigma_eta * sqrt( 1- phi*phi ) * 
    sqrt(1-tanh(G)*tanh(G)));
  nu = rnorm(0, sigma_nu);
  G += nu;
  beta = Y_state * sigma_eta * sqrt( 1- phi*phi );
  H = mu_h*(1 - phi) + phi*H + beta * tanh( G ) 
    * exp(-H/2) + omega;
"
rproc2.sim <- "
  Y_state = rnorm( 0,exp(H/2) );
 "

rproc2.filt <- "
  Y_state = covaryt;
 "
sp500_rproc.sim <- paste(rproc1,rproc2.sim)
sp500_rproc.filt <- paste(rproc1,rproc2.filt)

sp500_rinit <- "
  G = G_0;
  H = H_0;
  Y_state = rnorm( 0,exp(H/2) );
"

sp500_rmeasure <- "
   y=Y_state;
"

sp500_dmeasure <- "
   lik=dnorm(y,0,exp(H/2),give_log);
"

library(pomp)
sp500_partrans <- parameter_trans(
  log=c("sigma_eta","sigma_nu"),
  logit="phi"
)

sp500.filt <- pomp(data=data.frame(
    y=sp500.ret.demeaned,time=1:length(sp500.ret.demeaned)),
  statenames=sp500_statenames,
  paramnames=sp500_paramnames,
  times="time",
  t0=0,
  covar=covariate_table(
    time=0:length(sp500.ret.demeaned),
    covaryt=c(0,sp500.ret.demeaned),
    times="time"),
  rmeasure=Csnippet(sp500_rmeasure),
  dmeasure=Csnippet(sp500_dmeasure),
  rprocess=discrete_time(step.fun=Csnippet(sp500_rproc.filt),
    delta.t=1),
  rinit=Csnippet(sp500_rinit),
  partrans=sp500_partrans
)

params_test <- c(
  sigma_nu = exp(-4.5),  
  mu_h = -0.25,  	 
  phi = expit(4),	 
  sigma_eta = exp(-0.07),
  G_0 = 0,
  H_0=0
)
  
sim1.sim <- pomp(sp500.filt, 
  statenames=sp500_statenames,
  paramnames=sp500_paramnames,
  rprocess=discrete_time(
    step.fun=Csnippet(sp500_rproc.sim),delta.t=1)
)

sim1.sim <- simulate(sim1.sim,seed=1,params=params_test)


sim1.filt <- pomp(sim1.sim, 
  covar=covariate_table(
    time=c(timezero(sim1.sim),time(sim1.sim)),
    covaryt=c(obs(sim1.sim),NA),
    times="time"),
  statenames=sp500_statenames,
  paramnames=sp500_paramnames,
  rprocess=discrete_time(
    step.fun=Csnippet(sp500_rproc.filt),delta.t=1)
)


run_level <- 3
sp500_Np <-           switch(run_level,  50, 1e3, 2e3)
sp500_Nmif <-         switch(run_level,   5, 100, 200)
sp500_Nreps_eval <-   switch(run_level,   4,  10,  20)
sp500_Nreps_local <-  switch(run_level,   5,  20,  20)
sp500_Nreps_global <- switch(run_level,   5,  20, 100)

library(doParallel)
cores <- as.numeric(Sys.getenv('SLURM_NTASKS_PER_NODE',unset=NA))
if(is.na(cores)) cores <- detectCores()  
registerDoParallel(cores)
library(doRNG)
registerDoRNG(34118892)
stew(file=paste0("pf1_",run_level,".rda"),{
  t.pf1 <- system.time(
    pf1 <- foreach(i=1:sp500_Nreps_eval,
      .packages='pomp') %dopar% pfilter(sim1.filt,Np=sp500_Np))
})
(L.pf1 <- logmeanexp(sapply(pf1,logLik),se=TRUE))

sp500_rw.sd_rp <- 0.02
sp500_rw.sd_ivp <- 0.1
sp500_cooling.fraction.50 <- 0.5
sp500_rw.sd <- rw_sd(
  sigma_nu  = sp500_rw.sd_rp,
  mu_h      = sp500_rw.sd_rp,
  phi       = sp500_rw.sd_rp,
  sigma_eta = sp500_rw.sd_rp,
  G_0       = ivp(sp500_rw.sd_ivp),
  H_0       = ivp(sp500_rw.sd_ivp)
)	 

stew(file=paste0("mif1_",run_level,".rda"),{
  t.if1 <- system.time({
  if1 <- foreach(i=1:sp500_Nreps_local,
    .packages='pomp', .combine=c) %dopar% mif2(sp500.filt,
      params=params_test,
      Np=sp500_Np,
      Nmif=sp500_Nmif,
      cooling.fraction.50=sp500_cooling.fraction.50,
      rw.sd = sp500_rw.sd)
  L.if1 <- foreach(i=1:sp500_Nreps_local,
    .packages='pomp', .combine=rbind) %dopar% logmeanexp(
      replicate(sp500_Nreps_eval, logLik(pfilter(sp500.filt,
        params=coef(if1[[i]]),Np=sp500_Np))), se=TRUE)
  })
})
r.if1 <- data.frame(logLik=L.if1[,1],logLik_se=L.if1[,2],
  t(sapply(if1,coef)))
if (run_level>1) write.table(r.if1,file="sp500_params.csv",
  append=TRUE,col.names=FALSE,row.names=FALSE)

## pairs(~logLik+sigma_nu+mu_h+phi+sigma_eta,
##   data=subset(r.if1,logLik>max(logLik)-20))

pairs(~logLik+sigma_nu+mu_h+phi+sigma_eta,
  data=subset(r.if1,logLik>max(logLik)-20))

sp500_box <- rbind(
 sigma_nu=c(0.005,0.05),
 mu_h    =c(-1,0),
 phi = c(0.95,0.99),
 sigma_eta = c(0.5,1),
 G_0 = c(-2,2),
 H_0 = c(-1,1)
)

stew(file=paste0("box_eval_",run_level,".rda"),{
  if.box <- foreach(i=1:sp500_Nreps_global,
    .packages='pomp',.combine=c) %dopar% mif2(if1[[1]],
      params=apply(sp500_box,1,function(x)runif(1,x)))
  L.box <- foreach(i=1:sp500_Nreps_global,
    .packages='pomp',.combine=rbind) %dopar% {
       logmeanexp(replicate(sp500_Nreps_eval, logLik(pfilter(
         sp500.filt,params=coef(if.box[[i]]),Np=sp500_Np))), 
         se=TRUE)}
})
timing.box <- .system.time["elapsed"]
r.box <- data.frame(logLik=L.box[,1],logLik_se=L.box[,2],
  t(sapply(if.box,coef)))
if(run_level>1) write.table(r.box,file="sp500_params.csv",
  append=TRUE,col.names=FALSE,row.names=FALSE)
summary(r.box$logLik,digits=5)

## pairs(~logLik+log(sigma_nu)+mu_h+phi+sigma_eta+H_0,
##   data=subset(r.box,logLik>max(logLik)-10))

pairs(~logLik+log(sigma_nu)+mu_h+phi+sigma_eta+H_0,
  data=subset(r.box,logLik>max(logLik)-10))

## library(tseries)
## fit.garch.benchmark <- garch(sp500.ret.demeaned,grad = "numerical", trace = FALSE)
## L.garch.benchmark <- tseries:::logLik.garch(fit.garch.benchmark)
