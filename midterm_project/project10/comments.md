---
title: "Review comments on Project 10"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The section on limitations stands out as a relative strength. Also, the models and methods used are described clearly, though without adequate references.

### Points for consideration

1. The introduction (Sec. 1.1) is written in the style of ChatGPT, with elaborate language, coherent discussion of relevant points, but a relatively distant and imprecise relationship to the concrete goals and accomplishments of the project. The text might have seemed evidence of reasonable effort in previous years (apart from the complete absence of references) but now Chat GPT is available, an introduction that is no better than basic ChatGPT output is weak.
<p>
To understand this, it may be helpful to think of a similar transition that occurred with the arrival of Wikipedia. Before Wikipedia and Google Scholar, it was impressive when people managed to track down the scientific background for their analysis. Nowadays, doing that is fairly quick, and the difference between a mediocre project and a strong one is whether the background is well explained in the specific context of the data, goals and accomplishments of the project.
<p>  
Submitting ChatGPT-like text for publication in a scientific journal, or for a project report in an industry job, would be considered inadequate. For Masters level projects, the expectation is to learn how to write statistical analysis at a professional level.

1. Similarly, for Sec. 1.2, there is much sophisticated language but rather little concrete meaning. "This temporal specificity affords us a sophisticated lens through which to observe the evolving landscape of the cryptocurrency market, offering a meticulous chronological perspective of its fluctuations and tendencies." What does this mean? 

1. Section 2.1. Any interpolation method has weaknesses as well as strengths. Listing only the strengths (as done here) gives only part of the perspective. In particular, adding interpolated data points gives fictitious data points the same statistical weight as actual data points, leading to potential bias.

1. Section 2.2. Reducing 4000 data points to 100 "without sacrificing analytical depth" is likely impossible. Better to admit that a sub-sample was analyzed for convenience, rather than making a strong but unsupported claim such as, "The resulting dataset retained the temporal essence of the original data."

1. Section 2.3. The section on code implementation does not have much code, and can be dropped. There is no point describing your own code as "meticulous" since unsupported self-praise is avoided in technical writing.

1. Section 3.1. Better to plot data such as this on a log scale.

1. The statement "volatility [...] is vividly captured in the trend analysis" is not true according to the definition of volatility and trend. Volatility is a property of high frequencies, which have been removed from this plot.

1. Section 4. Presenting large amounts of R code and unprocessed output is hard to read.

1. There seems to be some confusion about whether BIC or AIC was used for model selection.

1. `auto.arima` is used without any explanation of what it actually does. Does it just select by AIC or does it do something else? Is there any reason to think it is better or worse than looking at an AIC table? An answer to this is that `auto.arima` rejects models with roots close to the unit circle, which may be a good decision but needs discussion.

1. Sec 4.1.2. A reference for GARCH would be appropriate, since the method was not covered in class. In general, more references would strengthen the report.

1. Sec 4.2.1. The comment "The Residuals from ARIMA plot does not show any obvious patterns, which suggests that the model has captured the data’s structure adequately." is incorrect. The plot shows much more variability in later time points. It shows that ARIMA modeling should have been done on the log scale.

1. Rather than showing a Ljung-Box test, it would be more informative to show the sample ACF of the squared residuals, while reaching the same conclusion.

1. Sec 4.2.2. The GARCH residuals also show severe model misspecification. GARCH could be appropriate for the difference of the log price, but not the price itself. The comment, "The plot of the standardized residuals does not exhibit any significant patterns or systematic behavior," is wrong.

1. "In our case, the ACF plot reveals that the correlations are within the confidence bounds" is not supported by looking at the plot. 

1. Sec. 4.3.2. "The increasing volatility reflects growing uncertainty in the market, highlighting the potential for larger price swings and the need for caution among investors and analysts." In fact, the detected increase in volatility is simply a result of failing to take the difference of logs before doing the GARCH analysis.

1. Sec. 5.1 "Our comprehensive time series analysis revealed a strong positive correlation between market sentiment and Bitcoin prices, supporting the hypothesis that sentiment significantly influences market behavior." This is a weak conclusion. Little is done to investigate this relationship. Do price increases lead to sentiment increases or vice versa? This conclusion assumes a causal direction without proper justification. At the least, one could look at lag relationships.

1. Stylistically, it would help if you removed irrelevant R code outputs from the final report. There are several print statements for things like loading packages, which clutter the final document. Another step you could take to improve the report's look is using the ‘kable’ package. This is used to format tables nicely in an RMD output. Also, there is an Appendix section at the bottom of the report, but it has no content. This should be removed from the final report.


