---
title: "Review comments on Project 12"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

A well-presented data analysis using a range of time series methods to study electricity consumption patterns. 

### Points for consideration

1. The introduction is written in the style of ChatGPT, with elaborate language, coherent discussion of relevant points, but a relatively distant and imprecise relationship to the concrete goals and accomplishments of the project. The text might have seemed evidence of reasonable effort in previous years (apart from the complete absence of references) but now Chat GPT is available, an introduction that is no better than basic ChatGPT output is weak.
 <p>
 To understand this, it may be helpful to think of a similar transition that occurred with the arrival of Wikipedia. Before Wikipedia and Google Scholar, it was impressive when people managed to track down the scientific background for their analysis. Nowadays, doing that is fairly quick, and the difference between a mediocre project and a strong one is whether the background is well explained in the specific context of the data, goals and accomplishments of the project.
 <p>
  Submitting ChatGPT-like text for publication in a scientific journal, or for a project report in an industry job, would be considered inadequate. For Masters level projects, the expectation is to learn how to write statistical analysis at a professional level.

1. Introduction and objectives are shorter than expected.

1. Sec. 2 describes the data as "total global household electric power" but it is atually just one house.

1. Sec. 2.2.1. "Due to the dataset’s one-minute sampling rate, simply dropping individual rows with missing data could potentially lead to significant fluctuations in daily power consumption." This may be an incorrect assessment. Missing a few minutes would not affect the daily rate much.  

1. Sec. 2.2.3. Summaries of the full dataset are hard to interpret when there is trend or periodicity. The large range can be due to the trend or seasonality rather than because of highly noisy data.

1. Removing large and small measurements may be reasonable if they are errors. If they are correctly recorded data, they may be important for the analysis. No reason is proposed to think they are errors, so why are they removed?

1. Monthly data may be too much aggregation (though that depends on the specific goals of modeling, which are unclear). Also, it leads to just 47 data points which is quite a short time series.

1. Sec. 5. You do not need a periodogram to show that there is annual periodicity in these data; it is already clear from the time plot. Perhaps there is not much that can be learned from the frequency domain for these data, in which case it is okay to say this.

1. Sec 6.1. "The ACF plot shows some significant correlations, indicating MA terms may be required." This is not a correct inference. AR terms can also lead to correlations in the ACF.

1. Plots should specify the units of time/lag/frequency etc.

1. Sec. 6.2. There are errors in the mathematical expression of the SARIMA model since they should use $p$, $q$, $P$, and $Q$ as the order of the AR and MA polynomials instead of $p$, $q$, $p$, $q$. The full equation assumes the seasonal differencing is $D=1$ and uses $u$ in place of $\mu$.

1. $SARMA(0,0,4)\times(1,1,1)_{12}$ is a reasonable choice of model.

1. The fitted model is not interpreted. Also, many of the parameters are insignificant according to their Fisher standard error estimates, which at least should be commented on.

1. Sec. 6.3.4. quadratic fit should read sarima fit.

1. There is no conclusion section. The introduction suggests that there might be important consequences of fitting statistical models to energy consumption data, but none of this is explored further in the context of the data analysis carried out. 

1. References are not cited inline, which makes it difficult for the reader to connect the content to the sources.

1. The specification of the 531w20 and 531w22 index of projects as sources is not enough to let the reader understand the relationship to specific sources, without extensive detective work.
