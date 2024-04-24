library(readr)
library(tidyverse)
library(stringr)
library(pomp)
library(ggplot2)
library(dplyr)
library(foreach)
library(doParallel)
library(doRNG)

parallel <- as.numeric(Sys.getenv('SLURM_NTASKS_PER_NODE',unset=NA))

registerDoParallel(36)

results_dir <- paste0("greatlakes_runs/")
if(!dir.exists(results_dir)) dir.create(results_dir)


registerDoRNG(542451)  # Any integer to set reproducible seed

set.seed(2488820)

flu <- read.csv("/home/falarcon/stats531/final/Flu.csv", sep=";")

fluNL <- flu %>%
  filter(str_detect(str_to_lower(`COUNTRY.AREA.TERRITORY`), "netherlands"))

fluNL <- fluNL %>%
  mutate(week = row_number())

fluNL <- fluNL[,c("ISO_SDATE", "week", "INF_ALL")]

fluNL %>% replace(is.na(.), 0) -> fluNL

fluNL[100: 198, ] -> fluNL_nonsentinel
fluNL[1:99, ] -> fluNL_sentinel

#fluNL_nonsentinel %>%
#  ggplot(aes(x = ISO_SDATE, y = INF_ALL)) + geom_line()

#fluNL_sentinel %>%
#  ggplot(aes(x = ISO_SDATE, y = INF_ALL)) + geom_line()

# get subset of 2022-2023 flu season for modeling
flu_2022_2023 <- subset(fluNL_sentinel, ISO_SDATE >= as.Date("2022-10-01") & ISO_SDATE <= as.Date("2023-05-31"))

# Initialization function for vaccinated and unvaccinated compartments
seir_rinit <- Csnippet("
  S_v = nearbyint(vac_rate * eta_v * N);
  E_v = 0;
  I_v = 1;
  R_v = 0;


  S_u = nearbyint((1-vac_rate) * eta_u * N);
  E_u = 0;
  I_u = 1;
  R_u = 0;


  H = 0;
")


# Density measurement model for likelihood calculation
seir_dmeas <- Csnippet("
  double total_H = rho * H;
  lik = dnbinom_mu(INF_ALL, k, total_H, give_log);
")


# Random measure model for simulated data generation
seir_rmeas <- Csnippet("
  INF_ALL = rnbinom_mu(k, rho * H);
")


# SEIR step function for both vaccinated and unvaccinated compartments
seir_step <- Csnippet("
  double dN_SE_v = rbinom(S_v, 1 - exp(-Beta_v * I_v / N * dt));
  double dN_EI_v = rbinom(E_v, 1 - exp(-mu_EI * dt));
  double dN_IR_v = rbinom(I_v, 1 - exp(-mu_IR_v * dt));
  S_v -= dN_SE_v;
  E_v += dN_SE_v - dN_EI_v;
  I_v += dN_EI_v - dN_IR_v;
  R_v += dN_IR_v;


  double dN_SE_u = rbinom(S_u, 1 - exp(-Beta_u * I_u / N * dt));
  double dN_EI_u = rbinom(E_u, 1 - exp(-mu_EI * dt));
  double dN_IR_u = rbinom(I_u, 1 - exp(-mu_IR_u * dt));
  S_u -= dN_SE_u;
  E_u += dN_SE_u - dN_EI_u;
  I_u += dN_EI_u - dN_IR_u;
  R_u += dN_IR_u;


  H += dN_IR_v + dN_IR_u;
")



# POMP model
fluSEIR <- pomp(
  data = flu_2022_2023,
  times = "week",
  t0 = 0,
  rprocess = euler(seir_step, delta.t = 1/7),
  rinit = seir_rinit,
  rmeasure = seir_rmeas,
  dmeasure = seir_dmeas,
  accumvars = "H",
  statenames = c("S_v", "E_v", "I_v", "R_v", "S_u", "E_u", "I_u", "R_u", "H"),
  paramnames = c("Beta_v", "Beta_u", "mu_EI", "mu_IR_v", "mu_IR_u", "rho", "k", "N", "eta_v", "eta_u", "vac_rate"),
      params=c(Beta_v=2, Beta_u=4.5, mu_IR_v=0.8, mu_IR_u=0.6, mu_EI=0.35, rho=0.2, k=10,
             eta_v=0.7, eta_u=.9, vac_rate=.679, N=17700000)
)



fluSEIR |>
  simulate(
    params=c(Beta_v=2, Beta_u=4.5, mu_IR_v=0.8, mu_IR_u=0.6, mu_EI=0.35, rho=0.2, k=10,
             eta_v=0.7, eta_u=.9, vac_rate=.679, N=17700000),
    nsim=20,
    format="data.frame",
    include.data=TRUE
  ) -> sims

sims |>
  ggplot(aes(x=week, y=INF_ALL, group=.id, color=.id == "data")) +
  geom_line() +
  guides(color="none")


fixed_params <- c(N=17700000, vac_rate=.679,  k=10)
coef(fluSEIR,names(fixed_params)) <- fixed_params
# Vaccination rates: https://worldpopulationreview.com/country-rankings/flu-vaccination-rates-by-country

fluSEIR |>
pfilter(Np=10000, params=c(Beta_v=2, Beta_u=5, mu_IR_v=0.8, mu_IR_u=0.6, mu_EI=0.3, rho=0.2, k=10,
             eta_v=0.6, eta_u=.8, vac_rate=.679, N=17700000)) -> pf


foreach(i=1:1000,.combine=c,
.packages = c("pomp")
) %dopar% {
library(pomp)
fluSEIR |> pfilter(Np=10000, params=c(Beta_v=2, Beta_u=5, mu_IR_v=0.8, mu_IR_u=0.6, mu_EI=0.3, rho=0.2, k=10,
             eta_v=0.6, eta_u=.8, vac_rate=.679, N=17700000))
} -> pf
pf |> logLik() |> logmeanexp(se=TRUE) -> L_pf
L_pf

logLik(pf) -> ll
logmeanexp(ll,se=TRUE)



foreach(i=1:100,.combine=c,
.packages = c("pomp")
) %dopar% {
fluSEIR |>
mif2(
Np=1000, Nmif=50,
cooling.fraction.50=0.6,
rw.sd=rw_sd(Beta_v=0.02,Beta_u=0.02, mu_IR_v=0.02, mu_IR_u=0.02, mu_EI=0.02, rho=0.02, eta_v=ivp(0.02),eta_u=ivp(0.02)),
partrans=parameter_trans(log=c("Beta_v","Beta_u", "mu_EI", "mu_IR_v","mu_IR_u"),logit=c("rho","eta_u","eta_v")),
paramnames=c("Beta_v","Beta_u", "rho","eta_v", "mu_EI", "mu_IR_v","mu_IR_u","eta_u")
)
} -> mifs_local

mifs_local |>
  traces() |>
  melt() |>
  ggplot(aes(x=iteration,y=value,group=.L1,color=factor(.L1)))+
  geom_line()+
  guides(color="none")+
  facet_wrap(~name,scales="free_y")



runif_design(
lower=c(Beta_v=1.0, Beta_u=1.0, mu_IR_v=0.1, mu_IR_u=0.2, mu_EI=0.1, rho=0.1,
        eta_v=0.0, eta_u=0.0),
upper=c(Beta_v=50.0, Beta_u=50.0, mu_IR_v=0.3, mu_IR_u=0.9, mu_EI=5, rho=0.5,
        eta_v=1.0, eta_u=1.0),
nseq=400
) -> guesses

mf1 <- mifs_local[[1]]

bake(file=paste0(results_dir,"global_search_2.rds"),{
registerDoRNG(12345)
foreach(guess=iterators::iter(guesses,"row"), .combine=rbind,
.packages = c("pomp")
) %dopar% {
library(pomp)
library(tidyverse)
mf1 |>
mif2(params=c(guess,fixed_params)) |>
mif2(Nmif=1000) -> mf
replicate(
10,
mf |> pfilter(Np=10000) |> logLik()
) |>
logmeanexp(se=TRUE) -> ll
mf |> coef() |> bind_rows() |>
bind_cols(loglik=ll[1],loglik.se=ll[2])
} -> results2
})%>%
  filter(is.finite(loglik)) -> results2


f_results <- read_rds("/Users/falarcon/Desktop/all/global_search_2.rds")
f_results %>%
    filter(is.finite(loglik)) -> f_results
