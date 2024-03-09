# Review Comments on Project 14

### Strength

Overall, many techniques from the class are tried out in a clearly presented analysis. And this is a really good try on using time-series analysis on Log-Returns of Apple Stock Price. In particular:

1. The references are carefully listed.

2. Unsatisfied with ARMA model, they tried to use ARMA-GARCH model to do some exploratory time series analysis, which is really innovative to deal with "heavy-tailed" problem of residuals.
3. It's a good job that you studied ARMA(4,3) out of curiosity and find the sign of cancelling roots.
4. When doing Volatility Analysis, you analyze the Volatility of Log-Returns Over Time combining with some context of times, which is excellent.
5. The questions posted in Introduction part are well answered in Conclusion part.

### Points for consideration

1. It may not be safe to trust the log returns computed from stock price since sometimes the sharp change of stock price may be due to the dividence. You need to use some words to clarify how the data is preprocessed and how you deal with some situations that might happen in real life(like dividence).
2. The size of the data may exceed the required limit 1000. In other words, you may need to subsample the data.
3. When choosing the model based on the AIC table, it remains unclear why there exists some inconsistencies in the AIC table. Maybe because of the numerical stability problem caused by too many data points mention in 2. .
4. It's acknowleged that the log-returns is nearly uncorrelated but the squared log-returns (volatility) is correlated. Maybe you can try using ARMA models on volatility?
5. Maybe you can provide some plots of fitting data vs original data to give us an intuitive impression on how the model fits. Also, you can also try to do some forecasting analysis to further diagnose and explore the model.
6. After adding GARCH into ARMA model, you claim that ARMA-GARCH model works better. However, the original purpose of using ARMA-GARCH model is to deal with the heavy-tailed problem of residuals. In the analysis, it seems that you only show that ARMA-GARCH model fit well but not show how it improves the previous ARMA model? Maybe it's more appropriate if you can find some index or use some plots to compare these two models.



# Review Comments on Project 16

### Strength

Overall, this comprehensive report has a very clear logical sequence and each part of the report is supported by sufficient words and codes. In particular:

1. The code-fold format is convenient for readers to view the report.
2. There is clearly explanation of research motivation, data description, how data is preprocessed and how Exploratory Data Analysis is conducted.
3. When exploring the trend of the time-series, it's well done that you find Log Differences of Car Sales seem to be stationary. Also, using "burn in" to explain the first few month which do not seem to be stationary is a really innovative perspect of view.
4. You did a careful job when selecting the best ARIMA model since you use Wilk's theorem and likehood test to verify ARIMA(6,1,2) is the best model.
5. After using spectrum to find the possible period cycle of a quarter of a year, you conduct SARMA model to verify the period, which is a good practice using periodgram to understand time series characteristics.

### Points for consideration

1. You claim that "you tried both a raw fit as well as a fit on log transformed data" but you don't seem to mention anything about the raw fit. Maybe you need to clarify this.
2. When dealing with unit MA roots, you claim that this indicates you integrated the model unnecessarily. It seems that this is not quite reasonable as we can see the AIC when adding integration is actually lower. (95.01 < 95.38)
3. Actually from the Normal QQ-plot we can see that the residual distribution are clearly heavier tailed than Normal distribution, maybe it' s because of some market fluctuation that cause the sales to extreme values and heavy tails. You could try to comment on it and give a more objective assessment on the model.
4. Maybe It's not safe to do likelihood ratio test using Wilk's Theorem between ARMA and SARMA models since the they are not 2 nested hypothesis.
5. It' s remains unknown why we observe an period of 3 month in periodgram but we get a worse result using SARMA. You mentioned that the QQ plot of SARMA seems to violate the normal distribution assumption of residuals, but is the result not the cause. Maybe it's worth a try to add integration in SARMA models (like SARMA$(1,1,0)_3$) here to better remove the trend in seasonity.