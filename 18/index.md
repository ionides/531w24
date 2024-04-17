---
title: "Modeling and Analysis of Time Series Data<br>DATASCI/STATS 531<br>Chapter 18: A case study of ebola: Model criticism and forecasting"
author: "Edward L. Ionides"
output: html_document
---

We return to another case study from the short course [Simulation-Based Inference for Epidemiological Dynamics](https://kingaa.github.io/sbied/) (SBIED). Chapter 18 is Lesson 7 of SBIED. 
We will focus on two new topics arising in the case study:

* Non-likelihood model criticism. So far, we have emphasized likelihood-based tools both for model fitting and diagnostic criticism. Here, we consider other statistics.

* Forecasts using POMP models can combine uncertainty due to stochasticity in the latent process, the measurement noise, and unknown parameters. We see how this plays out in an example.

|  ||
|:-------------|:--------------:|
| Slides   | [pdf](https://kingaa.github.io/sbied/ebola/slides.pdf) |
| Annotated slides  | | [pdf](slides-annotated.pdf) |
| Notes    | [pdf](https://kingaa.github.io/sbied/measles/notes.pdf) |
| **R** script   | [**R**](https://kingaa.github.io/sbied/measles/main.R) |
| Recording, Chapter 18   |  [(40 min)](https://www.youtube.com/playlist?list=PLluGwj6FGt2QuMxA6ZM4MGAMqE3r022Dd) |
| Model construction and analysis script | [**R**](https://kingaa.github.io/sbied/ebola/codes.R) |
| Supplement: constructing the Ebola models  | [HTML](https://kingaa.github.io/sbied/ebola/model.html) |
----------------------

<!--
| Annotated slides  | | [pdf](slides-annotated.pdf) |
-->

----------------------

[Back to course homepage](../index.html)  
[Acknowledgements](../acknowledge.html)  
[Source code for these notes](http://github.com/kingaa/sbied/tree/master/ebola)


----------------------
