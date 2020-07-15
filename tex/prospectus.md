---
title: Dissertation Prospectus
author: M.D. Catchen
abstract:  here it is
---
---
\pagebreak
# Introduction

What is this?

A software toolkit utilizing ABC to fit ecological simulation models to datasets that span a variety of ecological scenarios, for the purpose of inference, hypothesis testing, and forecasting.

	- many scenarios: modular, meaning different questions across scales/types of data can simulated and interface with the software



Ecological science is global endeavor, and by developing tools that are usable and applicable to a wide variety of problems, we can  





## Why is community ecology related to biodiversity, evolution, broad questions?

- Interactions within and across scales, Levin
- Community ecology necessarily occurs in both space and time.
- Ecosystems are inherently dynamical systems.
- Ecosystems are complex systems
  - Stochasticity is ubiquitous 
- Complex systems evade the typical methods of analysis 

 'bioenergetic' 

thermo

\pagebreak
# Literature Overview

## Spatial Ecology Literature
Spatial ecology as it exists today would be radically different if not for @macarthur_and_wilson. The Theory of Island Biogeography (TIBG) is foundational to both spatial and community ecology. TIBG provides a mechanistic explanation for the species-area relationship, one of the most well-established "laws" in ecology. 

The theoretical construction of space used by @macarthur_and_wilson---a set of internally homogeneous 'islands', each variable in size and surrounded by inhospitable water/matrix, each either occupied or unoccupied by a particular species---has had deep impacts on many modern methods used to infer ecological patterns across space. Metapopulation theory, coined by @levins_metapop, describes a system of discrete 'patches', all either occupied/unoccupied. Modern occupancy models are rooted in this view of space: discrete observations at spatial coordinates, with environmental covariates.

However, a tension counter to discrete space runs throughout spatial ecology. The availability of remote-sensing technology has enabled the availability of 'continuous' ecological data in the form of rasters. As satellites designed for Earth Science orbit the Earth, they reflect electromagnetic signals at the surface of our planet, and record the spectral signature they receive reflected back at them. The reflective signature of Earth's surface can be used to estimate various properties about its surface. The properties used by both different satellites and different models varies widely in what they try to predict, from the level of coarse land cover categories to the presence of particular species. 

From this, we can apply the metapopulation data--occupancy at points, with envrionmental data at points, to produce rasters that estimate species occupancy based on env data. These species distribution models: max ent, bioclim. what is the strength of env effects?

There is a difference in scale in what this type of data it provides, what time period it covers, and what spatial resolution it has. This "resolution gap" is pervasive in most of the large-scale data sets ecologists try to use: species, etc.



## Classical Community ecology
- early dynamical models of communities
  
    - LV, Levins, Macarthur and wilson
- Neutral
    - hubbell and Neutral
    - nearly neutral
    
    

## metacommunities

- early
  - The metacommunity concept as a 'network of networks'-- a spatial network, where each node represents a food web, itself a network (\cite{leibold_metacommunity_2004 , pillai_metacommunity_2011}).
  
  - cite -@pillai_metacommunity_2011
  
    Poisot 2014
- Joint SDMS

## Food Web Topology

The structure of food-webs has been one of the most studied topics in ecology over the last 50 years. 



- Brief review of the history of generative models of food-web topology
  - May, stability and complexity
  - cascade model, using one dimensional niche space, a proxy for allometric scaling
  - niche model
  - allesina, likelihood function to infer niche model parameters from real food webs
    - a way to generate food-webs with similar topogogical structure to an empirical web, to use simulation to make statesment about stability

## Bioenergetic Community Models

It's true that community ecology has been called "a mess" (citation). Many of the premises of ecology necessitate that its phenomena are complex is cause and outcome. 



When studying any system, one of the most powerful tools of inquiry is paying attention to what is _invariant_, meaning that which does not change in the system, even as we adjust its parameters. Mathematicians understand this deeply. Ecosystems vary in seemingly dimensionless ways. Yet, we can still find an invariant in ecology---the amount of energy per unit area on the planet is a measurable value, and it has to go somewhere. 







It's true, the word 'bioenergetic' does sound like I'm about to try to sell you a collection of conveniently-priced crystals that will keep the bears away. However, it is fewer syllables than any of its potential synonyms, so I'm hoping we'll just be able to meet in the middle on this one. 



- thermodynamics as a premise for community ecology

- robert may etc
- Brief review of the history of generative models of food-web topology
  - May, stability and complexity
  - cascade model, using one dimensional niche space, a proxy for allometric scaling
  - niche model
  - allesina, likelihood function to infer niche model parameters from real food webs
    - a way to generate food-webs with similar topogogical structure to an empirical web, to use simulation to make statesment about stability

## Models, and what they can do

- inference, prediction, forecasting, estimation, hypothesis-testing
- what type of models have we seen in spatial and community ecology?
    - determinstic, mechanistic models
        - LV, TIBG, Classic Metapop Theory
    - Off the shelf statistical tests
- what can simulation models do for spatial community ecology?
    - complexity and stochasticity across scale
    - higher sample size than experiments
    - historically this has cons: parameter numbers, fitting complex models to data is difficult
    - ABC
        - simulation results as a likelihood function

## What questions are relevant and remain unaddressed?

Dang i'm just chillin

- Forecasting
- How do shifts in landscape structure affect biodiversity that can exist in that landscape?

\pagebreak

# Models and Data

For models to interface with the world, they must make predictions, $y$ based on observables,
$\hat{x}$ and parameter values $\theta$. $y = f(\hat{x}, \theta)$.

Example: a species distribution model maps environmental conditions, $\hat{x}$, to predictions about species occuarance, $y$.
Yet, to fit this model y = $f(\hat{x}, \theta)$, we need some observed instances of both environmental conditions $\hat{x}$ and species
occupancy $\hat{y}$ in order to estimate $\theta$.

Then, we estimate $\theta$ using a variety of methods in both frequentist and Bayesian worlds,
yet what the vast majority of these methods have in common is that they estimate $\theta$ by using a likelihood function,
$\mathbb{L}(\hat{x}, \theta)$.

In a frequentist world, the likelihood function is everywhere. Most off-the-shelf statistical 'tests' are simply
a likelihood function that can be package a likelihood function maximum likelihood one of the most popular algorithms for estimating parameters in frequentist models.

Similarly, in a Bayesian world, the likelihood function is essential to the application
of Bayes' theorem to inference, i.e.

$$ P(\theta | \hat{x}) = \frac{P(\hat{x} | \theta) P(\hat{x})}{P(\theta)} = \frac{\mathbb{L}(\hat{x}, \theta)}{\int_\Omega P(\theta) d\Omega}$$

Likelihood functions are in the realm of the analytic.

- emphasize numeric vs analytic 

 For most stochastic processes, we a limited by our ability to describe analytic likelihood functions that can be quickly computed to fit models.


It has long been difficult to describe a likelihood function for a stochastic model of a complex system. However, modern computational power enables us to simulate many replicates of stochastic simulation models, and via the central limit theorem, we can treat the distribution of simulation model outcomes as approaching the likelihood function as the number of replicates increases. This is the central premise of Approximate Bayesian Computation, which has seen extensive use in population genetics, and show much promise in ecology.

Here we describe a model of metacommunity dynamics over time.

## what can we measure in the world?

There is a distinction between observables and latent variables.

### Biotic

- occupancy
- traits, interactions
  - usually in a database, compiled from individual studies with different aims
    - lacking standardization - interaction

### Abiotic

- remote sensing is essential to spatial ecology
- occupancy
- traits, interactions
    - usually in a database, compiled from individual studies with different aims
	- lacking standardization - interaction
- What can we use models to infer?
- Niche vs. Neutral
	- environmental conditions and their relation to ranges and interactions
	- dispersal and neutral colonization/extinction

\pagebreak
# A Metacommunity Model

Poisot 2014 model of interaction networks. Relates to the properties we can measure.

Abstracting and modularity of a model. 



## A Generative Model of Food-Web Topology

Takes on parameters, $\theta_T = \{\dots\}$, and produces a metaweb, $A = \begin{bmatrix} A_{ij} \end{bmatrix}$, where $$A_{ij} = \begin{cases}1 \quad\quad& \text{if interaction is possible} \\ 0 & \text{otherwise}\end{cases}$$

- Niche Model, @williams_simple_2000
  - $\theta_T$ : 
    - number of species, $N_s$
    - connectance, $C$
  - other parameters can represent structure, etc. allesina 
- Generating a metaweb $A$ using the niche model with $\theta_T = \{ N_s, C \}$
  1. Define a value  $n_i$, corresponding to the value of species $i$'s location in the trophic niche space, $n_i \in [0,1]$.
    - For each species, $$n_i \sim U(0,1)$$
  2. Define, for each species $i$, a region $(l_i, u_i)$ on the interval  $[0,1]$ corresponding to the range of niche space which species $i$ eats. For convenience, call the midpoint of this interval $m_i$ and the radius of species $i$'s niche $r_i = \frac{u_i - l_i}{2}$'. via @williams_simple_2000, we know that if we set $E[r_i] = \frac{1}{2C}  - 1$. if $C \in [0,0.5]$, then $\beta \in [0, \infty]$.
    - For each species $$m_i \sim U(0, n_i) $$ $$r_i \sim \beta (a, b)$$ where $a = 1$ and $E[\beta(1, b)] =  \frac{1}{1 + b}$
  
  3. $$A_{ij} = \begin{cases} 1 \quad\quad&\text{if}\  n_j \in (l_i, u_i) \\ 0 &\text{else} \end{cases}$$

## Thermodynamic Community Model

Ecology has long struggled to find generality. There are invariants/constraints in community ecology, so lets use them.

- Biomass distribution across species, $\vec{B}(t)$.
- Bioenergetic model $\frac{\partial B}{\partial t}$, Grilli et al and history.
- Species trait distributions
  - $T_i(t, \vec{x})$.
- Interaction potential $$[ \Phi_{ij}  ] = f(\vec{T}, \vec{B})$$

- bioenergetic 
$$\frac{d\vec{B}_i}{dt} = r_i G_i B_i + \sum_{j \in \text{prey}} [e_{0j}F_{ij}] - \sum_{k \in \text{prod}} [B_k F_{ki}] - x_i B_i - d_i B_i $$



## Spatial Model

- spatial graph or a lattice,
- $\vec{x} \in X$
- how does $x_i$ affect $x_j$? dispersal potential.
- $E_i(t,x)$ spatial distribution of environmental variable / habitat suitability
	- abstraction of multiple environmental variables into a distribution of 'habitat suitability'




## Measuring Community Structure

- $\hat{B}$ -- observed community at some time $t$ and some location $x_j$
- types of measures of network structure
  - $f({\hat{B}})$, singular.
    - a measure of $\alpha$-div
    - most classic meausres, Shannon entropy, etc.
  - $f(\hat{B}(x_j), \hat{B}(x_k))$, measure of difference between two networks, $\beta$-diversity
  - $G(B)$ , measures of total structure across all locations (and times?),  $\gamma$-diversity


\pagebreak
# What does it do?
- simulation can be used to explore the properties of complex systems on scales larger than can be observed.
- using approx. Bayes comp. to fit the results of complex simulation models to data  

## Major Questions
- differentiating niche vs neutral processes in metacommunity assembly, across spatial scale
- critical transitions in community structure
	- when we change strength of environmental factors in shifting survivability/traits
	- when we change dispersal (connectivity, etc)

\pagebreak
# Dissertation Outline
##  Chapter One — A Review of the Metacommunity Literature
-f

##  Chapter Two — A Model of Metacommunity dynamics
- f

##  Chapter Three
- The effect topology on dynamics and community structure
- f

##  Chapter Four
- The effect of trait distributions on community dynamics across space


##  Chapter Five
- The effect of environmental variation and dispersal on metacommunity structure
- Niche and neutral processes, when does it transition across space