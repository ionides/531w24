---
title: "Review comments on Project 6"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The research goal is clearly stated, reasonable, and consistent with what is done. The code ran smoothly. The smallest absolute root table is a nice complement to the AIC table.

### Points for consideration

1. In the power consumption plot, why is there a big drop in late June?

1. The QQ plot showing long tails does not violate the white noise assumption, but it does violate Gaussian white noise.

1. The Seasonal ARMA component assessed on daily data, with the local ARMA assessed on hourly data. This is an unusual approach, though it makes some sense. 

1. Residuals show regions of high variance, which should be discussed.

1. Plotting fitted values and the data can give over-confidence in the fit. For example, just plotting the previous time point as a predictor might look quite good.

1. For the coherence plot, the peaks correspond to weekly frequencies, except the 1/2 week period which is surprising.

1. ARMA(0,0) errors seems reasonable in this situation.

1. The conclusion is a fair representation of what has been shown. One question, how does "the data used for fitting is not stationary enough" explain the results?

1. Good style for methods explanation: the project briefly presents the methods used and gives references for further details.

1. The code could have been cleaned up to help readers (e.g., remove irrelevant commented code).

1. There are some inconsistencies in the AIC tables which are not mathematically possible under accurate likelihood maximization and evaluation which should be noted and discussed.

1. The team says that they combine the $ARIMA(2,1,0)$ and $ARIMA(1,1,0)$ models to get the $SARIMA$ model. However, they end up fitting a $SARIMA(2,0,0)\times(1,1,0)$ model and set `order = c(2,0,0)` in their code.

