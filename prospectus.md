---
title: Dissertation Prospectus
author: M.D. Catchen

header-includes: |
    \patchcmd{\@maketitle}{\@title}{\fontsize{12}\@title}{}{}
---

---
\pagebreak
# Introduction

## Why is community ecology related to biodiversity, evolution, broad questions?
- Interactions within and across scales, Levin
- Community ecology necessarily occurs in both space and time.
- Ecosystems are inherently dynamical systems.

\pagebreak
# Literature Overview

- Spatial ecology Literature
    - macarthur and wilson
    - levins
    - continuous space
        - SDMs, lattices
- Community ecology
    - early dynamical models of communities
        - LV, Levins, Macarthur and wilson
    - Neutral
        - hubbell and Neutral
        - nearly neutral
    - metacommunities
        - early
        - Poisot 2014
        - Joint SDMS
- Models, and what they can do
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
- What questions are relevant and remain unaddressed?
    - Forecasting
    - How do shifts in landscape structure affect biodiversity that can exist in that landscape?


Dang i'm just chillin


\pagebreak
# The Model

For models to interface with the world, they must make predictions, $y$ based on observables,
$\hat{x}$ and parameter values $\theta$. $y = f(\hat{x}, \theta)$.

Most models do this via a likelihood function, $\mathbb{L}(\hat{x}, \theta)$.
In a frequentist world, the likelihood function is everywhere,
maximum likelihood one of the most popular algorithms for estimating parameters in frequentist models.

Similarly, in a Bayesian world, the likelihood function is essential to the application
of Bayes' theorem to inference, i.e.

$$ P(\theta | \hat{x}) = \frac{P(\hat{x} | \theta) P(\hat{x})}{Pr(\theta)} = \frac{\mathbb{L}(\hat{x}, \theta)}{\int_\Omega Pr(\theta) d\Omega}$$


It has long been difficult to describe a likelihood function for a
stochastic model of a complex system. However, modern computational power enables us
to simulate many replicates of stochastic simulation models, and via the central limit theorem,
we can treat the distribution of simulation model outcomes as approaching the likelihood function
as the number of replicates increases. This is the central premise of Approximate Bayesian Computation, which has
seen extensive use in population genetics, and show much promise in ecology.


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

## Whats a convenient mathematical framework to write this down?

Poisot 2014 model of interactoin networks
- Environmental Conditions in space and time $E_i(x,t)$
- Species Indicator (occupancy/abundance) in space and time $S_i(x,t)$
- Traits in space and time $T_i(x,t)$
- Interaction Network $A_{ij}(x,t)$

For each location, $(x,y) \in \{(i,j) \in \mathbb{N}^{2}_{< L}\}$,

$$S_i\big(\vec{x}, t\big) = f\bigg(S\big(\vec{x}, t-1\big)\bigg)$$

### differential

$$ f_i(\vec{S}) = S_i + \Delta t \bigg[\sum_j S_i [M(\vec{S})]_{ij} \bigg] $$

where $M(\vec{S})$ describes energy dynamics on the metaweb.

### summarizing community structure

how do we summarize community structure in a lattice? summary metric, $g(\vec{x}, \vec{S}, t)$, which describes community structure in each cell

## Major Questions

- differentiating niche vs neutral processes in metacommunity assembly
- critical transitions in community structure
	- when we change strength of environmental factors
	- when we change dispersal (connectivity, etc)


## What does it _do_?

# Dissertation Outline
##  **Chapter One** —
- f

##  **Chapter Two** —
- f

##  **Chapter Three** —
- f
