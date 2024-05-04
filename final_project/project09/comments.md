---
title: "Review comments on Project 9"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

### Points for consideration

1. Too much unformatted and undescribed R output. Figure numbers and captions would help the reader. 

1. ARMA modeling is known to be a poor choice for financial markets, so may not be worth much space in the report. Here, there are many ARMA figures, which are not explained and don't contribute much.

1. Perhaps ARMA-garch is less well motivated than t-garch? The latter can fit long tails (which are present) and does not attempt to explain autocorrelations (which are expected to be small anyway, according to the efficient market hypothesis).

1. It is interesting to investigate the possibility of simplifying the leverage model - that is the sort of analysis which the flexibility of the POMP model class permits. 

1. The ARMA(5,5) inverse roots are essentially on the unit circle, indicating numerical instability at the boundary of the causal, invertible parameter space. Concluding this is a good, stable model is wrong. There is no point making the diagnostic plots if you ignore the problems they reveal.

1. The decreasing likelihood through the search iterations suggests model misspecification: the noise in the parameters included for the parameter search is needed to explain the data.

1. The global search has not converged; `H_0` continues to decrease, for example.

1. The code variable `sigma_eta` is not explained in the mathematical description of the model.

1. When $\phi=1$, the model has some singular behavior, since then $\sigma^2_{w,n}=0$ for all choices of $\sigma_\eta$ and $G$. Values close to $\phi=1$ occur often. This problem can only be seen if the full model is written out, or one looks at the code. Nevertheless, it may explain some weird convergence diagnostic plots that could have been noticed and used to track down the issue.



