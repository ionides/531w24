---
title: "Review comments on Project 15"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

Various time series methods are used to confirm that Nvidia stock price closely follows standard financial theory.

<p>

A thorough introduction identifies a reasonable goal for time series analysis.

### Points for consideration

1. The candlestick plot is clearly explained and motivated. However, the lower plot in the figure seems not to be explained.

1. Sec. 2.2.1 "The daily log-return in 2023 is more volatile" is not clear from the plot. There is a big peak in 2023, but otherwise the variance seems lower than 2022.

1. Sec. 3.2. Basic mathematical finance suggests that a linear (or polynomial) trend model for stock prices is inappropriate. That is indeed what the team find, but it could be put in the context of basic background understanding of the system. Arguably, effort could have been better spent on different analysis.

1. Sec. 3.3.2. ADF test is appropriate for the log return data, since its null hypothesis (a generalization of a random walk) fits the data. For the differenced data, the ADF null is not very relevant.

1. Sec. 4.2.3. "AR roots inside the unit circle" should be "inverse AR roots inside the unit circle."

1. Sec. 4.2.4. Testing sensitivity as a consequence of an over-paramterized model is a good idea. However, the specific arugment that,"This adjustment is based on the rationale that no returns are initially observed when entering the stock market" is hard to understand. No returns being oserved is different from an observed return of 0.

1. Sec. 5. It is interesting to note that only the 3 outliers after 2022-10-14 interfere with the Gaussian modeling assumption. However, the efficient market hypothesis does not require that the distribution should be Gaussian.

1. Comparing volatility: A standard deviation in daily log-returns of 0.035 is used to state that the stock has a ‘moderate level of volatility’ (presumably in daily returns). It would have been good to give a frame of reference for that number and statement. How much volatility is considered ‘moderate’ when talking about stocks? The reader could use more context.

1. A missing component of the analysis is to look at models with time-varying volatility, such as GARCH. 

1. It would be interesting to look at the relationship between this stock and other measures - competitors, market indices, etc - which could be done using regression with ARMA errors.

1. Captions and numbers for figures and tables would be helpful.

1. The conclusion that the stock satisfies the efficient market hypothesis to within statistical error (i.e., it is unpredictable) is an anticlimax. This is the usual assumption for markets. 

1. The project focuses heavily on showing whether or not the stock price is conducive with the Efficient Market Theory. However not much is explained about the theory or how, if it was true, it would be equivalent to showing that the stock price followed a random walk. Understanding that this report is written for graduate level statisticians, who may not know much about this, additional clarification would be appropriate.

