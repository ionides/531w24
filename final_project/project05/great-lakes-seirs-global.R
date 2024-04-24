
library(tidyverse)
library(pomp)
library(foreach)
library(doParallel)
library(doRNG)

registerDoParallel(36)
registerDoRNG(237835)

ok_flu <- read_csv("ok-flu.csv") %>%
  mutate(row = row_number()) %>%
  filter(row >= 43, row <= 252) %>%
  mutate(week = row_number()) %>%
  select(week, cases = ILITOTAL)

run_level <- 4
Np              <- switch(run_level, 100, 1e3, 2e3, 2e3)
Nlocal          <- switch(run_level, 2, 5, 20, 100)
Nglobal         <- switch(run_level, 2, 5, 100, 250)
Npoints_profile <- switch(run_level, 4, 10, 50, 200)
Nreps_profile   <- switch(run_level, 2, 4, 15, 100)
Nmif            <- switch(run_level, 10, 50, 100, 250)
Nreps_eval      <- switch(run_level, 2, 5, 10, 50)

seirs_step <- Csnippet("
  double pi = 3.141593;
  double Beta = Beta0 * (1 + amp * sin(2 * pi * (t + phase) / 52));
  double dN_SE = rbinom(S, 1 - exp(-Beta * I / N * dt));
  double dN_EI = rbinom(E, 1 - exp(-mu_EI * dt));
  double dN_IR = rbinom(I, 1 - exp(-mu_IR * dt));
  double dN_RS = rbinom(R, 1 - exp(-mu_RS * dt));
  S += dN_RS - dN_SE;
  E += dN_SE - dN_EI;
  I += dN_EI - dN_IR;
  R += dN_IR - dN_RS;
  H += dN_IR;
  ")

seirs_rinit <- Csnippet("
  double pop = N / (S0 + E0 + I0 + R0);
  S = nearbyint(S0 * pop);
  E = nearbyint(E0 * pop);
  I = nearbyint(I0 * pop);
  R = nearbyint(R0 * pop);
  H = 0;
  ")

seirs_dmeas <- Csnippet("
  lik = dnbinom_mu(cases, k, rho * H, give_log);
  ")

seirs_rmeas <- Csnippet("
  cases = rnbinom_mu(k, rho * H);
  ")

flu_seirs <- ok_flu %>%
  pomp(
    times = "week",
    t0 = 0,
    rprocess = euler(seirs_step, delta.t = 1/7),
    rinit = seirs_rinit, 
    rmeasure = seirs_rmeas,
    dmeasure = seirs_dmeas,
    accumvars = "H",
    statenames = c("S", "E", "I", "R", "H"),
    paramnames = c("Beta0", "amp", "phase", "mu_EI", "mu_IR", "mu_RS", "N", "S0", "E0", "I0", "R0", "rho", "k"),
    partrans = parameter_trans(
      log = c("Beta0", "mu_EI", "mu_IR", "mu_RS", "k"),
      logit = c("amp", "rho"),
      barycentric = c("S0", "E0", "I0", "R0")
    )
  )

coef(flu_seirs) <- c(
  Beta0 = 2.2, amp = 0.3, phase = -4.5, 
  mu_EI = 0.8, mu_IR = 2, mu_RS = 1, 
  N = 3.8e6, S0 = 0.1, E0 = 0.01, I0 = 0.01, R0 = 0.3,
  rho = 0.0005, k = 10 
)

mifs_local <- bake(file = "seirs_local_search.RDS", {
  mifs_local <- foreach(i = 1:Nlocal, .combine = c, .packages = c("pomp", "tidyverse")) %dopar% {
    flu_seirs %>% 
      mif2(
        Np = Np,
        Nmif = Nmif,
        cooling.fraction.50 = 0.5,
        rw.sd = rw_sd(
          Beta0 = 0.01, amp = 0.01, phase = 0.01, 
          mu_EI = 0.01, mu_IR = 0.01,  mu_RS = 0.01, 
          S0 = ivp(0.002), E0 = ivp(0.002), 
          I0 = ivp(0.002), R0 = ivp(0.002),
          rho = 0.01, k = 0.01
        )
      )
  }
  mifs_local
})

mf1 <- mifs_local[[1]]

# guesses <- runif_design(
#   lower = c(Beta0 = 0, amp = 0, phase = -25, mu_EI = 0, mu_IR = 0, mu_RS = 0, rho = 0),
#   upper = c(Beta0 = 100, amp = 1, phase = 0, mu_EI = 100, mu_IR = 100, mu_RS = 100, rho = 1),
#   nseq = Nglobal
# )

# guesses <- runif_design(
#   lower = c(Beta0 = 0, amp = 0, phase = -15, mu_EI = 0, mu_IR = 0, mu_RS = 0, rho = 0),
#   upper = c(Beta0 = 25, amp = 1, phase = 0, mu_EI = 1000, mu_IR = 1000, mu_RS = 1000, rho = 0.01),
#   nseq = Nglobal
# )

# guesses <- runif_design(
#   lower = c(Beta0 = 0, amp = 0, phase = -15, mu_EI = 0, mu_IR = 0, mu_RS = 0, rho = 0),
#   upper = c(Beta0 = 15, amp = 1, phase = 0, mu_EI = 10000, mu_IR = 10000, mu_RS = 10000, rho = 0.001),
#   nseq = Nglobal
# )

# guesses <- runif_design(
#   lower = c(Beta0 = 5, amp = 0, phase = -10, mu_EI = 0, mu_IR = 0, mu_RS = 0, rho = 0),
#   upper = c(Beta0 = 10, amp = 0.3, phase = 0, mu_EI = 10000, mu_IR = 10000, mu_RS = 10000, rho = 0.0001),
#   nseq = Nglobal
# )

# guesses <- runif_design(
#   lower = c(Beta0 = 5, amp = 0.75, phase = -10, mu_EI = 0, mu_IR = 0, mu_RS = 0, rho = 0),
#   upper = c(Beta0 = 15, amp = 1, phase = 0, mu_EI = 10, mu_IR = 500, mu_RS = 500, rho = 0.0001),
#   nseq = Nglobal
# )

guesses <- runif_design(
  lower = c(Beta0 = 0, amp = 0, phase = -5, mu_EI = 0, mu_IR = 0, mu_RS = 0, rho = 0),
  upper = c(Beta0 = 10, amp = 1, phase = 0, mu_EI = 1, mu_IR = 10, mu_RS = 1, rho = 0.005),
  nseq = Nglobal
)

fixed_params <- coef(flu_seirs, c("N", "S0", "E0", "I0", "R0", "k"))

global_results <- foreach(guess = iter(guesses, "row"), .combine = rbind, .packages = c("pomp", "tidyverse")) %dopar% {
  mf <- mf1 %>%
    mif2(params = c(guess, fixed_params)) %>%
    mif2(Nmif = Nmif)
  
  ll <- replicate(
    10,
    mf %>% pfilter(Np = Np) %>% logLik()
  ) %>% logmeanexp(se = TRUE)
  
  mf %>%
    coef() %>%
    bind_rows() %>%
    bind_cols(loglik = ll[1], loglik.se = ll[2])
} %>% filter(is.finite(loglik))

global_results %>%
  arrange(-loglik) %>%
  write_csv("seirs_lik_6.csv")

read_csv("seirs_lik.csv") %>%
  bind_rows(global_results) %>%
  filter(is.finite(loglik)) %>%
  arrange(-loglik) %>%
  write_csv("seirs_lik.csv")


