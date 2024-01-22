---
title: "Syllabus for DATASCI/STATS 531 (Winter 2024) <br><it>Modeling and Analysis of Time Series Data</it>"
author: "Instructor: Edward L. Ionides"
output:
  html_document:
    toc: no
---

## Course information

Course components will include:

* classes Mon/Wed, 10-11:30 a.m. in 1360 East Hall
* homework
* [Piazza discussion forum](https://piazza.com/umich/winter2024/datascistats531)
* group midterm project, with individual peer review
* group final project, with individual peer review

Instructor contact information:

* email: ionides@umich.edu 
* web: dept.stat.lsa.umich.edu/~ionides
* office hours: Monday 11:30-12:30, Wednesday 1:00-2:00 in 453 West Hall. 

GSI: Jesse Wheeler

* email: jeswheel@umich.edu
* office hours: Tuesday, 8:30 AM - 10:00 AM; Friday, 12:30 PM - 1:55 PM; Angell Hall G219

Computing support. If you have a coding problem you cannot debug, it is often helpful to develop a [minimal reproducible example](https://stackoverflow.com/help/minimal-reproducible-example) that others can run to help you. You can share this, and the error message you obtain, with your group and/or on Piazza, or by email if necessary.

Course notes and lectures are posted at https://ionides.github.io/531w24/ with source files available at https://github.com/ionides/531w24

Supplementary textbook: R. Shumway and D. Stoffer _Time Series Analysis and its Applications_, 4th edition (2017). 
A [pdf](https://link.springer.com/book/10.1007%2F978-3-319-52452-8) is available using the UM Library's Springer subscription.

Recommended pre-requisites:

* Theoretical and applied statistics. STATS 500 and prior or concurrent enrollment in STATS 511, or equivalent. STATS 413 and STATS 426 is sufficient in conjunction with a strong math and computing background. For review, see "Mathematical Statistics and Data Analysis" by J. A. Rice.

* Linear algebra. A certain amount of basic linear algebra will be required. For review, see 
[www.sosmath.com/matrix/matrix.html](http://www.sosmath.com/matrix/matrix.html).

Statistical computing background:

* We carry out data analysis using R. There is no formal R prerequisite, but we will be working with R extensively and so you should allow extra time for this course if you are new to R programming. If you are not familiar with R then it is helpful to have some background in Python or a similar language to learn R fairly easily. The R Core Team's  [Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf) may be useful for review or study. Another resource is the [Tutorial Introduction to R by King, Field, Bolker and Ellner](https://kingaa.github.io/R_Tutorial/).

-----------

## Course outline


1. Introduction to time series analysis.

2. Time series models: Estimating trend and autocovariance.

3. Stationarity, white noise, and some basic time series models.

4. Linear time series models and the algebra of autoregressive moving average (ARMA) models.

5. Parameter estimation and model identification for ARMA models.

6. Extending the ARMA model: Seasonality and trend.

7. Introduction to the frequency domain.

8. Smoothing in the time and frequency domains.

9. Case study: An association between unemployment and mortality?

10. Introduction to partially observed Markov process (POMP) models.

11. Introduction to simulation-based inference for epidemiological dynamics via the pomp R package.

12. Simulation of stochastic dynamic models.

13. Likelihood for POMP models: Theory and practice.

14. Likelihood maximization for POMP models.

15. A case study of polio including covariates, seasonality & over-dispersion.

16. A case study of financial volatility and a POMP model with observations driving latent dynamics.

17. A case study of measles: Dynamics revealed in long time series.

--------------

## Groups

* Groups for the midterm project will be randomly assigned, around the third weak of classes.

* Groups for the final project will be re-randomized after the midterm project. 

-------------

##  Grading

* Weekly homeworks (25\%, graded following a [rubric](rubric_homework.html)). 
* A group midterm project (20\%, due 11:59pm on Friday 2/23). In special situations, you can request to write an individual project for the midterm and/or the final project. This may be appropriate if you have a particular dataset or scientific question that has motivated your interest in learning time series analysis. You can also ask your group if it is willing to join collaboratively on your project to make it a group project.
* Two individual anonymous peer review evaluations of other group midterm projects (8\%, due 11:59pm on Sunday 3/10). Each should be about 500 words, and should identify the main strengths and weaknesses of the project (from both technical and conceptual perspectives) as well as identifying points with room for improvement. The reviews should include discussion relating to reproducibility of the project's numerical results.
* A group final project (30%, due 11:59pm on Tuesday 4/23).
* Two individual anonymous peer review evaluations of other group final projects (12\%, due 11:59pm on Tuesday 4/30). Each should be about 750 words, and should identify the main strengths and weaknesses of the project (from both technical and conceptual perspectives) as well as identifying points with room for improvement. The reviews should include discussion relating to reproducibility of the project's numerical results.
* Participation (5%). To build a learning community, willingness to ask and answer questions in class is valuable. Similarly, both raising and answering questions on a discussion forum can help the entire class. The instructor and GSI will keep track of student participation following a [rubric](rubric_participation.html).
* Course letter grades are anticipated to be mostly in the A, A-, B+ range customary for courses at this level. In the past, this has corresponded to overall scores of approximately 95% for A+, 90% for A, 85% for A-, 80% for B+. However, the exact cutoff used will be determined in the context of the course for this specific semester.

### Grading credit for attribution of sources

Careful attribution of sources is fundamental to good scholarship.  The grader will look for demonstrated effort in submitted homework, with contributions that go beyond the sources.

+ Each homework will have a question asking about sources. You will be asked to explain which parts of your responses above made use of a source, meaning anything or anyone you consulted (including classmates or office hours or any website you visited) to help you write or check your answers. **All sources are permitted. Every source must be documented. Full credit requires being explicit about which parts you did without any collaboration or other source, as well as being explicit about which parts used or did not use each listed source.**

+ You should study the [posted rubric](rubric_homework.html) to undertand how your homework will be graded. 

+ The midterm and final project will also have a substantial grading component allocated to clear and scholarly assignment of credit to sources.

+ In group work, you are responsible for checking that the sources of your collaborators are properly documented. The whole group must take responsibility for material that the group submits. 

### The use of generative artificial intelligence (GenAI)

+ GenAI is a source. You are welcome to use it, but its role shoule be credited. Also, note that current GenAI can write poorly in some situations. You should be careful to edit and error-check any material written using GenAI. You take full responsibility for work submitted under your name.

----

## Student Mental Health and Wellbeing

University of Michigan is committed to advancing the mental health and wellbeing of its students. If you or someone you know is feeling overwhelmed, depressed, and/or in need of support, services are available. For help, contact Counseling and Psychological Services (CAPS) at 734.764.8312 and  https://caps.umich.edu during and after hours, on weekends and holidays. You may also consult University Health Service (UHS) at 734.764.8320 and https://www.uhs.umich.edu/mentalhealthsvcs.

----------

## Acknowledgements

Many people have contributed to the development of this course, including all former students and instructors. See the [acknowlegements page](acknowledge.html) for further details.

-----------


