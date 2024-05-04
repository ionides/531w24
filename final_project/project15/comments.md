---
title: "Review comments on Project 15"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The group put in thought and effort to apply epidemic models in the POMP framework to a new disease system, not covered in class. They find that the middle east respiratory syndrome (MERS) dynamics do not fit standard epidemic models well in the human population, and are better explained as spill-over from camels. They show this can lead to dynamics resembling the human case count data. 

### Points for consideration

1. It is okay to use data from Kaggle, but the description of datasets on Kaggle can be limited. It is better to identify an original source with a complete description.

1. For highly peaked count data, consider plotting on a $\log(x+1)$ scale.

1. Linear models and autocorrelation analysis may also be better applied on a log scale in such cases.

1. The seasonality plot is a good way to infer absence of a clear seasonality.

1. The likelihood ratio test is used to compare two models, where one is a nested version of the other. It is not correct to use the LRT to compare an ARMA and POMP model in this context.



