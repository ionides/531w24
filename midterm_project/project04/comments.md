---
title: "Review comments on Project 4"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

Various time series techniques are used to study global climate change. The recent reduction in CO2 emitted by US is noted. 

### Points for consideration

1. Resolve the warnings at the start of the report, or suppress them.

1. Show less raw R output.

1. Numbered sections and figure captions would help the reader.

1. Specify the source of the data. The introduction is too brief (arguably, non-existent) and has no references.

1. The data are monthly, apparently, but that should be specified. Elsewhere, time units (months, years) should be specified.

1. Looking at the data, there is no need to do an ADF test for stationarity. There is a clear empirical trend. Also, it is not clear that a unit root AR process (assumed by ADF) is a reasonable null hypothesis for these data.

1. The SARIMA equations have errors: there should be four lag choices, $p$, $q$, $P$, $Q$, whereas this team has $P=p$, $Q=q$. Also, $B^{12}$ is written as $B_{12}$, which is not a usual way to write a power of $B$.

1. There is heteroskedasticity in the data. This may be due to growing amplitude of seasonality? That could be explored.

1. Frequency analysis. $T=1/0.09$ is approximately 12 not approximately 1.

1. Give units of time where appropriate, including for lags in sample ACF plots.

1. `auto.arima` is used without any explanation of what it actually does. Does it just select by AIC or does it do something else? Is there any reason to think it is better or worse than looking at an AIC table? An answer to this is that `auto.arima` rejects models with roots close to the unit circle, which may be a good decision but needs discussion.

1. The test of fitted values here may not be very demanding. For example, if you predicted each observation by the previous observation, one might get something that looks similar.

1. Model 2. "and the data is in fact stationary" could be reworded more formally and accurately.

1. "a light tailed normal distribution of residuals" should be "a heavy tailed normal..."

1. A difference $d=1$ with a seasonal difference $D=1$ was picked without clear justification.

1. For portability and easy reproducibility, avoid absolute path names for files.
