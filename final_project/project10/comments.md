---
title: "Review comments on Project 10"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

A well-motivated analysis reaching the conclusion that modeling COVID-19 is harder than seasonal influenza. The strain structure for COVID-19, as well as the rapidly changing vaccination and lockdown situations, are to blame. The group concluded that a variable transmission rate may be needed. Some other groups this year, and previously, managed to get further and actually develop and fit such models for COVID-19.

### Points for consideration

1. There is too much R output for a final report.

1. Plotting the flu simulations for the manually chosen parameters may be less relevant for the final results than simulations from the estimated maximum likelihood parameters. It would be nice to know if those fit better, visualy.

1. It would have been useful (and routine practice) to provide an ARMA benchmark. This project properly focuses primarily on interpretable mechanistic models, but a brief excursion into ARMA modeling would be helpful.

1. Having found a decent model for flu, it would be worthwhile to discuss the fitted parameters. These should also have units, where applicable.

1. References should have titles, authors and dates, in a standard format such as APA. There should also be more citations in the text.

1. The connection between COVID-19 in an Asian country and influenza in US is quite weak; there are extensive differences between both the societies and the viruses. It is not explained how these differences become a strength or a purpose of the project. 

1. The initial values of latent state variables are fixed, not estimated. These choices need more discussion, since they could be critical to the modeling.


