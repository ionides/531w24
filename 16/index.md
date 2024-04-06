---
title: "Modeling and Analysis of Time Series Data<br>STATS/DATASCI 531, Winter 2022<br>Chapter 16: A case study of financial volatility and a POMP model with observations driving latent dynamics"
author: "Edward L. Ionides"
output: html_document
---

----------------------

| &nbsp;          | &nbsp;                                                                            |
|:----------------|:---------------------------------------------------------------------------------:|
| slides  | [pdf](slides.pdf) |
| Annotated slides   | [pdf](slides-annotated.pdf) |
| notes   | [pdf](notes.pdf) |
| **R** script | [**R**](main.R) |
| Running the notes on greatlakes | [HTML](README.html), [sbat](r-3.sbat) |
| Recording, Chapter 16, Part 1  | [(16 mins)](https://youtu.be/cDcPny96Gcs) |
| Recording, Chapter 16, Part 2  | [(24 mins)](https://youtu.be/TAUDn2RkUWU) |
| Recording, Chapter 16, Part 3  | [(17 mins)](https://youtu.be/XvM991mISJs) |
----------------------

<!--
| annotated slides | [pdf](slides-annotated.pdf) |
-->

<iframe width="560" height="315" src="https://www.youtube.com/embed/cDcPny96Gcs" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/TAUDn2RkUWU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/XvM991mISJs" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


----------------------

[Back to course homepage](../index.html)  
[Acknowledgements](../acknowledge.html)  
[Source code for these notes](http://github.com/ionides/531w22/tree/master/16/)


----------------------
