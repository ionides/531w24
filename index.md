---
title: "DATASCI/STATS 531 (Winter 2024) <br>'Modeling and Analysis of Time Series Data'"
author: "Instructor: Edward L. Ionides"
output:
  html_document:
    toc: yes
---

------

## Course description

This course gives an introduction to time series analysis using time domain methods and frequency domain methods. 
The goal is to acquire the theoretical and computational skills required to investigate data collected as a time series. 
The first half of the course will develop classical time series methodology, including auto-regressive moving average (ARMA) models, regression with ARMA errors, and estimation of the spectral density.
The second half of the course will focus on state space model techniques for fitting structured dynamic models to time series data. 
We will progress from fitting linear, Gaussian dynamic models to fitting nonlinear models for which Monte Carlo methods are required.
Examples will be drawn from ecology, economics, epidemiology, finance and elsewhere.

The course outline, course information and grading policies are described in the [syllabus](syllabus.html).

--------------

## Class notes and recorded lectures

1. [Introduction](01/index.html)

2. [Estimating trend and autocovariance](02/index.html)

3. [Stationarity, white noise, and some basic time series models](03/index.html)

4. [Linear time series models and the algebra of ARMA models](04/index.html)

5. [Parameter estimation and model identification for ARMA models](05/index.html)

6. [Extending the ARMA model: Seasonality, integration and trend](06/index.html)

7. [Introduction to time series analysis in the frequency domain](07/index.html)

8. [Smoothing in the time and frequency domains](08/index.html)

9. [Case study: An association between unemployment and mortality?](09/index.html)

10. [Introduction to partially observed Markov process models](10/index.html)

11. [Introduction to simulation-based inference for epidemiological dynamics via the pomp R package](11/index.html)

12. [Simulation of stochastic dynamic models](12/index.html)

13. [Likelihood for POMP models: Theory and practice](13/index.html)

14. [Likelihood maximization for POMP models](14/index.html)

15. [A case study of polio including covariates, seasonality & over-dispersion](15/index.html)

16. [A case study of financial volatility and a POMP model with observations driving latent dynamics](16/index.html). With [notes on how to run the code on the Great Lakes Linux cluster](16/README.html).

17. [A case study of measles: Dynamics revealed in long time series](17/index.html)

18. [A case study of ebola: Model criticism and forecasting](18/index.html)

<!--

There are further POMP case studies, in a similar style, on [Ebola modeling](https://kingaa.github.io/sbied/ebola/index.html), [measles transmission](https://kingaa.github.io/sbied/measles/index.html), and [dynamic variation in the rate of human sexual contacts](https://kingaa.github.io/sbied/contacts/index.html).

-->

--------

## Homework and participation assignments

Please read the [grading rubric](rubric_homework.html) before submitting homework.

* [Homework 0](hw00/hw00.html). Setting up your computational environment. Nothing to submit.


* [Homework 1](hw01/hw01.html), due Sun Jan 21, 11:59pm. 
[Solution](hw01/sol01.html).

* [Participation 1](participation/participation1.html), due Sun Jan 21, 11:59pm.



* [Homework 2](hw02/hw02.html), due Tue Jan 30, 11:59pm.
[Solution](hw02/sol02.html).

* [Participation 2](participation/participation2.html), due Tue Jan 30, 11:59pm.

* [Homework 3](hw03/hw03.html), due Sun Feb 11, 11:59pm.
[Solution](hw03/sol03.html).

* [Participation 3](participation/participation3.html), due Sun Feb 11, 11:59pm.

* [Homework 4](hw04/hw04.html), due Sun Feb 18, 11:59pm.
[Solution](hw04/sol04.html).

* [Participation 4](participation/participation4.html), due Sun Feb 18, 11:59pm.

* [Homework 5](hw05/hw05.html), due Sun Mar 17, 11:59pm.
[Solution](hw05/sol05.html).

* [Participation 5](participation/participation5.html), due Sun Mar 17, 11:59pm.


* [Homework 6](hw06/hw06.html), due Sun Mar 24, 11:59pm. 
[Solution](hw06/sol06.html).

* [Participation 6](participation/participation6.html), due Sun Mar 24, 11:59pm.

* [Homework 7](hw07/hw07.html), due Sun Mar 31, 11:59pm. Extended to Wed Apr 3.
[Solution](hw07/sol07.html).


* [Participation 7](participation/participation7.html), due Sun Mar 31, 11:59pm. Extended to Wed Apr 3.


* [Homework 8](hw08/hw08.pdf), due Sun Apr 14, 11:59pm.
[Solution](hw08/sol08.pdf).

* [Participation 8](participation/participation8.html), due Sun Apr 14, 11:59pm.

<!--

* There is no assigned homework for the last two weeks of the semester. You should work on your final project. The remaining lectures contain material that will be useful for your final projects.

-->



-------------------

## Midterm project

* [Information](midterm_project/midterm_project_info.html).

* [Midterm peer review report instructions](midterm_project/midterm_review.html)

* [2024 midterm projects](midterm_project/index.html)

* You are welcome to browse previous midterm projects. The [2022 midterm projects](http://ionides.github.io/531w22/midterm_project/) and  [2021 midterm projects](http://ionides.github.io/531w21/midterm_project/) have a posted summary of peer review comments. Earlier projects are also available, from [2016](http://ionides.github.io/531w16/midterm_project/), [2018](http://ionides.github.io/531w18/midterm_project/) and [2020](http://ionides.github.io/531w20/midterm_project/).


-------------

## Final project


* [Information](final_project/final_project_info.html)

* [Final peer review report instructions](final_project/final_review.html)

* [2024 final projects](final_project/index.html)

* You're welcome to browse previous final projects. The [2021](http://ionides.github.io/531w21/final_project/) and  [2022](http://ionides.github.io/531w22/final_project/)  final projects have a posted summary of peer review comments. Earlier projects from [2016](http://ionides.github.io/531w16/final_project/), [2018](http://ionides.github.io/531w18/final_project/), [2020](http://ionides.github.io/531w20/final_project/) may also be useful.

If building on old source code, note that there are some differences between versions of the software package **pomp**. The [**pomp** version 2 upgrade guide](https://kingaa.github.io/pomp/vignettes/upgrade_guide.html) can be helpful. There are various smaller changes between **pomp 2.0** and the current **pomp 5.6**.

--------

## Using the Great Lakes cluster

* Great Lakes access will be set up after the midterm project and used for the second half of the course.

* [Introductory notes](greatlakes/index.html) for using our class account on the greatlakes cluster. This is optional but may be helpful for your final project.

* If you are already familiar with using R on Great Lakes, all you need to know is the class account: ```stats531w24_class```.

* You are expected to use our class account only for computations related to DATASCI/STATS 531.

* Please share knowledge about cluster computing between group members, and/or on piazza, to help everyone who wants to learn these skills.

* Cluster-related questions can also be emailed to arc-support@umich.edu.

---------

## Acknowledgements and License

This course and the code involved are made available with an [MIT license](LICENSE).
Some components follow a Creative Commons Attribution non-commercial license.
A longer list of acknowledgments is [available](acknowledge.html).
