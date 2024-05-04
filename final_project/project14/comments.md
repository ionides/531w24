---
title: "Review comments on Project 14"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

Building a mechanistic model for a new situation is a scientifically interesting challenge. In this case, tuberculosis is basically in exponential decline so there may be not much beyond that for the data to reveal.
1. The conclusions are appropriate. The trend in beta is a suitable way to understand the decline in tuberculosis. The data analysis could be pushed further, as the report notes. Howver, the report reflects a reasonable effort at model development and testing.

### Points for consideration

1. The background section is missing references.

1. Data whose scale varies considerably over time are often best plotted on a log scale.

1. Some ARIMA code is apparently taken from [531w24 midterm project 6](https://ionides.github.io/531w24/midterm_project/project06/blinded.html) without credit. The smallest root table is a good idea to copy, but it would be better to give credit.

1. Regression with ARMA errors (looking to understand the time trend, perhaps with an exponential trend function) might be more insightful than differencing and fitting ARIMA. 

1. The SEIR model equations do not perfectly match the implemented equations in the code.

1. The parameter values given as the result of the local search are the starting point for that search, as can be seen by looking at the convergence diagnostics. Considerably better likelihood values are obtained by the end of the local search.

1. The modeling and analysis is similar, but in many ways inferior, to a previous STATS 531 final project on tuberculosis [(531w16 project 20)](https://ionides.github.io/531w16/final_project/Project20/Final_Project/stat531finalproject.html). That project is cited, but it would have been better to acknowledge more fully what was learned from that paper, and make progress by contrasting that work with the different dataset in question here.

1. There is an inconsistency in log-likelihood values reported within the text and those shown in code outputs (-628.8447 and -629.6903), which raises concerns about the accuracy of the reported results

1. SEIR has been successful for rapidly transmitted diseases but tuberulosis is different. Only those in poor housing, or with other risk factors, are typically at risk of TB, so treating S as the entire population may be problematic.

1. The report does not discuss the specification and estimation of initial state values. That can be established from the provided code, but should be in the report.

1. The model-based assessment does not get beyond basic iterated filtering to global maximization or profiles. Given the head-start acquired by building on a previous project, one can expect to get further.

1. Adding a diagram for the process model would help readers to easily understand your model.

