---
title: "Review comments on Project 1"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

A clearly written report, with clearly presented code, using a variety of time series techniques to investigate a question of public health interest. Constructive use of ChatGPT to assist the project development without harming the report by over-use.

### Points for consideration

1. "several" seems to be 1.2 million globally or hundreds in NYC, which is more than "several."

1. In the introduction, "root causes" are mentioned without explaining what they might be. Additional discussion of the data and the issues at stake would be helpful.

1. Using the decompose function is unclear as a method if the report doesn't discuss what it does.

1. "The ACF shows non-stationarity" is not necessarily true - a decaying and oscillating sample ACF can be consistent with stationarity.

1. Figures could be numbered and captioned for easier reference.

1. "verify that the first order difference of the number of people injured from vehicle is stationary.". To be more careful, we cannot verify that it is stationary, but we can (and do) reject the null hypothesis of a time-homogeneous linear process with a unit root. 

1. When interpreting the AIC table, and choosing ARIMA(4.1,3), look for inconsistencies in the table and for evidence of roots on the unit cicrle, and/or close to canceling. Also, if you choose a value on the edge on the table one may want to explore a bigger table.

1. "Unfortunately, we cannot compare the two models by purely using AIC as they are using the different amount of differencing" is wrong because the differencing is the same here.

1. "residuals... adhering to the zero-mean assumption." The residuals in a regression sum to zero by construction, not by assumption. It is similar in an ARIMA model.

1. The greedy algorithm to select $P=Q=1$ with $p$ and $q$ fixed from a non-seasonal model is reasonable, but in what sense does it guarantee "we have established that the $SARIMA(4,1,3)\times(1,0,1)_{12}$ model best fits the seasonal patterns observed in the data"?

1. The conclusion says, "highlighting the critical role of data-driven decision-making in public health and safety initiatives". This does not seem to be supported by the analysis. There is no explanation of how this model may help decision-making, and certainly no evidence provided to explain why such a model is critical for this.

1. One of the main results is discovery of seasonality, but this could be explained further and discussed: which months have high accident rates, and can you conjecture why?

1. For visualizing seasonality, the plot of superimposed annual cycles in Project 5 would be a good strategy.

1. It could be relevant to look for covariate time series, to carry out regression with ARMA errors or cross-correlation or coherence analysis to help understand factors explaining variations in the number of accidents. 

1. There are a healthy number of references. A consistent reference style, such as APA  ([https://apastyle.apa.org/style-grammar-guidelines/references](https://apastyle.apa.org/style-grammar-guidelines/references)) could be used.

1. The clickable format for the figures is not particularly convenient. The version in the text has fonts too small to read.

1. Additional proof-reading to correct small mistakes would remove distractions for the reader. 

