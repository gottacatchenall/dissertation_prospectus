---
title: Dissertation Prospectus
author: M.D. Catchen
abstract: |
	\textit{La guêpe et l'orchidée font rhizome, en tant que hétérogènes}. \hfill \\\ \hfill \\\ \text{deleuze and guattari, a thousand pleateaus}
---

# Introduction

In Edmond Halley's _Synopsis of the Astronomy of Comets_ (1705), Halley used his friend and colleague Issac Newton's model of gravitation to estimate the orbit of his now eponymous comet. Halley conjectured that past observation of 'different' comets, each appearing roughly 76 years after the previous, were in fact the same object, and that the variability in the period of the comet was attributable to the variable gravitational influence of Jupiter and Saturn. Halley's computations enabled him to predict his comet's eventual return to Earth in 1758, and although he didn't live to observe his prediction come true, his prediction helped provide the initial validation of much of Newtonian mechanics and Kepler's theory of elliptical orbits.

The success of Haley's prediction also further (supported) the methods of Cartesian reductionism as the principle  (ideology) to scientific understanding. There is no natural system that is not complex. The motion of matter is subject to the ever-changing pairwise gravitational forces of all matter in existence, and yet Halley was successful in approximating the universe with the set $A = \{\text{Sun}, \text{Jupiter}, \text{Saturn}, \text{Earth}, \text{Comet} \}$. 

In ecology (and the biological sciences in general), we are not so lucky. Ecological systems have long evaded effective prediction not just because they are inherently complex, but also because their complexity is (irreducible) to a set of concepts from which neat and tidy quantitative predictions can be made. Further, they are adaptive---organisms are both the subject and object of their evolution, constantly in flux, erasing the conditions that gave rise to the current condition (@levins_lewontin). 



Describe how simulation models can be used for complex phenomena. Describe a model of metacommunity dynamics based around @poisot_2014 and @velland_2010.  

Describe the software I'm going to build.

Simulation has two parts: 

 - virtual laboratory (@volker_grimm_ibm), to experiment with systems that do not fit into the spatial/temporal scale that can be done in real life
   - parameters come from a set of values that the researcher think is interesting
 - inference/testing real systems
   - parameter estimating is essential part of this





# Models and Data

I would classify the vast majority of time I spend "working" (under the categories of) building, interpreting, thinking, reading, writing, and talking about models.  So what are these models? 

At its core a model must map observable input conditions $x$ to observable output conditions $\hat{y}$ as a function of both $x$ and model parameters $\theta$ which typically are scalar coefficients used  in the definition of the mapping $\hat{y} = f(\hat{x}, \theta)$.  

If $\hat{y} \approx  y$, we say our model $f$ is "good", and we Google "Nature submission instructions".

Model selection has deep and rich history, starting somewhere near "Occam's Razor" and ending with computer science folks talking to you about "bits" and "k-fold crossvalidation". Outside the scope of this document. 



Indeed, all scientific models must define some set of conceptual objects^[Woah, man.] $A \in \text{Universe}$. What is observable about concepts? Mapping from conceptual frameworks $A$ to quantitative metric $g: A \to \mathbb{R}^{d_1}$. And so scientific models inevitably create a mapping between observable states of the concepts as we define them, and quantitative predicted outcomes, $f : g(A) \to \mathbb{R}^{d_2}$

In Halley's model $A = \{\text{Sun}, \text{Jupiter}, \text{Saturn}, \text{Earth}, \text{Comet} \}$

A model $$f : g(A) \to \mathbb{R}^d$$, which further derives measurable quantities about the "objects" in $A$, (mass, position, momentum)^[If we want truly "unambiguous" results, it is also important to choose quantities that can be measured simultaneously, a lesson that physicists would learn doesn't apply to position and momentum in the early 20th century].   

And so the question for those who are interested in (building, designing, using, etc.) models face the task of defining $f$ in such a way that it (hopefully) makes accurate predictions. 

We can broadly split models into two types:

1. Process Models

2. Statistical Models

Other types of statistical models (typically those that full under the ambiguous banner "machine learning") do not define $f$ with much regard towards the actual concepts $A$ at all, but instead are cleverly designed algorithms which can accurately map input conditions to output conditions in some cases. 



Models do many different things: hypothesis testing, inference, parameter estimation, forecasting,etc.



Often, when we do science, models are only a bridge between the data we collect and actual hypotheses. See the figure below from @mcelreath. 



![From McElreath 2019--the relationship between hypotheses, process models, and statistical models represented as a network. Original caption: _Relations among hypotheses (left), detailed process models (middle), and statistical models (right), illustrated by the example of “neu- tral” models of evolution. Hypotheses (H) are typically vague, and so cor- respond to more than one process model (P). Statistical evaluations of hy- potheses rarely address process models directly.  Instead, they rely upon statistical models (M), all of which reflect only some aspects of the process models. As a result, relations are multiple in both directions: Hypotheses do not imply unique models, and models do not imply unique hypotheses. This fact greatly complicates statistical inference._](/home/michael/prospectus/tex/figures/mcelreath.png)



There are no natural isomorphisms from hypotheses to statistical models---conflicting hypotheses can be consistent with a single result of a statistical model if the statistical model produces the same outcomes under processes that correspond to conflicting hypotheses.

A feature of many statistical models that we employ in complex systems is that they dramatically reduce the dimensionality of our data. This is often done out of sheer necessity--however an unfortunate byproduct of some summary statistics is that they produce the same results under differing process models. To use the example from Figure 1, models for inferring selection historically rely on summary statistics like $F_{ST}$, often summarized across multiple loci, in order to "test" the observed value of $F_{ST}$ against some expectation, like migration-drift balance, to determine if there is evidence of selection. 

Statistical models are certainly not without value, however, the increasing availability of computing power to simulate complex process models at large scales have enabled the gap between process models and statistical models to shrink in recent years--largely due to the advances in the methods of Approximate Bayesian Computation (ABC). Conveniently, with respect to the  example we've been using, one trend in evolutionary genetics is to "test" for selection using simulation models, which represent a more detailed representation of the process that can be captured with most conventional statistical models. A researcher can implement a simulation model whereby genomes, individuals, and populations are represented at any level of detail imaginable, and one can then use ABC methods to infer model parameters, and to use model (comparison) criteria to determine which mechanistic process is more likely to have produced a dataset.



If summary statistics are not differentiable at the level of the process, that itself is interesting, and in general simulation models are excellent testing grounds for the biases of summary statistics.  



In order to understand why ABC has significant potential in ecology, it is best to start by asking: what is it that makes applying statistical models to data so much easier than process models? To fit a model y = $f(\hat{x}, \theta)$, we need some observed instances of both environmental conditions $\hat{x}$ and species occupancy $\hat{y}$ in order to estimate $\theta$.

Then, we estimate $\theta$ using a variety of methods in both frequentist and Bayesian worlds,
yet what the vast majority of these methods have in common is that they estimate $\theta$ by using a likelihood function,
$\mathbb{L}(\hat{x}, \theta)$.

In a frequentist world, the likelihood function is everywhere. Most off-the-shelf statistical 'tests' are simply repackage a likelihood function that can be package a likelihood function maximum likelihood one of the most popular algorithms for estimating parameters in frequentist models.

Similarly, in a Bayesian world, the likelihood function is essential to the application
of Bayes' theorem to inference, i.e.

$$ P(\theta | \hat{x}) = \frac{P(\hat{x} | \theta) P(\hat{x})}{P(\theta)} = \frac{\mathbb{L}(\hat{x}, \theta)}{\int_\Omega P(\theta | \omega) d\omega}$$

Likelihood functions are in the realm of the analytic.

- emphasize numeric vs analytic



It has long been difficult to describe a likelihood function for a stochastic model of a complex system. In general for most stochastic processes we are limited by our ability to describe analytic likelihood functions that can be quickly computed to fit models.



However, modern computational power enables us to simulate many replicates of stochastic simulation models, and via the central limit theorem^[There are notable caveats here, primarily that if the true distribution that we are trying to approximate doesn't have finite variance, CLT no longer applies.], we can treat the distribution of simulation model outcomes as approaching the likelihood function as the number of replicates increases. 



Simulation models have long been used forecasting and inference of complex systems. One does not struggle to list fields where simulation models are a ubiquitous tool of the trade--climate science, meteorology, epidemiology, etc. Ecology has much to gain in adopting these methods as regular.  	



Goal of dissertation is to build simulation models that can be used for ABC in real systems and also for the virtual lab stuff. 



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
 - stochasticity in interactions, for a variety of reasons

