# mcomsimr: An R package for simulating metacommunity dynamics in R

This package facilitates the simulation of metacommunity dynamics using the framework presented in ***Thompson, P. L., M. L. Guzman, L. De Meester, Z. Horvath, R. Ptacnik, B. Vanschoenwinkel, D. S. Viana, & J. M. Chase. 2020. A process based framework for metacommunity ecology. BioRxiv https://doi.org/10.1101/832170*** 


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
