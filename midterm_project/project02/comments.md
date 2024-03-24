---
title: "Review comments on Project 2"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The project is mostly well-motivated and well presented. It involves some ambitious data analysis techniques, including a bootstrap experiment. References are provided. The initial hypotheses are addressed by the data analysis to reach the conclusions.

### Points for consideration

1. "Bitcoin’s Long-term Periodicity" may be a misnomer. However, high power in low frequencies is a similar idea and well defined.

1. Avoid unprocessed R output. Either attend to R warning messages or suppress them. Suppress package loading notifications.

1. When comparing graphs, it is worth considering giving a shared axis so both are on a comparable scale.

1. There are arguably too many graphs. Better to focus on the key results that you want your reader to think about. Other groups have effectively used buttons to toggle to alternative analysis to let readers look deeper, if they choose, withouy losing the flow of the main argument.

1. The use of `auto.arima` is hard to interpret when you don't say what `auto.arima` does.

1. Diagnosis of invertibility, stationarity, and causality. This is the inverse root plotted - so no roots are outside the unit circle. However, plenty are on $x^2+y^2=1$. Further, AR and MA roots are very close to canceling in some cases.

1. Significant figures: don't show excessive precision (e.g., 7 sig. figs.) when reporting an imprecise estimate.

1. The sample ACF plots are incorrectly titled. In the code, they all correspond to log returns (which is the best thing to plot) whereas they are described variously as closing price and log closing price. 

1. Some biviariate time series analysis (e.g., Chapter 9 of the course notes) would help to address the question of the relationship between these stocks.

1. The code is fairly clear, with one portability error: file references should be relative rather than absolute. Avoid `btc_data <- read.csv("~/Downloads/STATS531/midterm/BTC_Data.csv")`.

1. Provide time/frequency units in plots. Do not present unexplained numbers (e.g., bandwidth in the periodograms). 

1. The bootstrap study is interesting, and a good idea. Unfortunately, it has a bug. The `arima.sim` command is missing the `ma` component. This means that the simulation is pure `ar`, which makes the model identifiable. The unidentifability is from the nearly canceling roots, which have been mistakenly removed. Without the reproducible code provided by the team, this would have been hard for the reader to debug.

1. The total value of Bitcoin is much larger than Dogecoin. It might help the readers if you can scale the price in terms of the total value of the currency.

1. There is an inconsistent conclusion: "While the model selected by `auto.arima` for BTC does not outperform the ARIMA(0,1,0), the significance of the rest of the models do not support the idea of `A Random Walk Down Wall Street'." This is like saying, "Although the data support X, the data do not support X."

1. The report writes, “we assume that a linear trend exists in the time-series datasets according to the consensus of the market”. It is unclear where this consensus is coming from, and this statement is missing a clear link to a reference.

