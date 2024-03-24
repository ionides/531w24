---
title: "Modeling and Analysis of Time Series Data<br>DATASCI/STATS 531<br>Chapter 12: Simulation of stochastic dynamic models"
author: "Edward L. Ionides"
output: html_document
---

As for [Chapter 11](../11/index.html), we use material from the short course [Simulation-Based Inference for Epidemiological Dynamics](https://kingaa.github.io/sbied/) (SBIED).  We develop a concrete example of the general POMP modeling framework, and we see the theory and practice of implementing a simulator for the model.

The Susceptible-Infected-Recovered (SIR) model used for this chapter is a central concept for epidemiology. For the purposes of STATS/DATASCI 531, we view it as one example of a mechanistic model, which exemplifies a more general process of model development and data analysis. One epidemiological idea used without definition in the lecture is $R_0$, defined to be the expected number of secondary infections arising from one infected individual in a fully susceptible population. The SIR model supposes that previously infected individuals cannot become reinfected, so those in compartment R are protected from infection.

The SIR model in epidemiology is closely related to predator-prey models in ecology. Similar models can be used to describe spread of ideas (including rumors or mis-information) on social networks. 

| | ||
|:---------------|:---------------|:------------------------:|
| Slides  | | [pdf](https://kingaa.github.io/sbied/stochsim/slides.pdf) |
| Annotated slides  | | [pdf](slides-annotated.pdf) |
| Notes   | | [pdf](https://kingaa.github.io/sbied/stochsim/notes.pdf) |
| **R** script  | | [**R**](https://kingaa.github.io/sbied/stochsim/main.R)                                                                   |
| Worked solutions to the Exercises | | [html](https://kingaa.github.io/sbied/stochsim/exercises.html)                    
| Recording, Chapter 12, Part 1  | Compartment models | [(17 mins)](https://youtu.be/l5YCll5qcP0) | 
| Recording, Chapter 12, Part 2  | Euler's method for simulating Markov processes | [(24 mins)](https://youtu.be/69F4oEjXkug) |
| Recording, Chapter 12, Part 3  | Compartment models in the pomp package | [(47 mins)](https://youtu.be/XmUQR1Bp8C4) |
| Recording, Chapter 12, Part 4  | Discussion of exercises | [(10 mins)](https://youtu.be/sNcNhvNY2Ro) |
-----------

<!--
| Annotated slides  | | [pdf](slides-annotated.pdf) |
-->


----------------------

[Back to course homepage](../index.html)  
[Acknowledgements](../acknowledge.html)  
[Source code for these notes](http://github.com/kingaa/sbied/tree/master/stochsim)


----------------------
