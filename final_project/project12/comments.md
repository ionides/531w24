---
title: "Review comments on Project 12"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

A well-written project, paying careful attention to various issues developed in the class: ARMA benchmarks (here, appropriately using a log scale); inconsistent ARMA maximization; creative model development looking to fit key features of the data and science balanced against a desire for model simplicity; profile likelihood revealing weak identifiability; appropriate conclusions showing appreciation for the successes of the data analysis as well as its limitations.

### Points for consideration

1. Vaccination is an important phenomenon for COVID-19 transmission in this time interval. It is given some consideration in the discussion, but does not seem to be accounted for in the model. Waning immunity is addressed, but the model only permits transmission to R via infection, not vaccination.

1. Consider the following analysis: "From the plot of the residuals over time, the residuals are centered around zero. The variance also appears to be constant throughout the plot." The residuals being centered around zero is a mathematical necessity, and says nothing about the model fit. The variance may show some heteroskedasticity, but not extreme.

1. A well-executed project. It only has small novelty relative to previous class projects, but combining a bit of novelty with careful technique meets the requirements of a strong cours project. 


