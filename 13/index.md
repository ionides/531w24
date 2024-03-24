---
title: "Modeling and Analysis of Time Series Data<br>DATASCI/STATS 531. <br>Chapter 13: Likelihood for POMP models: Theory and practice"
author: "Edward L. Ionides"
output: html_document
---

We continue using material from the short course [Simulation-Based Inference for Epidemiological Dynamics](https://kingaa.github.io/sbied/) (SBIED). We review likelihood-based inference, and introduce the particle filter (also known as sequential Monte Carlo) which enables likelihood evaluation for general POMP models.
 We use the `pfilter()` implementation of particle filtering in pomp to investigate the likelihood surface for a Susceptible-Infected-Recovered (SIR) model.

Sections I and II review material in Chapter 10, from a slightly different perspective, and you may want to watch this at 1.5 x speed if you are already comfortable with the material.
Section III introduces the particle filter algorithm.
Section IV reviews the likelihood-based inference topics of Chapter 5, in the context of POMP models.
Sections V and VI look at the geometry of the likelihood for an SIR model.
Section VII looks deeper at likelihood inference - there is overlap with Chapter 5 but also some important new ideas.

| | ||
|:---------------|:---------------|:------------------------:|
| Slides  | | [pdf](https://kingaa.github.io/sbied/pfilter/slides.pdf) |
| Annotated slides | | [pdf](slides-annotated.pdf) |
| Notes   | | [pdf](https://kingaa.github.io/sbied/pfilter/notes.pdf) |
| **R** script  | | [**R**](https://kingaa.github.io/sbied/pfilter/main.R)      | Recording, Chapter 13, Sections I,II | The likelihood function and the likelihood of a POMP model | [(23 mins)](https://youtu.be/y0Wc6qt5qY0) | 
| Recording, Chapter 13, Section III | Computing the likelihood | [(27 mins)](https://youtu.be/uZZKglvJq0c) |
| Recording, Chapter 13, Section IV | Review of likelihood-based inference | [(12 mins)](https://youtu.be/68cX1ckgusY) |
| Recording, Chapter 13, Sections V,VI | Geometry of the likelihood function | [(31 mins)](https://youtu.be/oNpdp5WcdUQ) |
| Recording, Chapter 13, Section VII | From likelihood evaluation toward inference | [(17 mins)](https://youtu.be/ZJ7mmC0E3zs) |
                                                             |
-----------

<!--
| Annotated slides | | [pdf](slides-annotated.pdf) |
-->

----------------------

[Back to course homepage](../index.html)  
[Acknowledgements](../acknowledge.html)  
[Source code for these notes](http://github.com/kingaa/sbied/tree/master/pfilter)


----------------------
