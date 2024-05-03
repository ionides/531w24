---
title: "Review comments on Project 2"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

Developing a POMP model for a new system is an additional challenge. When the model is carefully justified (as it is here) that is a worthy contribution. This is a well-presented project which leaves open questions but makes as much progress as can be expected for a final project.

### Points for consideration

1. Explain acronyms at first occurrence, e.g., CPUE. 

1. The alternative prey hypothesis (mentioned in the project title) could be explained in the introduction. It becomes clearer later on, in the model section.

1. The description of what is denoted by ‘peak_rodent_year’ was a bit lacking. It was only described; “Peak rodent year is scored as “yes”, otherwise ‘no’” but it does not describe what is meant by that or how it is decided or when.

1. It could have been explicitly explained why the log of CPUE was used in the model instead of the CPUE itself.

1. ARIMA with differencing parameter I>0 does not have immediately comparable likelihood, so is not appropriate as a benchmark. One could use ARMA with a trend (linear, quadratic, or exponential) instead.

1. If the formal null and alternative hyptheses are defined for the KPSS test, it may be clearer what can legitimately be concluded from it.

1. The log-likelihood search is incomplete, as evidenced by the local search beating the preliminary global search.

1. In Fig 3.1, the effective sample size is usually 1, and never more than 2.2. This indicates serious particle depletion. Evidently, $Np=50$ particles is insufficient, though model improvements may be needed as well as extra computational effort.

1. Diagnostic plot. The starting point has very low likelihood. A search starting from not such a poor place might be easier.

1. To acknowledge the preliminary nature of the mechanistic model, it is premature to conclude that "ARMA is a better fit to the data". 

1. There is a mismatch between the text reported log-likelihood (-205) and the value in the R output (-288).


