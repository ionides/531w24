---
title: "Review comments on Project 13"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The report develops a modeling analysis for COVID-19 in Taiwan, involving original modeling and data analysis.

### Points for consideration

1. There is too much R output, including unexplained warning messages.

2. Readers and writers may have many first languages, but we all have a commitment to being able to read and write in English for this course. In the context of this course, it is not reasonable to expect the reader to understand other languages.

3. The time plots would be more informative on a log scale. The sample ACF would also be more informative on the log of the data.

4. The three graphs at the beginning are confusing. They all have the same title, and it is not immediately obvious what the difference is between them (especially because the labels are not all in English). I eventually figured out that the first graph is showing all cases, while the next two are showing the first and second waves. It would be helpful to either make this explicit in the plot titles or include some text clarifying this before the plots are shown.

5. Aggregating cases over weeks can be a good way to avoid interacting with the weekly reporting pattern. Otherwise, it has to be addressed expicitly in models or other data analysis of daily data.

6. Preferring `auto.arima` because it also does some other things, that may or may not be appropriate and are unexplained and presumably not understood by the group, is a problematic way to pick statistical methodology. Better to stick with a less sophisticated analysis that you fully understand. 

1. The conclusions do not relate the ARIMA analysis to the POMP analysis. In fact, they don't discuss ARIMA at all, despite much of the report being spent on it. It would be good to compare log-likelihoods, though this requires care since the diffencing when I>0 affects likelihood comparisons. 

1. The ARIMA results are not always clear about which wave is under consideration. Results for the first wave have little relevance for the subsequent analysis.

1. The SARIMA code unfortunately sets `frequency=52` rather than `frequency=7` for 7 days in a week with daily data. The latter is the periodicity identified in the plots. 

1. The fitted value plot for ARIMA can look over-optimistic, since even a simple model such as "predict day n by the data on day n-1" would look similarly good in this representation.

1. The report is right that the QQ-plot shows evidence of non-normality, but some of the comments in the discussion are incorrect. The report mentions that the QQ-plot could look like this because confirmed case data often does not follow a normal distribution. The QQ-plot is showing the distribution of the residuals, not the case data. This makes the following comment about using a Poisson or negative binomial model incorrect as well.

1. Less time spent on ARIMA would allow more attention to the mechanistic modeling, which ends up being more central to the conclusions.

1. In the local search results, the log-likelihood does not change much from the beginning of the particle filtering. This suggests the search is not improving the results much, which is corroborated by the parameters not changing much either throughout the run. I suggest either running the local search for more iterations or choosing a different starting location. Because of this, your statement that most of the parameters converge is incorrect.

1. To evaluate your parameter estimates, it would be helpful to include a profile likelihood. This can help give a better idea if your parameters are accurately estimated. If this was omitted only because of lack of time, that should be mentioned.

1. Numbers and captions for figures would help the reader.

1. References should have name/title/year, e.g. APA format. All references should be cited in the text. The introduction has no references.


