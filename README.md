# mcomsimr: An R package for simulating metacommunity dynamics in R

This package accompanies the manuscript: 

**Patrick L. Thompson, Laura Melissa Guzman, Luc De Meester, Zsófia Horváth, Robert Ptacnik, Bram Vanschoenwinkel, Duarte S. Viana, & Jon M. Chase. 2020. A process based framework for metacommunity ecology. BioRxiv https://doi.org/10.1101/832170** 

To cite package ‘mcomsimr’ in publications use this citation.

The package simulates metacommunity dynamics based on three underlying processes: 
1) density independent responses to abiotic conditions
2) density dependent competition
3) dispersal

Stochasticity occurs through the probabalistic realization of these three processes. 

Note, this package was not used to produce the simulations in the manuscript. This was done using code in the Julia computing language, which is much faster. This package was written after the Julia code, to make our model easily accessible. Therefore, there may be discrepancies between the output of this model and that of the Julia code.

## Installation

The mcomsimr package can be installed and loaded with:

```r
#install.packages("devtools")
devtools::install_github("plthompson/mcomsimr")
```

``` r
library(mcomsimr)
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

#### additional arguments are specified in the documentation for ```simulate_MC```:

### outputs
The function produces a list of outputs: 
- dynamics.df - a dataframe containing the abundances of each species at each time point in the simulation, includes the burn in and initialization dynamics, which are indicated by having negative time steps
- landscape - a dataframe containing the x and y coordinates of the patches in the landscape
- env.df - a dataframe containing the environmental conditions in each patch in each timestep
- env_traits.df - a dataframe containing the species environmental optima and the density independent niche breadth
- disp_mat - a matrix that specifies the spatial pattern of dispersal
- int_mat - a matrix that specifies the per capita competition coefficients

### customizing simulations
The simulations can be customized using additional arguments in the ```simulate_MC``` function. This includes allowing for variable abiotic niche breadth, custom environmental optima, variable dispersal rates etc. 

The function can accept predefined coordinates for the patches in the landscape.
- ```landscape =```
This should be specified as a dataframe that includes numeric columns x and y. Set the ```patches``` argument to be equal to the number of rows in the landscape dataframe.

The function can accept a predefined dispersal matrix that specifies what proportion of dispersal goes from patch x (column) to patch y (row). 
- ```disp_mat = ```
The sum of each column should not exceed 1. If the sum of a column is less than 1, this will result in the loss of some dispersing individuals from the metacommunity. Specifiying ```disp_mat``` overrides the ```torus``` and ```kernel_exp``` arguments. 

The function accepts predefined environmental conditions.
-```env.df =```
This should be a dataframe with columns: env1 - numeric environmental conditions;patch - patch number; time - time step (include conditions during burn in period). At the moment, only one environmental variable is supported. The total number of time steps should equal the total number of timesteps + the length of the burn_in period. Specifying ```env.df``` overides the ```env1Scale``` argument. 

The function can accept predefined environmental optima for each species
- ```env_optima```
This should be a numeric vector of values corresponding to the environmetal optima of each species. The length should equal the number of species in the simulation. Specifiying ```env_optima``` overides the ```optima_spacing``` arguement.

The function can accept predefined competition coefficients
- ```int_matrix```
This should be a square numeric matrix with the number of rows and columns corresponding to the number of species in the simulation. Each value in the matrix is the per-capita competition effect of species i (column) on species j (row). The diagnonal of the matrix specifies the intraspecific competition coefficients. Specifying ```int_matrix``` overides ```intra``` ```min_inter``` and ```max_inter``` arguments, but not ```comp_scaler```.

#### Please flag any issues or questions using the issues tab https://github.com/plthompson/mcomsimr/issues or email patrick.thompson@zoology.ubc.ca
