---
title: "Review comments on Project 9"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The introduction gives good background and motivation, with adequate references. The conclusion, which discusses the weak annual seasonality in addition to the solar cycle, is supported by the data analysis. Interactive plots are helpful to let readers see some alternative analysis without cluttering the main progression of the report.

### Points for consideration

1. Sec. 1.1. Data. You can focus on describing the variables that will actually be analyzed in this project.

1. One thing worth discussion about the data: since the observation of sunspot starts at an early period, is there any measurement error occurs in the data set, especially before modern instrumentation around, say, 1900.

1. Sec. 2.1. The sample ACF is described as "There are many successive points indicating auto-regression, however the strength of the relationship changes over time with a stronger relationship occurring at the trough of the cycle. This shows an obvious change in variance." But, it is really a change in covariance. The variance at each time point can be constant yet with the covariance showing oscillations as a function of lag.

1. Show time units in sample ACF plots.

1. Sec. 3.2. Identify mathematical inconsistencies in the AIC table, and discuss.

1. The AIC reported as lowest ($ARIMA(1,0,2)\times(1,0,0)_{12}$) is not in fact lowest, (e.g. $ARIMA(3,0,1)\times(1,0,1)_{12}$). This could use clarification.

1. Sec 4. The residuals show non-constant variance from the time plot. In that case, testing their marginal distribution becomes meaningless. Thus, the discussion of residuals could be improved. It also suggests a log or square root transformation to stabilize variances.
