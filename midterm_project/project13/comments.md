---
title: "Review comments on Project 13"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document:
    toc: no
---

### Strengths

The introduction section is clearly formed and expressed, translating a complex political scenario into a manageable time series model. Innovative research questions are raised and answered. Data and model results are all explained in the context of historical events and political backgrounds and conjectures. A range of methods are used, including cross-spectrum and pairwise coherency. The attention to mulitple testing is appreciated. The structure of this report is well organized.


### Points for consideration

1. HP detrending is not usually necessary on a differenced time series. Here, the differencing has already removed the trend. More usually, HP detrending is an alternative to differencing which can be appropriate when the data are well modeled by a nonlinear mean plus stationary noise. 

1. The reasoning for HP detrending, that there is some autocorrelation in Sec. 8.1, may be weak. Small amounts of decaying sample autocorrelation are generally best modeled by a stationary noise process rather than nonstationary mean plus stationary noise.

1. Figure 1. $n$ is an unfortunate axis label, since it is already used to enumerate observations.

1. It might be worth describing the HP filter since it plays a significant role. Readers can follow the documentation at 'MFilter::hpfilter' but it is better to describe briefly in the report. 

1. Consider integrating the ACF plot into section 2 rather than placing it in the appendix since it causes trouble with reference reading

1. A spectrum analysis before detrending might help address the questions, since the HP detrending might have removed a meaningful frequency.

1. The periodogram does not support the claim,"Only the periodograms of detrended Total Regimes and Electoral Democracy demonstrate an indication of cyclical behavior." None of the smoothed periodograms show a significant peak. All the periodograms dip down toward frequency=0 due to the effect of the detrending.

1. "The phase plot below shows that there seems to be a lag relationship between Closed Autocracy and Electoral Autocracy." In fact, the phase relationship is always around pi, bearing in mind that $\pi$ and $-\pi$ are equivalent and both correspond to out-of-phase relationships. This is evidence of switching between these two political systems.

1. The reported "highly similar amplitude between the frequency 0.2 and 0.3 of Total Regimes and Electoral Democracy" looks more like frequency 0.3 and 0.35 in the pairwise coherency plot. The error bars are big here; it may be helpful to smooth the coherency plot more than the periodogram.

1. The discreteness of the count data raises potential issues for Gaussian ARMA methods - this may or may not be problematic, and could be checked by simulation from an appropriate discrete model, perhaps a hidden Markov model (also known as a POMP).

1. The use of bullet points can both add and subtract from clarity. For a clearly flowing development of the ideas, paragraphs are better.

1. Sec. 4.1. It is possible that the detrending could lead to dependence. For example, differencing of white noise leads to a model with an MA root on the unit circle.

1. Sec. 5. This is an interesting analysis. A couple of comments:

    (a) How can Diff. Log-lik be negative? Presumably this is because of
  numerical error?

    (b) The ARIMA model here is large, with 6-8 parameters to describe a fairly short time series of length 122. Does a smaller model lead to the same conclusions?

1. The units of time and frequency are missing in some plots (sample ACF, spectrum).

