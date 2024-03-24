---
title: "Review comments on Project 3"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

A solid analysis and coherent narration in presenting the patterns of the Federal Funds Rate and unemployment data in the US. The report begins by providing personal motivation on the issue of monetary policy and its relative unemployment level, which then affects and is affected by the global economy. The source code is reproducible and readable. The cross-correlation plot is relevant and helpful. The report has adqeuate references.

### Points for consideration

1. Numbering sections, figure captions, tables and equations would make peer review easier.

1. AIC table: ARMA(4,3) is the lowest AIC, not ARMA(4,2)

1. "the MA roots for ARMA(4,2) is very close to the margin" is noted. Also, the MA roots almost match two of the AR roots. So, how do we act on this information?

1. The sample ACF plots for residuals curiously have some annual periodicity despite being deseasonalized. 

1. The time unit for the ACF plot would be helpful.

1. Raw R output is distracting, especially when it is not all explained.

1. For the simulation study, various of the MA(1) and MA(2) estimates are outside the interval [-1,1], which looks implausible.

1. The KPSS test is not well explained. What is the precise null?  Software may describe the null as "stationary" but this is not sufficient for a careful statistical analysis. This detail may be relevant for assessing the appropriateness of the test.

1. ADF tests the null hypothesis of a unit root Gaussian ARMA model. Having made this test, and not rejected the null, why do you proceed to remove a trend? According to the ADF model, one should take a difference instead.

1. Looking at the presented periodogram plot, it seems there is evidence of cyclical
behavior of monthly interest rate, as the sliding confidence intervals show a significant
difference between the highest and adjacent peaks. Therefore, it seems not correct to say "the
frequency domains of the plots are excessively broad, suggesting a lack of inherent periodicity
within the dataset." There is a corresponding oscillatory lag correlation in  the ACF plot
presented before these periodograms, which is also not discussed.


1. Model selection. An ARIMA(2,1,4) is chosen despite having roots very close to the unit circle and close to canceling. These should be noted, and likely the model should be avoided. Also, note inconsistencies in the AIC table.

1. "According to the QQ plot ... the residuals are almost normal". No, this shows much longer than normal tails.

1. The ACF plots of the ARMA residuals should ideally have better titles than `Series arma11$residuals`.

1. Observed vs fitted for one step predictions is not a hard test. How much better is it than predicting using last month?

1. "Nevertheless, the coefficient of Federal Funds Rate is merely -0.0548, considerably smaller than the coefficients of other terms in the ARIMA(2,1,2) model." It is a mistake to compare scales between quantities with different units.

1. "Nevertheless, the coefficient of Federal Funds Rate is merely -0.0548, considerably smaller than the coefficients of other terms in the ARIMA(2,1,2) model." This is making a causal interpretation which was explained above to be inappropriate. The sign doesn't fit the usual macroeconomic understanding of the causal effect.

1. The last paragraph of the conclusion is poorly written and unclear, despite using some sophisticated words. It is written in the style of ChatGPT.

1. Figures should have captions, ideally numbered. Axis labels should have units.

1. Coherency and phase spectrum might be helpful to look at the relationship between unemployment and interest rates.
