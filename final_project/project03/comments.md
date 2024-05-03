---
title: "Review comments on Project 3"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The group made some progress with the tricky issues involved in understanding the waves of COVID-19 infection. 

### Points for consideration

1. The project is very similar to [531w21 project 15](https://ionides.github.io/531w21/final_project/project15/blinded.html). It references that project once, but does not give full credit to the intellectual debt. Much of the code and the format of the report is directly taken from that project, without explanation. The model turns out to be more satisfactory for the situation of 2024 project 15. This project not only fails to go beyond the analysis of its source project, it is weaker and does not pay full credit to the source.

1. Usually, we only use seasonality in ARMA when there is a known forcing frequency (e.g., one year). Here, there is no particular reason to pick a SARIMA period. The report finds a period of about 4 weeks and then writes equations with a period of 12 weeks.

1. The units of frequency on the periodogram are not specified but seem to be cycles per year, not per week. So, the peak frequency is 0.23 per year, corresponding to low-frequency behavior that might be modeled as trend in an ARMA context.

1. The root plot shows some roots of the fitted ARMA are very close to the unit circle.

1. The AIC table shows some failures in maximization that are not pointed out: SARMA$(2,0,4)\times(1,0,1)$ to SARMA$(3,0,4)\times (1,0,1)$ and SARMA$(3,0,3)\times(1,0,1)$ to
SARMA$(4,0,3)\times(1,0,1)$, for example. The model that is chosen, SARMA$(1,0,5)\times(1,0,1)$, is rather large for this situation.

1. The residual histogram is wrongly described as nearly normal. It has long tails.

1. The ARMA forecasts anticipate a new peak. That is because of heterogeneity through time - for example, the sample variance of the data varies considerably through time.

1. It may be hard to explain the waves without including the limited protection that infection with earlier strains provided against later strains.

1. The time units on the time plot for the POMP model does not match dates, so it is hard to see where the $b_k$ terms switch over. The lag plot should also specify units of time.

1. The initial values of $E$ and $I$ are not discussed. In the code, they are set to the same values used by 2024 project 15, without explanation.

1. Pay attention to units. The observation times are coded in weeks, not days. So, other time units must also be in weeks for consistency. The mistakes arising here may be because the project borrows heavily from 2024 project 15, for which the observation times were coded in days.

1. Fixing $\mu_{EI}$ and $\mu_{IR}$ at 0.1/week (i.e., a 10 week expected duration) is especially problematic given the unit mistake.

