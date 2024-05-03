---
title: "Review comments on Project 5"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The project built on previous course projects while analyzing a new dataset. They developed a model capable of fitting four consecutive seasons of flu data by using a seasonal transmission rate. 

### Specific comments


1. Please give figures captions and numbers. For the time plot: show date, not just week number. For the frequency analysis: give units in the text and the plot.

1. Doing spectral analysis to detect the annual seasonality in this data is not necessary. One can do it as an exercise, but one could add appreciation that the conclusion was unsurprising after looking at the data.

1. The ARMA grid search is rather small - no more than 2 lags. Was that an intentional decision?

1. The fraction of the project devoted to ARMA and linear time series analysis is too large, considering that this analysis ends up being useful mostly as a benchmark for the mechanistic modeling.

1. Infectious disease dynamics, like many ecological systems, is better modeled by ARMA on a log scale.

1. Log likelihood for differenced models are not immediately comparable to those for the original data. One has to properly account for the transformation.

1. An interesting use of ChatGPT to propose consideration of a sinusoidal seasonal transmission.

1. In the initial pfilter, effective sample size (ESS) is always between 1990 and 2000, which is surprising. Perhaps the measurement model is extremely flat?

1. When describing the model parameter, the group misses discussion on the measurement model. Even though the readers can examine this in the code snippet they use, it can be useful for an understanding of their readers if they incorporate it in their report.

1. The conclusions correctly point out the preliminary nature of the findings. The mechanistic model has some promising features, but does not (yet) explain the data better than an ARIMA model.


