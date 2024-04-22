---
title: "Modeling and Analysis of Time Series Data<br>DATASCI/STATS 531<br>Chapter 17: A case study of measles: Dynamics revealed in long time series"
author: "Edward L. Ionides"
output: html_document
---

We return to another case study from the short course [Simulation-Based Inference for Epidemiological Dynamics](https://kingaa.github.io/sbied/) (SBIED). Chapter 17 is Lesson 5 of SBIED. In Chapters 11--14, we used a single measles outbreak as a relatively simple example to demonstrate POMP models and inference. Now we see how an extension of this analysis becomes a topic of scientific interest. Modeling longer time series can be more challenging, since it is not simply enough to have a model that can describe how an epidemic wave surges and then retreats. On the other hand, the additional data from a sequence of outbreaks can inform a more detailed model.

We will focus on two new topics arising in the case study:

* When can we make a causal interpretation of estimated model parameters?

* We see that the scale of the variability matters for successful modeling. We show how to model dynamic stochasticity by adding noise to the rates of a Markov chain.

| | ||
|:---------------|:---------------|:------------------------:|
| Slides  | | [pdf](https://kingaa.github.io/sbied/measles/slides.pdf) |
| Annotated slides  | | [pdf](slides-annotated.pdf) |
| Notes   | | [pdf](https://kingaa.github.io/sbied/measles/notes.pdf) |
| **R** script  | | [**R**](https://kingaa.github.io/sbied/measles/codes.R) |
| Recording, Chapter 17, Part I  | Model development | [(40 min)](https://youtu.be/x4bL3efTVhI) |
| Recording, Chapter 17, Part II  | Interpreting the results | [(40 min)](https://youtu.be/w4LgFR5ibw8) |
| Model construction and analysis script                  | | [**Rnw**](https://kingaa.github.io/sbied/measles/main.Rnw)                                                                           |
| Supplement: profile likelihood calculation | | [HTML](https://kingaa.github.io/sbied/measles/profile.html)                                                                       |
----------------------

<!--
| Annotated slides  | | [pdf](slides-annotated.pdf) |
-->

----------------------

[Back to course homepage](../index.html)  
[Acknowledgements](../acknowledge.html)  
[Source code for these notes](http://github.com/kingaa/sbied/tree/master/measles)


----------------------
