---
title: "Review comments on Project 7"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

A well-written introduction, describing a problem of fundamental interest that is within the scope of this course. Each graph, table and figure forms part of a coherent development. 

### Points for consideration

1. The investigation stops short of answering the question posed in the introduction. Tools in the course (e.g., regression with ARMA errors, applied to the data or an estimate of the variability in short time intervals) could have been used to answer the original question about whether there are detectable changes over time.

1. A good number of references. A consistent reference style, such as APA  ([https://apastyle.apa.org/style-grammar-guidelines/references](https://apastyle.apa.org/style-grammar-guidelines/references)) could be used.

1. "To find the optimal model" could be reworded, since it is hard to define exaxtly what "optimal" means, and that may be context-dependent.

1. The frequency domain analysis shows that there is some annual seasonality. That cannot be explained by a low-order autoregressive model, so the parametric spectrum estimate fails to see it. The ARMA analysis missed it for the same reason. It would not be surprising to find that precipitation has an annual cycle, and perhaps a surprising thing is that this pattern is quite weak: precipitation is statistically fairly uniform through the year.

1. Ideally, one would search jointly for $p$, $q$, $P$ and $Q$ in $SARMA(p,q)\times(P,Q)_s$. If that is prohibitively difficult, it may be best to look for $P$ and $Q$ first, otherwise the values of $p$ and $q$ will be chosen to help explain the seasonality, leading to a larger model. That seems to be the case here, since after choosing $p=q=3$, even $P=1$, $Q=0$ has singularity problems leading to `NaN` standard errors.

1. The AIC table is mathematically inconsistent: AIC increases more than 2 units going from (3,3) to (4,3). This should be noted and interpreted.

1. The `NaN` values for the Fisher standard errors of the $SARMA(3,0,3)\times(1,0,0)_{12}$ shows numerical instability and should be a clue that this is probably too many parameters to fit to the data.

1. A periodogram of the monthly average data might show the seasonality fairly clearly.

1. The description of the residual QQ-plot is not right. "The QQ-plot shows that the distribution of the residuals has slightly lighter left and right tails than normal distribution" should read "longer right tails and shorter left tails than the normal distribution."

1. The introduction invites us to think about extreme events, which may not show up well on monthly-aggregated data. This should at least be noted when deciding to aggregate the data.

1. Some plots are missing units for time and frequency.

