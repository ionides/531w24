---
title: "Modeling and Analysis of Time Series Data<br>DATASCI/STATS 531<br>Chapter 14: Likelihood maximization for POMP models"
author: "Edward L. Ionides"
output: html_document
---

We continue using material from the short course [Simulation-Based Inference for Epidemiological Dynamics](https://kingaa.github.io/sbied/) (SBIED). Chapter 14 is Lesson 4 of SBIED. The main topic is likelihood maximization via an iterated particle filter. This enables a range of tools of likelihood-based inference to be applied---maximum likelihood estimation, likelihood ratio tests, profile likelihood confidence intervals, and AIC for model selection. Methods are demonstrated on a model for measles, but these techniques apply to the wide range of POMP models for which particle filtering is applicable.

| | ||
|:---------------|:---------------|:------------------------:|
| Slides  | | [pdf](https://kingaa.github.io/sbied/mif/slides.pdf) |
| Annotated slides  | | [pdf](slides-annotated.pdf) |
| Notes   | | [pdf](https://kingaa.github.io/sbied/mif/notes.pdf) |
| **R** script  | | [**R**](https://kingaa.github.io/sbied/mif/main.R) |
| Recording, Chapter 14, Sections I,II | Classification of inference methods for POMP models | [(16 mins)](https://youtu.be/OaKbivero6I) | 
| Recording, Chapter 14, Section III | Introduction to iterated filtering | [(15 mins)](https://youtu.be/4icXW5pdc5E) |
| Recording, Chapter 14, Section IV | Iterated filtering in practice | [(25 mins)](https://youtu.be/xHCcd_6TU9E) |
| Recording, Chapter 14, Sections V | Global likelihood maximization and profile likelihood | [(33 mins)](https://youtu.be/RFm_KbzkYXk) |
| Recording, Chapter 14, Section VI | Using likelihood and profile calculations to develop a data analysis | [(20 mins)](https://youtu.be/TL7e4jRg3Xw) |
                                                         |
-----------

<!--
| Annotated slides  | | [pdf](slides-annotated.pdf) |
-->

----------------------

[Back to course homepage](../index.html)  
[Acknowledgements](../acknowledge.html)  
[Source code for these notes](http://github.com/kingaa/sbied/tree/master/mif)


----------------------
