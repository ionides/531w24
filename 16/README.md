---
title: "Modeling and Analysis of Time Series Data<br>DATASCI/STATS 531<br>Running the Chapter 16 notes on greatlakes"
author: "Edward L. Ionides"
output: html_document
---

This provides an example for the more general task of running pomp analysis on a Linux cluster using Slurm scheduling. This is an example of the even more general task of organizing reproducible and computationally intensive statistical data analysis.

1. Copy the files to greatlakes. For moving the chapter 16 code to greatlakes, I cloned the 531w24 git repository from GitHub. I could also have used scp.

2. Check the code is running, via an interactive session at run level 1

    (a) edit main.Rnw to make sure run level is set to 1, e.g., using
    ```
    nano main.Rnw
    ```

    (b) start an interactive session on greatlakes, e.g., by
    ```
    srun --nodes=1 --account=stats531w24_class --ntasks-per-node=2 --pty /bin/bash
    ```

    (c) load a current version of R
    ```
    module load R
    ```

    (d) start R in the 531w24/16 directory
    ```
    R
    ```

    (e) within R, we try knitting the source file. Here, it is Rnw, but Rmd would work the same way.
    ```
    knitr::knit("main.Rnw")
    ```

    (f) likely, you will be missing some packages and you will have to run install.packages in your R session.

    (g) when step (e) is working for you, it will produce main.tex (or a md file from Rmd). It will also produce all the rda files saving the output of the computations.


2. Try running the code as a batch file. 531w24/16 has three sbat files corresponding to the three run levels: r-1.sbat, r-2.sbat, r-3.sbat. Try the batch job at run level 1 first. Note that if your knitr/rmarkdown file is using cache, you will have to remove all the cache files. For Chapter 16, the cache is put in a subdirectory called tmp, so we can delete all the cache by
```
rm -rf tmp
```
Then, having set run_level to 1 in main.Rnw, edit r-1.sbat to replace `ionides@umich.edu` with your own email address.
You are now ready to run
```
sbatch r-1.sbat
```
Also, if you need to re-run all the code at run level 1, you can do
```
rm -rf *1.rda
```
to remove all the rda files for run level 1.

3. Once this is debugged, you can move on to run levels 2 and 3. The only differences between r-1.sbat, r-2.sbat and r-3.sbat is the number of cores requested and the wall time. Setting these no larger than needed may lead to shorter queue times, and perhaps fewer billing minutes. Again, you may have to remove cached files, both the knitr/rmarkdown cache and the .rda files if you want to reconstruct them.

4. Once the rda files are computed, you can move them to wherever you are most comfortable for further editing of text and figures.
