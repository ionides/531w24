---
title: "Final project instructions"
author: "DATASCI/STATS 531, Winter 2024"
output:
  html_document
---

\newcommand\prob{\mathbb{P}}
\newcommand\E{\mathbb{E}}
\newcommand\var{\mathrm{Var}}
\newcommand\cov{\mathrm{Cov}}

-----------

The format for submitting the final project is different from the midterm project. The main reason for that is to facilitate running the peer review via Canvas.

**<big>Final project outline</big>**. Find a time series dataset of your choice. Carry out a time series analysis, taking advantage of what we have learned so far in this course. Write a report, submitted on Canvas as a zip file by the deadline, 11:59pm on Tuesday 4/23. The zip file should contain the following:

1. A file called `blinded.Rmd` and its compiled version `blinded.html` which contain no identifying text. This version will be used for anonymous peer review and posted on the course website.

2. Data files and any other files needed to compile the Rmd on a standard R or Rstudio environment. You can assume that the grader and peer reviewers will install required libraries as needed.

In addition to the project report, there is a separate Canvas assignment requesting submission of a short individual statement describing (i) your role in the group; (ii) how the group shared the tasks involved in writing the report. This is not necessary if you carried out an individual final project. The individual roles statement can be as short as a paragraph. Points for this individual report will be awarded in the teamwork category of the grading rubric below. It is expected that every group member will be awarded the same score. However, in special circumstances, these individual statements could be used to make appropriate adjustments.


**<big>Choice of data and the analysis task</big>**. It is expected that part of your project will involve a POMP analysis, using the modeling and inference approaches we have studied in the second half of this semester.  A common goal of POMP analysis is to connect theory to data. To do this, you must think about both the theory and the data. If possible, choose a dataset on a topic for which you know, or are willing to discover, some background theory. A good way to get ideas for topics to study and places to find data is to look at the past final projects from [2022](https://ionides.github.io/531w22/final_project/index.html) or previous years ([2016](http://ionides.github.io/531w16/final_project/index.html), [2018](https://ionides.github.io/531w18/final_project/index.html), [2020](https://ionides.github.io/531w20/final_project/index.html), [2021](https://ionides.github.io/531w21/final_project/index.html)). Each of these projects should contain the data and information about where the data came from. You may want to search for your own data set, but it is also legitimate to re-analyze data from a previous final project. If you do re-analyze data, you should explain clearly how your analysis goes beyond the previous work, and you should be especially careful to give proper credit to any code you reuse. Also, note that old **pomp** code may need modification to run on the current version of **pomp**. The [**pomp** version 2 upgrade guide](https://kingaa.github.io/pomp/vignettes/upgrade_guide.html) can be helpful for older code. Various smaller changes have also acrued between **pomp 2.0** to the current **pomp 5.6**.

As for the midterm project, the time series should hopefully have at least 100 time points. You can have less, if your interests demand it. Shorter data needs additional care, since model diagnostics and asymptotic approximations become more delicate on small datasets. If your data are longer than, say, 1000 time points, you can subsample if you start having problems working with too much data. Computational considerations may prevent you analyzing as large a model, or as long a dataset, as you would ideally do. That is fine. You can present a smaller, computationally feasible analysis and discuss possible extensions to your analysis.


--------

**<big>Groups</big>**. There will be randomly assigned groups of approximately 3 people. As pointed out in the syllabus, in special situations you can request to write an individual midterm project. This may be appropriate if you have a particular dataset or scientific question that has motivated your interest in learning time series analysis. You must request this before groups are assigned.  Once you are in a group you have to come to an agreement with your group on what data to analyze. You will not be able to request your own group partners - in order to treat everyone fairly, groups will be randomized.

--------

**<big>Data privacy and project anonymity</big>**. The projects, together with their data and source code, will be posted anonymously on the class website unless you have particular reasons why this should not be done. For example, you may have access to data with privacy concerns. The projects will be posted anonymously. After the semester is finished, you can request for your name(s) to be added to your project if you want to.

---------

**<big>More comments on choice of data and data analysis goals</big>**.

* If you already have a dataset, or scientific topic, to motivate your time series final project, that is good. Otherwise, here are some ideas.

* A standard approach for a final project is to take some previously published data, do your own time series analysis, and write it up by putting it in the context of the previously published analysis.

* You can reproduce part of a previously published analysis, being careful to explain the relationship between what you have done and what was done previously. You should also think of some things to try that are not the same as what was done previously.

* Depending on your choice of project, you may be in any of the following situations:

    1. A **pomp** representation already exists for the POMP model you want to use.

    2. Your task involves POMP models that are variations on an existing **pomp** representation.

    3. Your analysis involves a POMP model which leads you to develop your own **pomp** representation.

* If you develop a **pomp** representation of a POMP model for a new dataset, test it and demonstrate it, that is already a full project.

* The more your model derives from previous work, the further you are expected to go in carrying out a thorough data analysis.


----------

**<big>Methodology not covered in class</big>**.
This course has focused on ARMA and POMP models, two related approaches to time domain analysis of time series. For example, we have not spent much time on frequency domain analysis of multivariate time series. If you decide that alternative approaches are particularly relevant for your data analysis goal, you can use them in your project as a complementary approach to what we have covered in class. Eplaining and justifying an alternative approach can be a substantial component of the project.


------------


**<big>Expectations for the report</big>**. The final report will be graded on the following categories, the same as for the midterm project.

* Communicating your data analysis. [10 points]

    + Raising a question. You should explain some background to the data you chose, and give motivation for the reader to appreciate the purpose of your data analysis. 

    + Reaching a conclusion. You should say what you have concluded about your question(s).

    + Communication style. Material should be presented in a way that helps the reader to appreciate the contribution of the project. Code and computer output are included only if they are pertinent to the discussion. Usually, code remains in the source file, and numerical results are presented in tables or graphs or text, rather than raw computer output.

    + You will submit your source code, but you should not expect the reader to study it. If the reader has to study the source code, your report probably has not explained well enough what you were doing.

* Statistical methodology. [10 points]

    + Justify your choices for the statistical methodology.

    + The models and methods you use should be fully explained, either by references or within your report.

    + Focus on a few, carefully explained and justified, figures, tables, statistics and hypothesis tests. You may want to try many things, but only write up evidence supporting how the data help you to get from your question to your conclusions. Value the reader's time: you may lose points for including material that is of borderline relevance, or that is not adequately explained and motivated.

    + Correctness. Obviously, we aim to avoid errors in the math we present, our code, or the reasoning used to draw conclusions from results. Being self-critical and paying attention to detail can help here. 

* Scholarship. [10 points]

    + Your report should make references where appropriate. For a well-written report the citations should be clearly linked to the material. The reader should not have to do detective work to figure out what assertion is linked to what reference.

    + You should properly acknowledge any sources (people or documents or internet sites) that contributed to your project.

    + You are welcome, and encouraged, to look at previous projects, linked from [the course website](../index.html). If you address a question related to a previous project, you should put your contribution in the context of the previous work and explain how your approach varies or extends the previous work. It is especially important that this is clearly explained: substantial points will be lost if the reader has to carry out detective work to figure out clearly the relationship to a previous project.
    
    + When using a reference to point the reader to descriptions elsewhere, you should provide a brief summary in your own report to make it self-contained. 

    + Teamwork. This will be assessed based on the separate statement of group roles submitted to Canvas. 


------------

**<big>Plagiarism</big>**. All sources are allowed. You can access any website and talk to any human about your project, as long as the interaction is properly credited. If material is taken directly from another source, that source must be cited and the copied material clearly attributed to the source, for example by the use of quotation marks. Failing to do this is [plagiarism](https://en.wikipedia.org/wiki/Plagiarism) and will, at a minimum, result in zero credit for the scholarship category. For course projects, we should be at least as careful with attributions than the high standards expected across academia. Explaining how you gathered information for your project can strengthen the presentation. For example, any time you discuss your project with a classmate, or you use advice from [Stack Overflow](https://stackoverflow.com/), you can add this to the acknowledgements section of your project. 

Further discussion of plagiarism can be found in [On Being a Scientist: A Guide to Responsible Conduct in Research: Third edition (2009)](http://www.nap.edu/catalog.php?record_id=12192), by <i>The National Academies Press</i>.
Here is how the [Rackham Academic and Professional Integrity Policy](http://www.rackham.umich.edu/current-students/policies/academic-policies/section11#1132) describes plagiarism:

> <b> 8.1.2 Plagiarism </b>
>
> Includes:
> 
> Representing the words, ideas, or work of others as one's own in writing or presentations, and failing to give full and proper credit to the original source.
>
> Failing to properly acknowledge and cite language from another source, including paraphrased text.
>
> Failing to properly cite any ideas, images, technical work, creative content, or other material taken from published or unpublished sources in any medium, including online material or oral presentations, and including the author's own previous work.

------------

