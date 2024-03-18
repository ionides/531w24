---
title: "Review comments on Project 11"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

1. A clearly written, scholarly project.

1. The code is clean, well commented, and runs successfully.

1.  Effective use is made of alternative plots toggled by a button to investigate variations in the analysis.

1. A nice demonstration of ChatGPT for formatting R output using kable.

### Points for consideration

1. The use of ADF is inappropriate in the presence of seasonality - it is a clear feature of the data, yet it does not appear in the null model or the usual alternative for the test.

1. There is an error in the mathematical expression of the SARIMA model since they should use $p$, $q$, $P$, and $Q$ as the order of the AR and MA polynomials instead of $p$ for all of them. Parameters should be explained.

1. Conclusion. "The magnitude of the autocorrelation bars gradually shrinks over time" is an artifact. The usual 1/N normalizing constant in the sample autocovariance means that it necessarily decays at lags approaching N.

1. Extensive use is made of the Ljung-Box test. This statistic can be useful to look at when there is uncertaintly about whether the sample ACF is conclusive for or against the white noise hypothesis. However, generally, the Ljung-Box statistic is less informative than the sample ACF.

1. Comparing likelihood values to assess the value of deseasonalizing or detrending is tricky. How many degrees of freedom does the detrending or deseasonalizing us up?

1. There are longer-than-Gaussian tails to the residuals. This may or may not be severe enough to affect the results, but should be noted. A normal quantile plot is more sensitive to showing this than a histogram.

