---
title: Dissertation Prospectus
author: M.D. Catchen
abstract: |
	\textit{A space capsule could not land on the moon without Newotnian abstractions, nor could it land with them alone. The problem for science is to understand the proper domain of explanation of each abstraction rather than become its prisoner}.  Levins and Lewontin
---

---


\pagebreak

# Introduction

\textit{Only by alienating organism from environment and rigorously separating the ontogenetic sources of variation among organisms from the phylogenetic forces of natural selection could Darwin put evolutionary biology on the right track. So, too, Newton had to separate the forces acting on bodies from the properties of the the bodies themselves: their mass and composition. Yet mass and energy had to be reintegrated to resolve the contradictions of the strict Newtonian view and to make it possible for modern alchemy to turn one element into another. In like manner, Darwinism cannot be carried to completion unless the organism is reintegrated with the inner and outer forces, of which it is both the subject and object.}

\textit{In ecology the isolated community is an abstraction in that no real collection of  species exists that interacts solely with its own members and that receives no popagules from outside. But to be useful as an analytic tool, the idea of community does not require that a group of species be totally isolated from all interactions with other species. Confusion on this point may arise from a failure to appreciate that the general principles of interaction are not the same as quantitative expressions of these interactions. It is undoubtedly true that every body in the universe creates a gravitational field that, in theory, interacts with every other one. Yet when we get up in the morning, our muscles and nerves do no have to compensate for the motion of every body in the universe of even of every other person in the same house...In like manner, all species in the biosphere interact, but the actual matrix of interaction coefficients is essential decomposable into a large number of submatrices almost completely separated by zeros. The problem for the ecologist is not to replace these zeros by infinitesimally small actual numbers, but to find the boundaries of the submatrices and to try to understand the rather large interaction coefficients that exist within them.}

Levontin and Levins



\pagebreak


Ecological systems are complex. Sudden changes induced by humanity. Ecosystem function and services.

Inference and forecasting in complex systems. predictions about orbits, easy. predictions about ecosystems, not easy.

In the early days of quantitative biology, is was assumed that nature sits at an equilibrium. These methods were vestage of cartesian reductionist thought, which was the hegemonic framework for scientific analysis at the time. Methods of analysis via cartesian reductionism has worked and continue to work well in many ways, but their application to so-called complex systems.

Organism as the subject as object of its own evolution. It is constantly changing and erasing the conditions that gave rise to the current condition (Levins Lewontin). Complexity and stochasticity across spatial and temporal scales (Levins)


1. Forecasting and software.
2. Questions about ecology and complex systems

- Interactions within and across scales, Levin
- Community ecology necessarily occurs in both space and time.
- Ecosystems are inherently dynamical systems.
- Ecosystems are complex systems
- Stochasticity is ubiquitous
- Complex systems evade the typical methods of analysis


A natural question is, what exactly is a , 'Dissertation Prospectus'?
I want to describe my understanding of the fields that are related to my work.

- overview the past literature in related fields
- present a description of what i want to do
- present a list of ideas for chapters

A software toolkit utilizing ABC to fit ecological simulation models to datasets that span a variety of ecological scenarios, for the purpose of inference, hypothesis testing, and forecasting
- many scenarios: modular, meaning different questions across scales/types of data can simulated and interface with the software


Ecological science is global endeavor, and by developing tools that are usable and applicable to a wide variety of problems, we can


For models to interface with the world, they must make predictions, $y$ based on observables,
$\hat{x}$ and parameter values $\theta$. $y = f(\hat{x}, \theta)$.

Example: a species distribution model maps environmental conditions, $\hat{x}$, to predictions about species occurance, $y$.
Yet, to fit this model y = $f(\hat{x}, \theta)$, we need some observed instances of both environmental conditions $\hat{x}$ and species
occupancy $\hat{y}$ in order to estimate $\theta$.

Then, we estimate $\theta$ using a variety of methods in both frequentist and Bayesian worlds,
yet what the vast majority of these methods have in common is that they estimate $\theta$ by using a likelihood function,
$\mathbb{L}(\hat{x}, \theta)$.

In a frequentist world, the likelihood function is everywhere. Most off-the-shelf statistical 'tests' are simply repackage a likelihood function that can be package a likelihood function maximum likelihood one of the most popular algorithms for estimating parameters in frequentist models.

Similarly, in a Bayesian world, the likelihood function is essential to the application
of Bayes' theorem to inference, i.e.

$$ P(\theta | \hat{x}) = \frac{P(\hat{x} | \theta) P(\hat{x})}{P(\theta)} = \frac{\mathbb{L}(\hat{x}, \theta)}{\int_\Omega P(\theta | \omega) d\omega}$$

Likelihood functions are in the realm of the analytic.

- emphasize numeric vs analytic

 For most stochastic processes, we a limited by our ability to describe analytic likelihood functions that can be quickly computed to fit models.


It has long been difficult to describe a likelihood function for a stochastic model of a complex system. However, modern computational power enables us to simulate many replicates of stochastic simulation models, and via the central limit theorem, we can treat the distribution of simulation model outcomes as approaching the likelihood function as the number of replicates increases. This is the central premise of Approximate Bayesian Computation, which has seen extensive use in population genetics, and show much promise in ecology.

Here we describe a model of metacommunity dynamics over time.


## Why do we want software that can do this stuff

Simulation models fall into two domains

 - virtual laboratory (IBM book), to experiment with systems that do not fit into the spatial/temporal scale that can be done in real life
    - parameters come from a set of values that the researcher think is interesting
 - inference/testing real systems
    - parameter estimating is essential



Software that is efficient, well-tested/documented, and generalizable is needed to move ecological forecasting/science toward climate/meteorology/etc.


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

## Models, and what they can do

- inference, prediction, forecasting, estimation, hypothesis-testing
- what type of models have we seen in spatial and community ecology?
    - deterministic, mechanistic models
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

- Why does community structure vary in time and space?
- Forecasting
- Stable-states
- How do shifts in landscape structure affect biodiversity that can exist in that landscape?

\pagebreak



\pagebreak

# Literature Overview

## Spatial Ecology Literature
Spatial ecology as it exists today would be radically different if not for @macarthur_and_wilson. The Theory of Island Biogeography (TIBG) is foundational to both spatial and community ecology. TIBG provides a mechanistic explanation for the species-area relationship, one of the most well-established "laws" in ecology.

The theoretical construction of space used by @macarthur_and_wilson---a set of internally homogeneous 'islands', each variable in size and surrounded by inhospitable water/matrix, each either occupied or unoccupied by a particular species---has had deep impacts on many modern methods used to infer ecological patterns across space. Metapopulation theory, coined by @levins_metapop, describes a system of discrete 'patches', all either occupied/unoccupied. Modern occupancy models are rooted in this view of space: discrete observations at spatial coordinates, with environmental covariates.

However, a tension counter to discrete space runs throughout spatial ecology. The availability of remote-sensing technology has enabled the availability of 'continuous' ecological data in the form of rasters. As satellites designed for Earth Science orbit the Earth, they reflect electromagnetic signals at the surface of our planet, and record the spectral signature they receive reflected back at them. The reflective signature of Earth's surface can be used to estimate various properties about its surface. The properties used by both different satellites and different models varies widely in what they try to predict, from the level of coarse land cover categories to the presence of particular species.

- internally homogeneous islands, each a variable distance from the mainland with a fixed 'area'^[area here corresponds to resource availability, and has to spatial significance in the model] and distance from the mainland^[a never-ending source of all species in the metaweb]
	- every species has the same probability of colonization/extinction
	- the species richness at equilibrium as a function of the area replicates the species-area relationship
	- its a process model, which is good--however power-laws are ubiquitous patterns that occur as an outcome due to many different mechanistic processes

From this, we can apply the metapopulation data--occupancy at points, with environmental data at points, to produce rasters that estimate species occupancy based on env data. These species distribution models: max ent, bioclim. what is the strength of env effects?

There is a difference in scale in what this type of data it provides, what time period it covers, and what spatial resolution it has. This "resolution gap" is pervasive in most of the large-scale data sets ecologists try to use: species, etc.


## Community Dynamics

- Quantitative community ecology.

The earliest quantitative models of ecological interactions are typically attributed to Lotka and Volterra, independently.

The Lotka-Voterra (LV) model is defined by a set of coupled differential equations
$$\begin{cases}  \dot{F} = F(\alpha R - \beta) \\   \dot{R} = R(g - \gamma F)  \end{cases} $$
where $R$ represents the abundance of a prey species, typically represented as rabbits, and  $F$ represents the abundance of a preadtor, typically thought of as foxes.

Although the LV model is not great in the sense that it doesn't make accurate predications about the abundance of predator and prey in actual systems, it is what Okubo calls a "toy model", which interntionally oversimplifies the dynamics of a complex process (like predator-prey interactions) into a system that we can study using the tools of mathematical analysis.
From a mathematical standpoint, what is interesting about the LV model is that it exhibits limit-cycles, whereby both abundance of predator and prey both change over time in a regular cycle--a dynamic equilibrium.   




- Lotka Voltera model
- MacArthur CR model


- Macarthur and wilson
- types of community interactions
- ecological networks
- Neutral theory
	- hubbell and Neutral
    - nearly neutral



## Metacommunities

- The metacommunity concept as a 'network of networks'-- a spatial network
- leibold {leibold_metacommunity_2004}
  - four paradigms
    1. Patch dynamics perspective
    2. Species sorting perspective
    3. Mass-effect
    4. Neutral

- velland 2010
  - 1. selection
    2. dispersal
    3. drift
    4. speciation

- @pillai_metacommunity_2011

- Poisot 2014

- recent ecology letters papers



- Joint SDMS

## Food Web Topology

The structure of food-webs has been one of the most studied topics in ecology over the last 50 years.

- Brief review of the history of generative models of food-web topology
  - May, stability and complexity
  - cascade model, using one dimensional niche space, a proxy for allometric scaling
  - niche model
  - allesina, likelihood function to infer niche model parameters from real food webs
    - a way to generate food-webs with similar topological structure to an empirical web, to use simulation to make statement about stability

## Bioenergetic Community Models

It's true that community ecology has been called "a mess" (citation). Many of the premises of ecology necessitate that its phenomena are complex is cause and outcome.


When studying any system, one of the most powerful tools of inquiry is paying attention to what is _invariant_, meaning that which does not change in the system, even as we adjust its parameters. Mathematicians understand this deeply. Ecosystems vary in seemingly dimensionless ways. Yet, we can still find an invariant in ecology---the amount of energy per unit area on the planet is a measurable value, and it has to go somewhere.

It's true, the word 'bioenergetic' does sound like I'm about to try to sell you a collection of conveniently-priced crystals that will keep the bears away. However, it is fewer syllables than any of its potential synonyms, so I'm hoping we'll just be able to meet in the middle on this one.

through poisot lab, a software package to simulate innes model with diffeq solver
 - real ecosystems are not governed by deterministic forces
 -  stochasticity in interactions, for a variety of reasons


\pagebreak
# A Metacommunity Model

Poisot 2014 model of interaction networks. Relates to the properties we can measure.

Abstracting and modularity of a model.

Three parts:

1. Community Model: $A$, and $\frac{\partial B}{\partial t}$
2. Spatial Model: Dispersal potential $\Phi_{ij}$, Habitat suitability $H_i(x)$
3. Selection Model: $\frac{\partial T_i(x,t)}{\partial t} = f(H_i(x))$


## 1. Community Model

What is a community? Energy flow on a graph.
Why do we need generative models? How do we model energy flow on a graph?

Two components, the topology of the metaweb, $A$, and dynamics, $\frac{\partial B}{\partial t}$


### A Generative Model of Food-Web Topology

Takes on parameters, $\theta_T = \{\dots\}$, and produces a metaweb, $A = \begin{bmatrix} A_{ij} \end{bmatrix}$, where $$A_{ij} = \begin{cases}1 \quad\quad& \text{if interaction is possible} \\ 0 & \text{otherwise}\end{cases}$$

- Niche Model, @williams_simple_2000
  - $\theta_T$ :
    - number of species, $N_s$
    - connectance, $C$
  - other parameters can represent structure, etc. allesina
- Generating a metaweb $A$ using the niche model with $\theta_T = \{ N_s, C \}$
  1. Define a value  $n_i$, corresponding to the value of species $i$'s location in the trophic niche space, $n_i \in [0,1]$.
    - For each species, $$n_i \sim U(0,1)$$
  2. Define, for each species $i$, a region $(l_i, u_i)$ on the interval  $[0,1]$ corresponding to the range of niche space which species $i$ eats. For convenience, call the midpoint of this interval $m_i$ and the radius of species $i$'s niche $r_i = \frac{u_i - l_i}{2}$  via @williams_simple_2000, we know that if we set $E[r_i] = \frac{1}{2C}  - 1$. if $C \in [0,0.5]$, then $\beta \in [0, \infty]$.
    - For each species $$m_i \sim U(0, n_i)$$  $$r_i \sim \beta (a, b)$$ where $a = 1$ and $E[\beta(1, b)] =  \frac{1}{1 + b}$

  3. $$A_{ij} = \begin{cases} bad \end{cases}$$
  4. $f$


### Thermodynamic Consumer-Resource Model (TCRM)

Ecology has long struggled to find generality. There are invariants/constraints in community ecology, so lets use them.

- Biomass distribution across species, $\vec{B}(t)$.
- Bioenergetic model $\frac{\partial B}{\partial t}$, dominguez-garcia et al and history.
- Species trait distributions
  - $T_i(t, \vec{x})$.
- Interaction potential $$[ \Phi_{ij}  ] = f(\vec{T}, \vec{B})$$
- thermodynamic consumer-resource model (tcrm) $$\frac{d\vec{B}_i}{dt} = r_i G_i B_i + \sum_{j \in \text{prey}} [e_{0j}F_{ij}] - \sum_{k \in \text{prod}} [B_k F_{ki}] - x_i B_i - d_i B_i$$

  - $r_i$ : indicator for plants/primary production $$r_i = \begin{cases} 1 \quad\quad\quad &\text{if } i \text{ is a primary producer} \\ 0 &\text{otherwise}\end{cases}$$
  - $x_i$: metabolic demand for species $i$   $$x_i = \begin{cases} 0.138m_i^{0.25} \quad\quad\quad & \text{if primary producer} \\ 0.314m_i^{0.25} & \text{else} \end{cases}$$
  - $d_i$: natural mortality rate $$d_i  = d_0 x_i $$ with $d_0 = 0.1$
  - $e_{ij}$ : efficiency of energy conversion from $i \to j$
  - $G_i$: growth of primary producers
  - $F_{ij}$ : functional response $i \to j$

## 2. Spatial Model

- spatial graph or a lattice,
- abstraction of multiple environmental variables into a distribution of 'habitat suitability',
- however, this is a function of traits also $H_i= f(T_i(x), E_i(x))$
- $\vec{x} \in X$
- how does $x_i$ affect $x_j$? dispersal potential.




## 3. Selection Model

Model of how that traits $T_i$ and growth rate $r_i$ change as a function of $H_i(x,t)$

$$\frac{\partial T_i(x,t)}{\partial t} = f(T_i(x), H_i(x))$$

One simple way



## 4. Measuring Community Structure

- $\hat{B}$ -- observed community at some time $t$ and some location $x_j$
- types of measures of network structure
  - $f({\hat{B}})$, singular.
    - a measure of $\alpha$-div
    - most classic measures, Shannon entropy, etc.
  - $f(\hat{B}(x_j), \hat{B}(x_k))$, measure of difference between two networks, $\beta$-diversity
  - $G(B)$ , measures of total structure across all locations (and times?),  $\gamma$-diversity


\pagebreak
# What does it do?
- software that is modular and can be fit to data in real systems in multiple ways
  - you can provide, $A$, or $S$, different versions of a selection function $S$
- simulation can be used to explore the properties of complex systems on scales larger than can be observed.
- using approx. Bayes comp. to fit the results of complex simulation models to data
- identify fixed points for a given food web topology, and forecast its behavior under hypothetical environment/land use scenarios

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
