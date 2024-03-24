---
title: "Review comments on Project 14"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The report provides a clear description of what the ARMA model framework is and what the different parameters mean, including discussion about the AIC.
It was a good choice to avoid the ARMA(4,3) in favor of the ARMA(1,0) model as that is quite a large model for ARMA. It was helpful to  include the final ARMA model formula with the actual fitted values.

<p>

Although the ARMA-GARCH framework wasn’t discussed in class, it is appropriate here, and the group provided a good explanation of what this model is.
The code was reproducible and was well written. The project is well-referenced.


### Points for consideration

1. Introduction. "Time series analysis can help us uncover patterns in the stock prices and provide valuable insights to investors hoping to make a profit." This is not obviously true given the efficient market hypothesis. It would be good to provide references to support this claim.

1. ACF and frequency analysis. These both have some indication of non-white noise. There is a substantial negative lag 1 autocorrelation and non-white periodogram, with increased power in higher frequencies. 

1. AR(1) is an appropriate choice of model. In principle, it is quite a big deal that ARMA(1,0) is substantially better than ARMA(0,0). This should therefore be discussed at length, in the context of the efficient market hypothesis. Extraordinary claims need extraordinary attention.

1. The interpretation of residuals seems correct. 

1. ARMA(1,0)-GARCH(1,1) is appropriate given the evidence.

1. It would be interesting to do a likelihood ratio test (or something similar) to asses the extent to which ARMA(1,0)-GARCH(1,1) improves over either ARMA or GARCH alone.

1. Markets should have noticed if a big, widely traded stock has predictability. It opens the possibility of statistical arbitrage. 

1. For the periodogram plot, the bandwidth value is given in the plot, however there is no dialogue provided about what this value means regarding this data. If this wasn’t an important value to discuss, it should be removed.

1. The description of what type of smoothing was used for the periodogram was quite vague. The use of non-parametric estimation was mentioned, but it was necessary to investigate the source code to find that 2 spans of size 30 were used in this estimation.

1. There is a missing definition of what the volatility metric is defined as, perhaps including it could prevent confusion with readers.

1.  Similarly to the ARMA section, writing out the final form of the learned
ARMA-GARCH model would ensure consistency across the whole report with what information is given.

1. It might be interesting to look for seasonality in volatility, e.g., related to September product releases.
