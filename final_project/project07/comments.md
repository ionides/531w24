---
title: "Review comments on Project 7"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

Many people are curious about the stock market, and so they can relate to questions about the statistical behavior of stocks. Apple is a culturally and economically significant company, so readers may be especially curious about it.

### Points for consideration

1. The introduction has no references, and only weak motivation. It would be good to clarify the practical goal of fitting a model, and to relate the data analysis to that goal.

1. The report is written like a preliminary investigation, including irrelevant unformatted R output and not much text.

1. The time series decomposition is not well explained. What does "seasonality" mean here?

1. ADF test is not designed for situations with time-varying sample variance, since neither the model used as a null hypothesis, nor the alternative model used to motivate the test statistic, have that feature.

1. ARMA modeling is known to be a poor choice for financial markets, so it is not worth dedicating a substantial fraction of the project effort to it.

1. The GARCH AIC values are clearly measuring something different from the standard definition of AIC used for the ARMA AIC table. So, what are the numbers being presented?

1. A natural way to combine the different ananlysis sections would be to compare log-likelihood or AIC for the different models under consideration. That would involve resolving the problem of what the code calculates for the number called AIC for GARCH.

1. The asymmetric GARCH (AGARCH) is not defined.

1. A curious feature of the likelihood search for the POMP model is that a small fraction of searches find higher likelihood with $\phi$ around 0.9, whereas most searches find $\phi$ very close to 1. This could be noted and discussed, even if there was no time to resolve it.

1. The conclusions should be thoughtful about limitations as well as pointing out the positive results. For a course project, on a short timescale, there are bound to be weaknesses. Here, for example, the effective sample size is sometimes rather small. One solution would be to add long tails (t, not normal) to the stochastic volatility model, just as was done for GARCH.

1. References should have titles, authors and dates, in a standard format such as APA. There should also be more citations in the text.

