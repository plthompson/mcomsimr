# mcomsimr: An R package for simulating metacommunity dynamics in R

This package accompanies the manuscript: 
***Thompson, P. L., M. L. Guzman, L. De Meester, Z. Horvath, R. Ptacnik, B. Vanschoenwinkel, D. S. Viana, & J. M. Chase. 2020. A process based framework for metacommunity ecology. BioRxiv https://doi.org/10.1101/832170*** 
and facilitates the simulation of metacommunity dynamics using the framework presented within. Please use this citation 

This package accompanies the manuscript: 

***Patrick L. Thompson, Laura Melissa Guzman, Luc De Meester, Zsófia Horváth, Robert Ptacnik, Bram Vanschoenwinkel, Duarte S. Viana, & Jon M. Chase. 2020. A process based framework for metacommunity ecology. BioRxiv https://doi.org/10.1101/832170*** 

To cite package ‘mcomsimr’ in publications use this citation.

The package simulates metacommunity dynamics based on three underlying processes: 
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
# Instructions
The simulation is performed using the function:
```r
simulate_MC()
```
The user must specify the number of patches and the number of species to simulate:
```r
simulate_MC(patches = 5, species = 4)
```

Key arguments for simulating dynamics:
```r
env_niche_breadth = # set the density independent niche breadth - low value (e.g. 0.5) results in strong responses to env. heterogeneity), high value (e.g. 10) results in nearly no response to env. heterogeneity
dispersal = # set the probability that an individual disperses in each time step
```


