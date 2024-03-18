---
title: "Review comments on Project 5"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The report has clear motivation and data analysis leading to well written conclusions. Most codes are concise and have informative naming convention.  In addition, the project conducts a successful prediction that matches the motivation well. The report contains an extensive reference section.

### Points for consideration

1. Plotting a histogram of the raw data may be less insightful than looking at residuals. The raw data is a mix of trend and noise, so the marginal distribution of the data may be uninformative.

1. Incorrect interpretation in "The gradual decline of the ACF bars as the lag increases suggests that the time series data is likely non-stationary, as the correlation with past values slowly diminishes rather than cutting off sharply." Cutting off sharply distinguishes MA models from AR models.

1. Finding non-stationarity via ADF may not be the best way to see if there is evidence for a trend (rather than for a random walk). Formally, the ADF test checks A against B; you find there is evidence to support doing A rather than B so you proceed to do C. Here, A is a unit root AR model; B is a stationary ARMA model; C is a nonlinear trend plus stationary noise.
Nevertheless, it is reasonable to carry out subsequent SARMA modeling on detrended data.

1. The STL procedure used is well described.

1. Nice presentation with different versions of the plots, toggled by a button.

1. For the $SARIMA(1,0,0)\times(3,0,2)_{12}$, many of the roots lie very close to the unit circle. This is somewhat problematic and should be discussed. The seasonal P, Q choices in the  model may be too big.

1. It is an empty statement to notice that "The residuals are centered around 0, so the constant mean function assumption is valid." Residuals are centered because of the mathematical consequences of fitting to the data, regardless of how well the model fits.

1. Seasonality plot, showing all years superimposed in different colors, is an effective way to visualize seasonality.


