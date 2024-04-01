---
title: "Modeling and Analysis of Time Series Data<br>DATASCI/STATS 531<br>Chapter 15: A case study of polio including covariates, seasonality & over-dispersion"
author: "Edward L. Ionides"
output: html_document
---

We continue using material from the short course [Simulation-Based Inference for Epidemiological Dynamics](https://kingaa.github.io/sbied/) (SBIED). Chapter 15 is Lesson 6 of SBIED. This case study of polio demonstrates time series data analysis via a mechanistic model. It also develops various topics of general interest for inference on POMP models:

* Covariates. In Section I, we see that the POMP framework allows arbitrary dependence on covariate time series, and how to implement this in **pomp**.

* Seasonality. In Section II, we model seasonality using a periodic covariate. In Section III, we implement non-parametric seasonality using a periodic spline basis.

* Over-dispersion. Poisson and binomial distributions have their variance defined as a function of the mean parameter, which may not be appropriate for the data. In Section II, we discuss the use of the negative binomial distribution and discretized normal distribution to address this. Another approach to over-dispersion is gamma noise on transition rates, which is carried out in a [measles case study](https://kingaa.github.io/sbied/measles/) that we may cover later, time permitting.

* Workflow issues. Section IV discusses ways to avoid recomputing results unnecessarily when using Rmarkdown. It also presents a way control run time so that a single switch in the code moves between a debug setting, a preliminary set of results, and a final computationally intensive calculation.

Sections VI and VII follow the same route we took for the Consett measles analysis. This workflow is common to many POMP models across diverse applications.

---------------

| | ||
|:---------------|:---------------|:------------------------:|
| Slides  | | [pdf](https://kingaa.github.io/sbied/polio/slides.pdf) |
| Notes   | | [pdf](https://kingaa.github.io/sbied/polio/notes.pdf) |
| **R** script  | | [**R**](https://kingaa.github.io/sbied/polio/main.R) |
| discussion question | | [html](discussion.html) |
| Recording, Chapter 15, Sections I | Covariates in POMP models and their pomp implementation | [(5 mins)](https://youtu.be/TmlPMl_GkT8) | 
| Recording, Chapter 15, Section II | A POMP model for historic polio in Wisconsin | [(15 mins)](https://youtu.be/zBPvdscwZGo) |
| Recording, Chapter 15, Section III | A pomp implementation of the polio POMP model | [(9 mins)](https://youtu.be/FoQGr3hq5Xk) |
| Recording, Chapter 15, Sections IV | Data analysis logistics: tools for a pomp workflow | [(12 mins)](https://youtu.be/-Qr8Dzgfyww) |
| Recording, Chapter 15, Section V | Persistence of polio | [Lecture video (7 mins)](https://youtu.be/13KBab1MnbU) |
| Recording, Chapter 15, Section VI | Likelihood maximization for polio | [(15 mins)](https://youtu.be/xGi9WLUwKWg) |
| Recording, Chapter 15, Section VII | A profile likelihood for polio | [(7 mins)](https://youtu.be/O2OMIPukzVI) |
Worked solution to Exercise 6.1 | | [HTML](https://kingaa.github.io/sbied/polio/algorithmic-parameters-exercise.html)                                      |
| Worked solution to Exercise 6.2 | | [HTML](https://kingaa.github.io/sbied/polio/initial-values-exercise.html)                                              |
| Worked solution to Exercise 6.3 | | [HTML](https://kingaa.github.io/sbied/polio/starting-values-exercise.html)                                             |
| Worked solution to Exercise 6.4 | | [HTML](https://kingaa.github.io/sbied/polio/demography-exercise.html)                                                  |
| Worked solution to Exercise 6.5 | | [HTML](https://kingaa.github.io/sbied/polio/convergence-exercise.html)                                                                      |
-----------

<!--
| Annotated slides  | | [pdf](slides-annotated.pdf) |
-->

----------------------

[Back to course homepage](../index.html)  
[Acknowledgements](../acknowledge.html)  
[Source code for these notes](http://github.com/kingaa/sbied/tree/master/polio)


----------------------
