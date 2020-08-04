---
title: Dissertation Prospectus
author: M.D. Catchen
abstract: |
	i'm just out here grillin' :shades:
---

\textit{La guêpe et l'orchidée font rhizome, en tant que hétérogènes}. \hfill	\\
\textit{deleuze and guattari, a thousand pleateaus} \hfill \\ \hfill \\

\textit{Given the nature of all this new shit, you know, I-I-I-I... this could be a-a-a-a lot more, uh, uh, uh, uh, uh, uh, complex, I mean, it's not just, it might not be just such a simple... uh, you know?} \hfill \\ Joel & Ethan Coen, \textit{The Big Lebowski}

# Introduction

In Edmond Halley's _Synopsis of the Astronomy of Comets_ (1705), Halley used Newton's model of gravitation to estimate the orbit of his now eponymous comet. Halley conjectured that past observations of "different" comets, each appearing roughly 76 years after the previous, were in fact the same object, and that the variability in the comet's period was attributable to the variable gravitational influence of Jupiter and Saturn. Halley's computations enabled him to predict his comet's eventual return to Earth in 1758, and although he didn't live to observe his prediction come true, his work helped provide the initial validation of much of Newtonian mechanics and Kepler's theory of elliptical orbits.

The success of Halley's prediction also further (supported) the methods of Cartesian reductionism as the principal ideology in scientific understanding. There is no natural system that is not complex. The motion of matter is subject to the ever-changing pairwise gravitational forces of all matter in existence, and yet Halley was successful in approximating the universe with the set $A = \{\text{Sun}, \text{Jupiter}, \text{Saturn}, \text{Earth}, \text{Comet} \}$. 

In ecology (and the biological sciences in general), we are not so lucky. Ecological systems have long evaded effective prediction not just because they are inherently complex (in both a mathematical and lehperson sense of the word), but also because their complexity is irreducible to a set of concepts from which neat and tidy quantitative predictions can be made. As an example, consider the Lotka-Volterra model. Much like the model of Newtonian gravity Halley applied to his comet, LV is written in the language of ordinary-differential equations^[The reality is computing the gravitational dynamics of more than two bodies of comparable mass is, much like ecological modeling, tough. Halley was able to work around the infamous n-body problem, but modern astrodynamicists use simulation models for many of the same reasons we advocate their use in ecology, coming up in the main text.]. Yet, LV doesn't succeed predicting the true abundance of predator-and-prey species in most systems with much accuracy, 76 years out or otherwise. This is not to say the LV model is not interesting and worthy of study in its own right--it is what Okubo (1972) calls a "toy model"--an intentional oversimplification that can illuminate the dynamics pf real systems (clean sentence up). The characteristic feature of the LV model are its boom-and-bust limit cycles, and this qualitative behavior is observed in many systems. However, for the purposes of inference and forecasting, there is at least enough influence on the abundance of each species from the combined factors of environmental and demographic stochasticity, trait-matching, spatial distributions, and so on, that LV isn't suited for applications in conservation management. 



Ecosystems are emergent phenomena, stochastic and variable at all scales. In biology, we find that our attempts to reduce a systems down to the level of atomic units does not  necessarily succeed because at any level of biological organization there is internal heterogeneity (Levins and Lewontin). In community ecology, it seems that atomic level of organization is naturally the individual of a given species. Yet, adopting the Platonic form "individual" neglects the immense variability in the processes that compose any given individual. Certainly this abstraction would cause consternation from the behavioral ecologists down the hall, to the cell biologists studying gene expression, to the biochemists doing, uh, you know, biochemistry. This is not to say that we should build ecological models starting from the building blocks of particle physics (Levins 1992), but instead we must be cognizant of what our models treat as homogeneous--a false premise in biological systems.    



> A space capsule could not land on the moon without Newtonian abstractions, nor could it land with them alone. The problem for science is to understand the proper domain of explanation of each abstraction rather than become its prisoner.
>
> 
>
> Lewontin and Levins  (1978?)



Simulation models have generally upended the methods of science across all disciplines because they enable us to explore the "proper domain of explanation of each abstraction" with more care, and often less required expertise, than the tools of analytical math. We can directly incorporate stochastic behavior into our models, and the modular nature of software means any conceptual object used in a simulation model can be represented in as much fidelity as the author chooses. One can implement the LV model (without any in-depth knowledge of how to solve differential equations, in fact) in 30 lines of code, or create the most convoluted individual-based community model imaginable--it then becomes within the author's purview to define the "proper domain of explanation of each abstraction".



Using simulation models, we contest, we can now explore the complex processes that produce the astounding biodiversity we see on Earth in far more detail, and with greater respect toward their complexity. Further, these tools have potential as we attempt to understand the dramatic influence humans have on  our planet and the life to which it is a unique home. Simulation models have long been used for forecasting and inference in complex systems. One does not struggle to list fields where simulation models are a ubiquitous tool of the trade--climate science, meteorology, epidemiology, etc. Ecology has much to gain in adopting these methods as regular. There are certainly challenges in this domain--how do we find a bridge between complex simulation models and data? How do we validate that these simulation models 'work', in that they accurately represent the ecological process they are meant to model?---some potential answers will be discussed further in the next section. 

The primary goal of this prospectus is to outline the need for simulation models in biodiversity science, both for the purposes of answering "purely" scientific questions, but also for forecasting and management in real ecological systems. Most studies which incorporate simulation tend to fall into one of two categories: the first being where the simulation model is used as a "virtual laboratory" (@volker_grimm_ibm) to experiment with systems that do not fit into the spatial/temporal scale that can be done in real life, the second being for the application of a simulation model to a real system. In the "virtual laboratory" case, the parameter values often are meant to encapsulate the the entire spectrum of possible values, are based in what the researcher (or reviewers) find interesting. In the second case, parameter inference is vital in producing useful preditions. 



Here, we outline how simulation models can be used to make predictions with real data. We then describe a process-based model of metacommunity dynamics (based around @poisot_2014 and @velland_2010, that recent ecology letters paper). 

We then detail how we'll implement this model as software that is modular and can be used to answer questions in the "virtual laboratory" case, as well as to be fit for real systems. We then conclude by outlining the structure/point of each dissertation chapter. 



# Literature Overview

biodiversity has many dimensions, here we focus on community. rhizomatic field of study, no de facto entrance. 

get at the fundamental questions again and thats why you are reviewing these fields. 

## Models and Data

I would classify the vast majority of time I spend "working" (under the categories of) building, interpreting, thinking, reading, writing, and talking about models.  So what are these models? 

At its core a model must map observable input conditions $x$ to observable output conditions $y$ as a function of both $x$ and model parameters $\theta$ which typically are scalar coefficients used  in the definition of the mapping $y = f(\hat{x}, \theta)$.  

If $\hat{y} \approx  y$, we say our model $f$ is "good", and we Google "Nature submission instructions". If not, we say our model is bad and try something else. Model selection has deep and rich history, starting somewhere near "Occam's Razor" and ending far outside the scope of this document. For our purposes, it suffices to understand that there exist several model selection criteria that enable us to determine which of a set of competing explanatory models, $\{f_1, f_2, \dots\}$ provides the highest fidelity explanation of our data. 



What separates science from philosophy? For most of recorded human history, science and philosophy were not separate disciplines, and most languages wouldn't distinguish a scientist from a philosopher. 

> In fact, the sciences, arts, and philosophies are all equally creators. . . Concepts
> do not wait for us ready-made, like celestial bodies. There is no heaven for
> concepts. They must be invented, fabricated, or rather created, and would be
> nothing without the signature of those who create them. (Deleuze & Guattari
> 1991)

We both create abstractions to model systems

I would contest science restricts itself to models that allow some interface between the conceptual models we make and that which is observable about the world.  

such that they can be compared with so-called 'ground truth'.

Indeed, all scientific models must define some set of conceptual objects $A \in \text{Universe}$. What is observable about concepts? Mapping from conceptual frameworks $A$ to quantitative metric $g: A \to \mathbb{R}^{d_1}$. And so scientific models inevitably create a mapping between observable states of the concepts as we define them, and quantitative predicted outcomes, $f : g(A) \to \mathbb{R}^{d_2}$

In Halley's model $A = \{\text{Sun}, \text{Jupiter}, \text{Saturn}, \text{Earth}, \text{Comet} \}$

A model $$f : g(A) \to \mathbb{R}^d$$, which further derives measurable quantities about the "objects" in $A$, (mass, position, momentum)^[If we want truly "unambiguous" results, it is also important to choose quantities that can be measured simultaneously, a lesson that physicists would learn doesn't apply to position and momentum in the early 20th century].   

And so the question for those who are interested in (building, designing, using, etc.) models face the task of defining $f$ in such a way that it (hopefully) makes accurate predictions. 

We can broadly split models into two types:

1. Process Models

2. Statistical Models

Other types of statistical models (typically those that fall under the ambiguous banner "machine learning") do not define $f$ with much regard towards the actual concepts in $A$ at all, but instead are cleverly designed algorithms which can accurately map input conditions to output conditions in some cases. 



Models do many different things: hypothesis testing, inference, parameter estimation, forecasting,etc.



Often, when we do science, models are only a bridge between the data we collect and actual hypotheses. See the figure below from @mcelreath. 



![From McElreath 2019--the relationship between hypotheses, process models, and statistical models represented as a network. Original caption: _Relations among hypotheses (left), detailed process models (middle), and statistical models (right), illustrated by the example of “neu- tral” models of evolution. Hypotheses (H) are typically vague, and so cor- respond to more than one process model (P). Statistical evaluations of hy- potheses rarely address process models directly.  Instead, they rely upon statistical models (M), all of which reflect only some aspects of the process models. As a result, relations are multiple in both directions: Hypotheses do not imply unique models, and models do not imply unique hypotheses. This fact greatly complicates statistical inference._](/home/michael/prospectus/tex/figures/mcelreath.png)



There are no natural isomorphisms from hypotheses to statistical models---conflicting hypotheses can be consistent with a single result of a statistical model if the statistical model produces the same outcomes under processes that correspond to conflicting hypotheses.

A feature of many statistical models that we employ in complex systems is that they dramatically reduce the dimensionality of our data. This is often done out of sheer necessity, either for degrees-of-freedom or sanity--however an unfortunate byproduct of some summary statistics is that they produce the same results under differing process models. To use the example from Figure 1, models for inferring selection historically rely on summary statistics like $F_{ST}$, often summarized across multiple loci, in order to "test" the observed value of $F_{ST}$ against some expectation, like migration-drift balance, to determine if there is evidence of selection. 



Process models use conceptual objects $A$ that (at least with perfect information) could be measured---dispersal, traits, environmental conditions, etc. Summary statistics are usually pure abstractions that may/may not correspond to anything in the real world. 





Purely statistical models are certainly not without value--much of our current techno-(u/dys)topia relies on the humble logistic regression. However, for the purposes of inference and forecasting in biodiversity science, and complex systems in general, the increasing availability of computing power to simulate complex process models at large scales have enabled the gap between process models and statistical models to shrink in recent years. To return to our example from Figure 1, the last decade has seen significant interest in Approximate Bayesian Computation (ABC) methods in evolutionary genetics "test" for selection using simulation models. A researcher can implement a simulation model whereby genomes, individuals, and populations are represented at any level of detail imaginable, and one can then use ABC methods to infer model parameters, and to use model (comparison) criteria to determine which mechanistic process is more likely to have produced a dataset. If summary statistics are not differentiable at the level of the process, that itself is interesting, and, in general, simulation models are excellent testing grounds for the biases of summary statistics.  



In order to understand why ABC has significant potential in ecology, it is best to start by asking: what is it that makes applying statistical models to data so much easier than process models? The problem begins with the difficulty of estimating the value of parameters in a process model from real data. All models have 'parameters', some latent variable that cannot feasibly be measured, i.e. all parameters are objects outside of $g(A)$. Parameters may only exist in our imaginations--they are real in the way the number $5$ is real.

As an example, consider fitting a species-distribution model (SDM), $y = f(x, \theta)$, where $x$ is an environmental variable measured across space, and $y$ is the predicted probability of a given species being present. To fit this model y = $f(x, \theta)$, we need some observed instances of both environmental conditions $\hat{x}$ and species occupancy $\hat{y}$ in order to estimate $\theta$. There are seemingly unending methods of estimating $\theta$ using a variety of methods in both frequentist and Bayesian worlds, yet what the vast majority of these methods have in common is that they estimate $\theta$ by using a likelihood function, $\mathbb{L}(\hat{x} | \theta)$, which is defined as the probability of observing some data point $\hat{x}$ given a model definition $f$ and some parameter values $\theta$. If our model $f$ is simple, this can be written analytically, e.g. if we describe a naive SDM where the probability of occurrence at a location in space $\vec{L}$ is given by the difference between the 'mean' trait value of a species, $T$, and the some environmental condition $E(\vec{L})$ related to the trait in question^[Of course, capturing the capacity for a species to persist using a single dimension is, to say the least, unlikely. The oversimplification here is in service of defining the most simple model possible.],  we can define a model $f$ that says the probability of occurrence at $\vec{L}$ is a Gaussian evaluated at $E(\vec{L}) - T$, and induces has a single parameter, $\theta = \{ \sigma \}$. Because our model  from an analytically tractable distribution, we can write down our likelihood $L(x|\theta)$ fairly easily: $$\mathbb{L}(\text{Species present at} \ \vec{L} \ |\  \sigma) = \frac{1}{\sqrt{2\sigma}} \exp \Big( \frac{-(T-E(\vec{L}))^2}{2\sigma^2} \Big)$$   

The ability to write our likelihood down in simple analytic terms means that value of $\mathbb{L}$ is straightforward to compute, and then we are free to apply any number of parameter inference methods to estimate $\sigma$ . Once we know $\sigma$, we can estimate the probability of occurrence at any point in space by simply evaluating $\mathbb{L}$ at that location, at which point we have a fully-fledged SDM. 

In a frequentist world, the likelihood function is a ubiquitous tool for parameter inference. Most off-the-shelf statistical 'tests'^[e.g. `model = lm(y ~ a*x + b)`] are simply a repackaged likelihood function that can be used to estimate parameters via maximum likelihood or any other frequentist estimation method.  Similarly, in a Bayesian world, the likelihood function is essential in the application of Bayes' theorem to inference,

$$ P(\theta | \hat{x}) = \frac{P(\hat{x} | \theta) P(\theta)}{P(\hat{x})} = \frac{\mathbb{L}(\hat{x}, \theta) P(\theta)}{\int_\Theta \mathbb{L(\hat{x} | \theta)} P(\theta) d\theta}$$



What then, if we want to describe a model $f$ where the probability of occurrence is driven by both neutral changes in spatial distributions, environmental stochasticity, variability in traits in space and time, etc.? One can imagine constructing a monstrous likelihood function, compiled of distributions stack on top of each other forever. But if one wants to introduce covariance into these distributions, it quickly begins to require statistical expertise that is beyond what is reasonable for any non-practitioner of the field to know, especially for ecologists who are devoted to the management of a particular system and must also be asked to keep up with its natural history, etc. Thankfully, we have software like STAN which makes application of more complex models like this to be written and applied quickly, however such models still inevitably rely on assumptions about processes that have been abstracted away from the mechanism producing the data, and instead toward a statistical representation of a process that is subject to the pitfalls presented in Figure 1. 



The gap between statistical and process models has long been the inability to adequately represent the likelihood function for a complex stochastic process. However, modern computational power enables us to simulate many replicates of stochastic simulation models, and via the central limit theorem^[There are notable caveats here, primarily that if the true distribution that we are trying to approximate doesn't have finite variance, CLT no longer applies.], we can treat the distribution of simulation model outcomes as approaching the likelihood function as the number of replicates increases. This is the central premise of Approximate Bayesian Computation (ABC), although similar methods for fitting simulations to data have appeared in many fields of study under different names. 



Why are you about to do a review? Need a transition to literature related to question I'm asking in community ecology.  



## Spatial Ecology 

Spatial ecology as it exists today would be radically different if not for @macarthur_and_wilson. The Theory of Island Biogeography (TIBG) is a foundation for both spatial and community ecology. TIBG provides a mechanistic explanation for the species-area relationship, one of the most well-established "laws" in ecology.

The theoretical construction of space used by @macarthur_and_wilson---a set of internally homogeneous 'islands', each variable in size and surrounded by inhospitable water/matrix, each either occupied or unoccupied by a particular species---has had deep impacts on many modern methods used to infer ecological patterns across space. Metapopulation theory, coined by @levins_metapop, describes a system of discrete 'patches', all either occupied/unoccupied. Modern occupancy models are rooted in this view of space: discrete observations at spatial coordinates, with environmental covariates.

internally homogeneous islands, each a variable distance from the mainland with a fixed 'area'^[area here corresponds to resource availability, and has to spatial significance in the model] and distance from the mainland^[a never-ending source of all species in the metaweb]

- every species has the same probability of colonization/extinction
- the species richness at equilibrium as a function of the area replicates the species-area relationship
- its a process model, which is good--however power-laws are ubiquitous patterns that occur as an outcome due to many different mechanistic processes

However, a tension counter to discrete space runs throughout spatial ecology. The availability of remote-sensing technology has enabled the availability of 'continuous' ecological data in the form of rasters. As satellites designed for Earth Science orbit the Earth, they reflect electromagnetic signals at the surface of our planet, and record the spectral signature they receive reflected back at them. The reflective signature of Earth's terrain can be used to estimate various properties about its surface. The properties used by both different satellites and different models vary widely in what they try to predict---from the level of coarse land-cover categorizations to the presence of particular species.

From this, we can apply the metapopulation data--occupancy at points, with environmental data at points, to produce rasters that estimate species occupancy based on env data. These species distribution models: max ent, bioclim. what is the strength of env effects?

There is a difference in scale in what this type of data it provides, what time period it covers, and what spatial resolution it has. This "resolution gap" is pervasive in most of the large-scale data sets ecologists try to use: species, etc.


## Community Structure

The search for generality among ecological communities long flummoxed early ecologists, culminating in the (saying) community ecology is "a mess" (citation). 



Why do we want generative models? 

The structure of food-webs has been one of the most studied topics in ecology over the last 50 years.

- Brief review of the history of generative models of food-web topology
  - May, stability and complexity
  - cascade model, using one dimensional niche space, a proxy for allometric scaling
  - niche model
  - allesina, likelihood function to infer niche model parameters from real food webs
    - a way to generate food-webs with similar topological structure to an empirical web, to use simulation to make statement about stability





One of the most powerful tools for problem-solving in mathematics is paying attention to what is _invariant_ about a system, meaning that which does not change in the system, even as we adjust its parameters (Polya citation?). Ecosystems vary in seemingly dimensionless ways. Yet, we can still find an invariant in ecology---the amount of energy per unit area on the planet is a measurable value, and insofar as we have any undisputed "laws" in science, one that is commonly accepted is that energy has to go somewhere.

The application of thermodynamics to trophic communities led to a renaissance(?) in our understanding of trophic community structure. We directly had measureable things we could test against a model's expectation, like allometric scaling (cite), metabolic use (cite), and energy-efficiency in trophic interactions (cite). This enabled us to make more sophistocated predictions about community structure in empirical systems (stouffer paper, trophic theory islandbiogeo), and to further develop generative models of ecological networks that fit empirical food-webs. 

It's true, the word 'bioenergetic' does sound like I'm about to try to sell you a collection of conveniently-priced crystals that will keep the bears away. However, it is fewer syllables than any of its potential synonyms, so I'm hoping we'll just be able to meet in the middle on this one.

through poisot lab, a software package to simulate innes model with diffeq solver

 - real ecosystems are not governed by deterministic forces
 - stochasticity in interactions, for a variety of reasons

## Metacommunities

Out of a synthesis of the fields of spatial and community ecology, we 



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

## Ecosystem Services and Functioning

- ef



# A Metacommunity Model

## What can we measure?

As we've explored, it is essential for a model $f$ to interface with observable quantities $g(A)$ of the conceptual objects $A$ that $f$ is structured around. Move of what drives community dynamics in space and time is unobservable--the evolutionary life histories of organisms lie outside the temporal limits of our observation, as do the ecological conditions of the more-than extremely recent past. Even what we can directly observe--abundance/occupancy, traits, genomes, etc.--are subject to the limitations of exhaustive field work, which can only be done on relatively small spatial scales. 

Especially in the realm of data aggregated across large spatial scales, we have databases composed of occupancy/abundance data, traits, and interactions (mangal paper). but there are often differences in the resolution of this data---e.g. taxonomic/phylogenetic resolution. In terms of abiotic data, we are enabled by advances in remote sensing, which enable us to collect, with variable but ever-improving spatial and temporal resolution, environmental variables like temperature, precipitation, as well as land-usage maps, and more recently, topographical and hydrological models of the Earth's surface. From other fields we also have well-developed predictive models of climatology, hydrology, and land-use, which can serve as inputs into our predictive ecological models. 



Abstracting and modularity of a model. There are four pieces that have to be represented. 

four parts:

1. Community Model: the topology of the metaweb $A$, and the way the biomass flows through the metaweb, $\frac{\partial B}{\partial t}$
2. Spatial Model: we have some set of locations ${x}$  in a spatial domain $S$. Each location $x$ is associated with a value of habitat suitability $H_i(x)$ for each species $i$, and a dispersal potential $\Phi_i(x \to y)$, which is the instantaneous probability that a unit of biomass moves from $x \to y \quad \forall x,y \in S$.
3. Selection Model: how do the traits $T_i(x,t)$ of a species $i$  at a location $x$ at time $t$ change?   $\frac{\partial T_i(x,t)}{\partial t} = w (H_i(x,t), T_i(x,t))$ 
4. Community Summary Model  $C(\vec{B})$


## Community Model

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

![this is a caption](/home/michael/prospectus/tex/figures/different_spatial_models_w_labels.png)



![this is a caption](/home/michael/prospectus/tex/figures/habitat suitability w labels.png)



- spatial graph or a lattice,
- abstraction of multiple environmental variables into a distribution of 'habitat suitability',
- however, this is a function of traits also $H_i= f(T_i(x), E_i(x))$
- $\vec{x} \in X$
- how does $x_i$ affect $x_j$? dispersal potential.




## 3. Selection Model

Model of how that traits $T_i$ and growth rate $r_i$ change as a function of $H_i(x,t)$. One of the most well-studied problems in evolutionary biology.

$$\frac{\partial T_i(x,t)}{\partial t} = f(T_i(x), H_i(x))$$

One simple way



## 4. Measuring (Meta)community Structure

- $\hat{B}$ -- observed community at some time $t$ and some location $x_j$
- types of measures of network structure
  - $f({\hat{B}})$, singular.
    - a measure of $\alpha$-div
    - most classic measures, Shannon entropy, etc.
  - $f(\hat{B}(x_j), \hat{B}(x_k))$, measure of difference between two networks, $\beta$-diversity
  - $G(B)$ , measures of total structure across all locations (and times?),  $\gamma$-diversity


\pagebreak

![this is a caption](/home/michael/prospectus/tex/figures/metacomm_w_distributions.png)





Okay...but how do you classify the 'stability' of a non-equilibrium system---



![this is a caption](/home/michael/prospectus/tex/figures/density_plot.jpg)





![this is a caption](/home/michael/prospectus/tex/figures/different_scenarios.png)

What does the software do?

- software that is modular and can be fit to data in real systems in multiple ways
  - you can provide, $A$, or $S$, different versions of a selection function $S$
- simulation can be used to explore the properties of complex systems on scales larger than can be observed.
- using approx. Bayes comp. to fit the results of complex simulation models to data
- identify fixed points for a given food web topology, and forecast its behavior under hypothetical environment/land use scenarios

Major Questions

- differentiating niche vs neutral processes in metacommunity assembly, across spatial scale
- critical transitions in community structure
  - when we change strength of environmental factors in shifting survivability/traits
  - when we change dispersal (connectivity, etc)Major Questions

What can we use models to infer?

Niche vs. Neutral

environmental conditions and their relation to ranges and interactions

dispersal and neutral colonization/extinction


Poisot 2014 model of interaction networks. Relates to the properties we can measure.

