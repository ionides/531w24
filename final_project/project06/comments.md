---
title: "Review comments on Project 6"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths


### Points for consideration

1. The report is written as a working draft not a completed project. There is too much R code and raw output presented, and too little explanation or motivation for what is done.

1. The project has Weak motivation. It seems like a very standard task, comparing two models, which has been done many times before, including in DATASCI/STATS 531 

1. In the introduction, the data source/citation and time frame of their analysis should be included. The data is from 4/15/2019 to 4/12/2024, but this is not clear unless you look at the dataset.

1. The introduction could provide definitions for volatility and log-returns in case the audience is unfamiliar with financial analyses.

1. Some of the Data section plots are not discussed.

1. "The number of significant spikes in the ACF plot is 1, hence, we can assume that the AR term has value 1. Likewise, the number of significant spikes in the PACF plot is 4. Hence, it can be inferred that the MA term is 4." Here, both the counting and the reasoning are incorrect.

1. The ADF test is not designed for situations with time-varying sample variance, since neither the model used as a null hypothesis, nor the alternative model used to motivate the test statistic, have that feature.

1. The Kwiatkowski-Phillips-Schmidt-Shin (KPSS) test which was not covered in class, so it is especially appropriate to include a full definition and citation.

1. "Data is stationary" should better be written as "data can appropriately be modeled as stationary". Stationarity is a property of models, not data - see the class notes.

1. garch is not well explained. The `rugarch` package returns the log-likelihood using the `likelihood()` function. The authors should have figured out that the numbers only make sense if that is how it is.

1. In light of this, it is not clear what the quantity called AIC is. It is not the usual definition, minus twice the log-likelihood plus twice the number of parameters.

1. The stochastic volatility model could also have longer than Gaussian tails for the returns, and the ESS and conditional log-likelihood plots seem to confirm that. It would be interesting to look at the likelihood anomalies between the stochastici volatility model and the t-garch.

1. There is no reference to previous 531 projects. Project 6 is rather similar to project 7, which credits [531w22 project 7](https://ionides.github.io/531w22/final_project/project07/blinded.html). Except, the 2022 project is much better done, and avoids problems such as misunderstanding of log-likelihood shared by both 2024 projects 6 and 7.

1. Numbered figures and captions would help the reader.


