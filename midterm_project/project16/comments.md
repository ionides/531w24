---
title: "Review comments on Project 16"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

A well motivated data analysis, studying an important economic transition currently occurring in personal transport.

### Points for consideration

1. The introduction is too brief. The motivation section, which could be part of the introduction, gives numbers without reference to a source.

1. References could use a standard format, such as APA ([https://apastyle.apa.org/style-grammar-guidelines/references](https://apastyle.apa.org/style-grammar-guidelines/references))

1. Adding numbers for sections and captions on figures/tables would make the project easier to review.

1. When importing data, the treatment of Jan 2024 seems reasonable.

1. "The linear trend in the log scale plot encourages us to plot the differences." Differences are most effective when the data are well modeled by a random walk. If there is a linear trend plus noise, fitting a linear trend may work better.

1. ARIMA model. A large model is proposed. This may be unstable. Also, there is evidence of imperfect maximization, which should be discussed.

1. It is somewhat surprising to find the strong 3-month cycle. Is this due to product development on a quarterly time scale?

1. The team infer that a unit MA root may suggest unnecessary differencing, which is correct. However, replacing that with ARMA does not fix the problem since the estimated model ends up with a unit AR root instead. A linear trend model might fix that.

1. $SARMA(5,4)\times(1,0)_3$ is an unusual choice. Usually, we use `period=12` for monthly data. Also, when the seasonal period is shorter than the number of AR and MA terms, the SAR component does not play much role in the model apart from adding one more autoregressive root.

1. The parameters used to smooth the periodogram are not reported. Also, the comparison between that method and the AR estimated spectrum is not discussed. 

1. Residual analysis for ARIMA. The assertion that "The plots of residuals all indicate that the residuals are stationary white noise with a distribution close to Gaussian" is not supported by the evidence. The Q-Q plot shows long tails, also evident from the histogram. The time plot shows non-constant variance. 

1. Residual analysis for SARMA. The team describe the residuals as "distributed close to normal" but they would be better described as somewhat long tailed relative to Gaussian. The team note that conclusion from some diagnostic plots, but the explanation should be consistent.

1. The prediction intervals seem rather wide. Perhaps that is a consequence of using a rather large model? One could try other models to experiment. 

