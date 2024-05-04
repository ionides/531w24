---
title: "Review comments on Project 16"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

An original model is developed to study flu dynamics, including consideration of both vaccinated and unvaccinated individuals. 

### Points for consideration

1. The introduction has no references. It makes exaggerated claims of what the project achieves, in somewhat elaborate language. This does not look like good scholarship. These are deficits most commonly associated with the use of ChatGPT. 

1. If you consider `auto.arima` as the best way to identify an ARIMA model, you should say what it does. Alternatively, it may be better to stick with a less sophisticated analysis that you fully understand. 

1. ARMA modeling for population dynamics may work better on a log scale.

1. Figures could have numbers and captions to help the reader.

1. Given the weak identifiability, the appropriate conclusions from this study should be fairly inconclusive. However, the methods and models could scale up to a larger data analysis with more statistical power.

1. The conclusions give good attention to the potential implications of the results.

1. Comment on the ARMA benchmark to assess the fit of the mechanistic model. It looks favorable for the POMP model, but log-ARMA might be a more competitive challenge.

1. In the formula for `S_u`, `vac_rate` should read `(1-vac_rate)`. This is correct in the code. 

1. The references are not cited in the text, just listed at the end. 

