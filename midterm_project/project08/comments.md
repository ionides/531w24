---
title: "Review comments on Project 8"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

An interesting application of time series methods to space weather. A range of methods is applied, with a Loess decomposition being preferred to ARIMA modeling.

### Points for consideration

1. The project report is missing a title.

1. The introduction could better clarify and motivate the specific goals of the time series analysis. We don't model just for the sake of modeling, or forecast just for the sake of forecasting.

1. There are no equations anywhere in the text. For a technical statistical report, we expect some technical explanation of the models and methods involved.

1. Numbered captions for figures would help the reader. This is especially true in the context of helping peer reviewers, but the authors knew their report would be read by reviewers.

1. What is `flux1` and `flux2`? If we don't know more about what these are, it is hard to tell whether the analysis is appropriate.

1. What is `na.approx` from `zoo`? Why is it appropriate here?

1. One can guess which are the interpolated values, but it would be good to show them on the plot.

1. The periodogram for the residuals from the smoothed time series has a peak power driven by the nonparametric detrending process. The team has removed low frequencies, and so there is a peak corresponding to the highest frequencies not removed by the smoothing procedure. This is probably not a real scientific property of the data. That could be confirmed by looking at the frequency response function for the detrending operation. Or it can be avoided by calculating the periodogram of the raw data.

1. The choice of $d=1$ for the ARIMA analysis is not well discussed, though indeed that is probably the most reasonable value if one is to do ARIMA. The report spends most of its time developing an interesting alternative approach, so limiting discussion of ARIMA is fine. 

1. The STL decomposition is not explained, and the quantities `t.window` and `s.window` are not defined.

1. For "lags extending up to approximately 1750," it would be better to put in units. 

1. "These bounds are generally indicative of the threshold beyond which autocorrelations are deemed statistically significant." They provide a 95% coverage under the hypothesis of white noise. As soon as that hypothesis is rejected, they no longer have interpretation.

1. "We specify `seasonal = TRUE` due to the presence of an oscillating pattern." The model does not have a seasonal component.

1. The authors also don't state what criterion is used to choose the "best model" (ARIMA(2,1,2)).

1. Without explanation in the report, the source code reveals that `auto.arima` was used. In `forecast::auto.arima(max.p=50, max.q=50,
seasonal=TRUE, stepwise=FALSE)` with the default seasonal parameters `(max.P=2, max.Q=2)`, the
maximum value of $p+q+P+Q$ for the models tried is given by `max.order` (5 by default). So, it is likely
that the full parameter space described by the authors is never explored.
Using highly automated procedures requires care, and at the very least the team should let the reader know what was being used.

1. MAPE and MASE should be defined.

1. "MASE is greater than 1, suggesting that the forecasted values are not very accurate." Whether 1 is big or small should depend on the scale of the problem.

1. A wide range of frequencies is removed by this detrending. The maximum in the frequency domain may be just the edge where frequencies are no longer removed by the detrending - looking at the frequency response function for the detrending would help address that.

1. Some plots do not have units of time and frequency.

1. Residuals have non-constant variance, from the residual time plot.

1. STL decomposition after detrending has the result that the trend models the residuals from the detrending, which is noise. The seasonal component has small magnitude, since the data do not have substantial annual seasonality.

1. Predicting each component of an STL separately is an interesting idea. It seems to have some justification here, but the evidence is not enough to be reasonably sure: the only evidence is success at predicting on one particular window, which is a very high-variance evaluation. 
