# mcomsimr: An R package for simulating metacommunity dynamics in R

This package accompanies the manuscript: 

**Patrick L. Thompson, Laura Melissa Guzman, Luc De Meester, Zsófia Horváth, Robert Ptacnik, Bram Vanschoenwinkel, Duarte S. Viana, & Jon M. Chase. 2020. A process based framework for metacommunity ecology. BioRxiv https://doi.org/10.1101/832170** 

To cite package ‘mcomsimr’ in publications use this citation.

The package simulates metacommunity dynamics based on three underlying processes: 
1) density independent responses to abiotic conditions
2) density dependent competition
3) dispersal

Stochasticity occurs through the probabalistic realization of these three processes. 

## Installation

The mcomsimr package can be installed and loaded with:

```r
#install.packages("devtools")
devtools::install_github("plthompson/mcomsimr")
```

``` r
library(gfplot)
```
## Instructions
The simulation is performed using the function:
```r
simulate_MC()
```
The user must specify the number of patches and the number of species to simulate:
```r
simulate_MC(patches = 5, species = 4)
```

### Key arguments in ```simulate_MC```:

**1) density independent responses to abiotic conditions**

```env_niche_breadth``` - sets the density independent niche breadth 
  - low value (e.g. 0.5) results in strong responses to env. heterogeneity), 
  - high value (e.g. 10) results in nearly no response to env. heterogeneity
 
 **2) density dependent competition**
 
```intra``` - sets the strength of intraspecific competition (set to 1 in Thompson et al. 2020)

```min_inter``` - sets the min value of a uniform distribution from which interspecific competition coefficients are drawn

```max_inter``` - sets the max value of a uniform distribution from which interspecific competition coefficients are drawn
- ```min_inter = 1, max_inter = 1``` gives equal competition scenario from Thompson et al. (2020)
- ```min_inter = 0, max_inter = 0.5``` gives stabilizing competition scenario from Thompson et al. (2020)
- ```min_inter = 0, max_inter = 1.5``` gives multiple competition scenario from Thompson et al. (2020)

**3) dispersal**

```dispersal``` - sets the probability that an individual disperses in each time step
