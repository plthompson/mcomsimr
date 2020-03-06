# mcomsimr: An R package for simulating metacommunity dynamics in R

This package accompanies the manuscript: 
***Thompson, P. L., M. L. Guzman, L. De Meester, Z. Horvath, R. Ptacnik, B. Vanschoenwinkel, D. S. Viana, & J. M. Chase. 2020. A process based framework for metacommunity ecology. BioRxiv https://doi.org/10.1101/832170*** 
and facilitates the simulation of metacommunity dynamics using the framework presented within. Please use this citation 

This package accompanies the manuscript: 

***Patrick L. Thompson, Laura Melissa Guzman, Luc De Meester, Zsófia Horváth, Robert Ptacnik, Bram Vanschoenwinkel, Duarte S. Viana, & Jon M. Chase. 2020. A process based framework for metacommunity ecology. BioRxiv https://doi.org/10.1101/832170*** 

To cite package ‘mcomsimr’ in publications use this citation.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {A process based framework for metacommunity ecology},
    author = {Patrick L. Thompson and Laura Melissa Guzman and Luc {De Meester} and Zsófia Horváth and Robert Ptacnik and Bram Vanschoenwinkel and Duarte S. Viana and Jon M. Chase}
    year = {2020},
    note = {R package version 3.0-4},
    publisher = {BioRxiv}
    url = {https://doi.org/10.1101/832170},
  }

Simulates metacommunity dynamics based on three underlying processes: 
1) density independent responses to abiotic conditions
2) density dependent biotic interactions
3) dispersal

Stochasticity occurs through the probabalistic realization of these three processes. 

# Installation

The mcomsimr package can be installed and loaded with:

```r
#install.packages("devtools")
devtools::install_github("plthompson/mcomsimr")
```

``` r
library(gfplot)
```
