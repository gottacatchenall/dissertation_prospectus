---
title: Dissertation Prospectus
author: M.D. Catchen
link-citations: true
abstract: |
	i'm just out here grillin' :shades:
---

\textit{La guêpe et l'orchidée font rhizome, en tant que hétérogènes}

\text{Deleuze and Guattari}, \textit{Plateau mille}



\textit{Given the nature of all this new shit, you know, I-I-I-I... this could be a-a-a-a lot more, uh, uh, uh, uh, uh, uh, complex, I mean, it's not just, it might not be just such a simple... uh, you know?} \\ \\ \text{Joel \& Ethan Coen}, \textit{The Big Lebowski } \text{(1997)}

# Introduction

In Edmond Halley's _Synopsis of the Astronomy of Comets_ (1705), Halley used Newton's model of gravitation to estimate the orbit of his now eponymous comet. Halley conjectured that past observations of "different" comets, each appearing roughly 76 years after the previous, were in fact the same object, and that the variability in the comet's period was attributable to the variable gravitational influence of Jupiter and Saturn. Halley's computations enabled him to predict his comet's eventual return to Earth in 1758, and although he didn't live to observe his prediction come true, his work helped provide the initial validation of much of Newtonian mechanics.

The success of Halley's prediction also further fortified the methods of Cartesian reductionism as the principal ideology in scientific understanding. In physics, the problem solving strategy of starting with the simplest case and gradually building toward a higher fidelity representation of the system, is so ubiquitous it is applied without even mentioning that is what's happening. However, in ecology, this approach often does not succeed because the properties of the systems we seek to understand do not exist when we reduce a system down to its individual parts. For example, consider the Lotka-Volterra model. Much like the model of Newtonian gravity Halley applied to his comet, LV is written in the language of ordinary-differential equations^[The reality is computing the gravitational dynamics of more than two bodies of comparable mass is, much like ecological modeling, tough. Halley was able to work around the infamous n-body problem, but modern astrodynamicists use simulation models for many of the same reasons we advocate their use in ecology, coming up in the main text.]. Yet, LV doesn't succeed predicting the true abundance of predator-and-prey species in most systems with much accuracy, 76 years out or otherwise. This is not to say the LV model is not interesting and worthy of study in its own right--it is what Okubo (1972) calls a "toy model"--an intentional oversimplification that can illuminate the dynamics pf real systems (clean sentence up). The characteristic feature of the LV model are its boom-and-bust limit cycles, and this qualitative behavior is observed in many systems. However, for the purposes of inference and forecasting, there is at least enough influence on the abundance of each species from the combined factors of environmental and demographic stochasticity, trait-matching, spatial distributions, and so on, that LV isn't suited for applications in conservation management.



Trophic interactions between pairs of species are the building blocks of ecological communities, and yet the properties of communities cannot be understood simply by generalizing LV to larger systems (May), as there are latent processes structuring communities that are only apparent outside the scope of any particular interaction between two species. This is the essence of what make any system _complex_. 



There is no natural system that is not complex. The motion of matter is subject to the ever-changing pairwise gravitational forces of all matter in existence, and yet Halley was successful in approximating the universe with the set $A = \{\text{Sun}, \text{Jupiter}, \text{Saturn}, \text{Earth}, \text{Comet} \}$.



In ecology (and the biological sciences in general), we are not so lucky. Ecological systems have long evaded effective prediction not just because they are inherently complex (in both a mathematical and lehperson sense of the word), but also because their complexity is irreducible to a set of concepts from which neat and tidy quantitative predictions can be made. 



Ecosystems are emergent phenomena, stochastic and variable at all scales. In biology, we find that our attempts to reduce a systems down to the level of atomic units does not  necessarily succeed because at any level of biological organization there is internal heterogeneity (Levins and Lewontin). In community ecology, it seems that atomic level of organization is naturally the individual of a given species. Yet, adopting the Platonic form "individual" neglects the immense variability in the processes that compose any given individual. Certainly this abstraction would cause consternation from the behavioral ecologists down the hall, to the cell biologists studying gene expression, to the biochemists doing, uh, you know, biochemistry. This is not to say that we should build ecological models starting from the building blocks of particle physics (Levins 1992), but instead we must be cognizant of what our models treat as internally homogeneous--a false premise in biological systems.



> A space capsule could not land on the moon without Newtonian abstractions, nor could it land with them alone. The problem for science is to understand the proper domain of explanation of each abstraction rather than become its prisoner.
>
>
>
> Lewontin and Levins  (1978?)


Simulation models have generally upended the methods of science across all disciplines because they enable us to explore the "proper domain of explanation of each abstraction" with more care, and often less required expertise, than the tools of analytical math. We can directly incorporate stochastic behavior into our models, and the modular nature of software means any conceptual object used in a simulation model can be represented in as much fidelity as the author chooses. One can implement the LV model (without any in-depth knowledge of how to solve differential equations, in fact) in 30 lines of code, or create the most convoluted individual-based model imaginable--it then becomes within the author's purview to define the "proper domain of explanation of each abstraction".



Using simulation models, we contest, we can now explore the complex processes that produce the astounding biodiversity we see on Earth in far more detail, and with greater respect toward their complexity. Further, these tools have potential as we attempt to understand the dramatic influence humans have on  our planet and the life to which it is a unique home. Simulation models have long been used for forecasting and inference in complex systems. One does not struggle to list fields where simulation models are a ubiquitous tool of the trade--climate science, meteorology, epidemiology, etc. Ecology has much to gain in adopting these methods as regular. 



There are certainly challenges in this domain--how do we find a bridge between complex simulation models and data? How do we validate that these simulation models 'work', in that they accurately represent the ecological process they are meant to model?---some potential answers will be discussed further in the next section.



The primary goal of this prospectus is to outline the benefits and future applications of simulation models in biodiversity science, both for the purposes of answering "purely" scientific questions, but also for forecasting and management in real ecological systems. Most studies which incorporate simulation tend to fall into one of two categories: the first being where the simulation model is used as a "virtual laboratory" (@volker_grimm_ibm) to experiment with systems that do not fit into the spatial/temporal scale that can be done in real life, the second being for the application of a simulation model to a real system. In the "virtual laboratory" case, the parameter values often are meant to encapsulate the the entire spectrum of possible values, are based in what the researcher (or reviewers) find interesting. In the second case, parameter inference is vital in producing useful preditions.





Here, we outline how simulation models can be used to make predictions with real data. We then describe a process-based model of metacommunity dynamics (based around @poisot_2014 and @velland_2010, that recent ecology letters paper). We then detail how we'll implement this model as software that is modular and can be used to answer questions in the "virtual laboratory" case, as well as to be fit for real systems. We then conclude by outlining the structure/point of each dissertation chapter.



The product at the end of the dissertation is this software package, and the chapters are structured as an introduction and review, software paper, and then chapters that utilize the software in varying capacities: first as a 'virtual laboratory' to answer niche vs. neutrality question. Then as a interface to local system data--forecasting connectivity in Montreal. Finally as larger-scale inference, when we consider climate model projections 



# Literature Overview

biodiversity has many dimensions, here we focus on community. rhizomatic field of study, no de facto entrance.

get at the fundamental questions again and that;s why you are reviewing these fields.

## Models and Data

I would classify the vast majority of time I spend "working" (under the categories of) building, interpreting, thinking, reading, writing, and talking about models.  So what are these models?

At its core a model must map observable input conditions $x$ to observable output conditions $y$ as a function of both $x$ and model parameters $\theta$ which typically are scalar coefficients used  in the definition of the mapping $y = f(\hat{x}, \theta)$.

If $\hat{y} \approx  y$, we say our model $f$ is "good", and we Google "Nature submission instructions". If not, we say our model is bad and try something else. Model selection has deep and rich history, starting somewhere near "Occam's Razor" and ending far outside the scope of this document. For our purposes, it suffices to understand that there exist several model selection criteria that enable us to determine which of a set of competing explanatory models, $\{f_1, f_2, \dots\}$ provides the highest fidelity explanation of our data. Model validation for complex systems is a



Many of the more popular methods (AIC, BIC, MDL, k-fold crossvalidation) exist as What separates science from philosophy? For most of recorded human history, science and philosophy were not separate disciplines, and most languages didn't have words to distinguish a scientist from a philosopher.

> In fact, the sciences, arts, and philosophies are all equally creators. . . Concepts do not wait for us ready-made, like celestial bodies. There is no heaven for concepts. They must be invented, fabricated, or rather created, and would be nothing without the signature of those who create them. (Deleuze & Guattari 1991)

I would contest science restricts itself to models that allow some interface between the conceptual models we make and that which is observable about the world, such that they can be compared with so-called 'ground truth'---all scientific models must define some set of conceptual objects $A \in \text{Universe}$.



To make a comparison between a model and "ground truth", there must be some way to observe and measure the concepts $A$. More formally, there must be some observation mapping $g: A \to \mathbb{R}^{d_1}$, where $d_1$ is the dimensionality of our measuremennt. And so scientific models inevitably create a mapping between observable states of the concepts as we define them, and quantitative predicted outcomes, $f : g(A) \to \mathbb{R}^{d_2}$. (Generally, $d_2 << d_1$, otherwise we've just found a new way of shuffling around the same information in the data.)





In Halley's model $A = \{\text{Sun}, \text{Jupiter}, \text{Saturn}, \text{Earth}, \text{Comet} \}$, and $g(A) = \{\text{mass}, \text{position}, \text{momentum}\}$.

And so the question for those who are interested in (building, designing, using, etc.) models face the task of defining $f$ in such a way that it (hopefully) makes accurate predictions.

We can broadly split models into two types: process models and statistical models (@mcelreath).

Other types of statistical models (typically those that fall under the ambiguous banner "machine learning") do not define $f$ with much regard towards the actual concepts in $A$ at all, but instead are cleverly designed algorithms which can accurately map input conditions to output conditions in some cases.



Models do many different things: hypothesis testing, inference, parameter estimation, forecasting,etc.



Often, when we do science, models are only a bridge between the data we collect and actual hypotheses. See the figure below from @mcelreath.



![From McElreath 2019--the relationship between hypotheses, process models, and statistical models represented as a network. Original caption: _Relations among hypotheses (left), detailed process models (middle), and statistical models (right), illustrated by the example of “neu- tral” models of evolution. Hypotheses (H) are typically vague, and so cor- respond to more than one process model (P). Statistical evaluations of hy- potheses rarely address process models directly.  Instead, they rely upon statistical models (M), all of which reflect only some aspects of the process models. As a result, relations are multiple in both directions: Hypotheses do not imply unique models, and models do not imply unique hypotheses. This fact greatly complicates statistical inference._](/home/michael/prospectus/figures/mcelreath.png){#fig:mrpoop}



There are no natural isomorphisms from hypotheses to statistical models---conflicting hypotheses can be consistent with a single result of a statistical model if the statistical model produces the same outcomes under processes that correspond to conflicting hypotheses.

Nearly all statistical models function by reducing the dimensionality of our data. This is often done out of sheer necessity, either for degrees-of-freedom or sanity--however an unfortunate byproduct of some summary statistics is that they produce the same results under differing process models. To use the example from Figure 1, models for inferring selection historically rely on summary statistics like $F_{ST}$, often summarized across multiple loci, in order to "test" the observed value of $F_{ST}$ against some expectation, like migration-drift balance, to determine if there is evidence of selection.



Process models use conceptual objects $A$ that (at least with perfect information) could be measured---dispersal, traits, environmental conditions, etc. Summary statistics are usually pure abstractions that may/may not correspond to anything in the real world.



Purely statistical models are certainly not without value--much of our current techno-(u/dys)topia relies on the humble logistic regression. However, for the purposes of inference and forecasting in biodiversity science, and complex systems in general, the increasing availability of computing power to simulate complex process models at large scales have enabled the gap between process models and statistical models to shrink in recent years.



In order to understand why ABC has significant potential in ecology, it is best to start by asking: what is it that makes applying statistical models to data so much easier than process models? The problem begins with the difficulty of estimating the value of parameters in a process model from real data. All models have parameters $\theta$---some latent variables that cannot feasibly be measured, i.e. all parameters are conceptual objects outside of $g(A)$.



As an example, consider fitting a species-distribution model (SDM), $y = f(x, \theta)$, where $x$ is an environmental variable measured across space, and $y$ is the predicted probability of a given species being present. To fit this model y = $f(x, \theta)$, we need some observed instances of both environmental conditions $\hat{x}$ and species occupancy $\hat{y}$ in order to estimate $\theta$. There are seemingly unending methods of estimating $\theta$ using a variety of methods in both frequentist and Bayesian worlds, yet what the vast majority of these methods have in common is that they estimate $\theta$ by using a likelihood function, $\mathbb{L}(\hat{x} | \theta)$, which is defined as the probability of observing some data point $\hat{x}$ given a model definition $f$ and some parameter values $\theta$.

In a frequentist world, the likelihood function is a ubiquitous tool  for parameter inference. Most off-the-shelf statistical 'tests', e.g. `model = lm(y ~ a*x + b)`, are simply a repackaged likelihood function that can be used to  estimate parameters via maximum likelihood or any other frequentist  estimation method.  Similarly, in a Bayesian world, the likelihood  function is essential in the application of Bayes' theorem to inference,

$$ P(\theta | \hat{x}) = \frac{P(\hat{x} | \theta)  P(\theta)}{P(\hat{x})} = \frac{\mathbb{L}(\hat{x}, \theta)  P(\theta)}{\int_\Theta \mathbb{L(\hat{x} | \theta)} P(\theta) d\theta}$$



If our model $f$ is simple, we can write our likelihood down analytically, e.g. if we describe a naive SDM where the probability of occurrence at a location in space $\vec{L}$ is given by the difference between the "mean" trait value of a species, $T$, and the some environmental condition $E(\vec{L})$ related to the trait in question^[Of course, capturing the capacity for a species to persist using a single dimension is, to say the least, unlikely. The oversimplification here is in service of defining the most simple model possible.],  we can define a model $f$ that says the probability of occurrence at $\vec{L}$ is a Gaussian evaluated at $E(\vec{L}) - T$, and induces a single parameter, $\theta = \{ \sigma \}$.

Because our model is defined with an analytically tractable distribution, we can write down our likelihood $\mathbb{L}(x | \theta)$ fairly easily: $$\mathbb{L}(\text{Species present at} \ \vec{L} \ |\  \sigma) = \frac{1}{\sigma \sqrt{2\pi}} \exp \Big( \frac{-(T-E(\vec{L}))^2}{2\sigma^2} \Big)$$

The ability to write our likelihood down in simple analytic terms means that value of $\mathbb{L}$ is straightforward to compute for any values of $T, E(\vec{L}),$ or $\sigma$, and then we are free to apply any number of parameter inference methods to estimate $\sigma$ . Once we estimate $\sigma$, we can estimate the probability of occurrence at any point in space $L$ by simply evaluating $\mathbb{L}(\text{Species present} | E(L) , T, \sigma)$ at that location, at which point we have a fully-fledged SDM.

In a frequentist world, the likelihood function is a ubiquitous tool for parameter inference. Most off-the-shelf statistical 'tests'^[e.g. `model = lm(y ~ a*x + b)`] are simply a repackaged likelihood function that can be used to estimate parameters via maximum likelihood or any other frequentist estimation method.  Similarly, in a Bayesian world, the likelihood function is essential in the application of Bayes' theorem to the inference of parameters $\theta$,



What then, if we want to describe a model $f$ where the probability of occurrence is driven by both neutral changes in the spatial distributions of each species, environmental stochasticity, variability in species' traits in space and time, and so forth? One can imagine constructing a monstrous likelihood function, compiled of distributions stack on top of each other forever. But if one wants to introduce covariance into these distributions, the appropriate tools for  model fititng and validation quickly begins to require statistical expertise that is beyond what is reasonable for any non-practitioner of the field to know, especially for ecologists who are devoted to the management of a particular system and are also asked to have in-depth knowledge of its natural history, etc. Thankfully, we have software like STAN which makes application of more complex models like this to be written and applied quickly, however such models still inevitably rely on assumptions about processes that have been abstracted away from the mechanism producing the data, and instead toward a statistical representation of a process that is subject to the pitfalls presented in Figure 1.

Simulation models are simply easier to understand.

The gap between statistical and process models has long been caused by the intractability of the likelihood function for complex stochastic processes. However, modern computational power enables us to simulate many replicates of stochastic simulation models,  we can treat the distribution of simulation model outcomes as approaching the likelihood function as the number of replicates increases^[There are several caveats here, all outside the scope of this document]. Methods for bridging the gap between empirical data and complex simulation models have go under many names--Bayesian nonparametric methods^[This term can be confusing, as "nonparametric" models in fact have a parameter space of infinite-deminsion @orbanz_bayesian_2015], likelihood-free inference--but in ecology and evolutionary biology, these methods tend to be classified under the term Approximate Bayesian Computation (ABC), which was introduced by Beaumont 2002 [@beaumont] for applications in evolutionary genetics---conveniently, with respect to the evolutionary genetics example from Figure 1.  ABC methods in evolutionary genetics tend to begin with a researcher implementing a simulation model whereby genomes, individuals, and populations are represented at any level of detail imaginable.

One can then use ABC methods to infer model parameters, and to use model selection criteria to determine which mechanistic process is more likely to have produced a dataset.



There is still a reliance on summary statistics, but if summary statistics are not differentiable evenwhen the generative process is different,  that itself is interesting, and, in general, simulation models are excellent testing grounds for the biases of summary statistics (see Jost's D vs Fst etc).



Remaining questions:

- prior selection
- model validation

- _A unified view of generative models for networks: models, methods, opportunities, and challenges_ @jacobs_unified_2014
- _Adaptive approximate Bayesian Computation_ @beaumont_adaptive_2009
- _ABC Review_ @beaumont_approximate_2019
- _Bayesian {Models} of {Graphs}, {Arrays} and {Other} {Exchangeable} {Random} {Structures}}_ @orbanz_bayesian_2015
-  _Handbook of ABC_ @sisson_handbook_2018







## Community Structure

The search for generality among ecological communities long flummoxed early ecologists, culminating in the aphorism that community ecology is "a mess" (citation).



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

## Spatial Ecology

Spatial ecology as it exists today would be radically different if not for @macarthur_and_wilson. The Theory of Island Biogeography (TIBG) is a foundation for both modern spatial and community ecology. TIBG provides a mechanistic explanation for the species-area relationship, one of the most well-established "laws" in ecology.

The theoretical construction of space used by @macarthur_and_wilson---a set of internally homogeneous 'islands', each variable in size and surrounded by inhospitable water/matrix, each either occupied or unoccupied by a particular species---has had deep impacts on many modern methods used to infer ecological patterns across space. Metapopulation theory, coined by @levins_metapop, describes a system of discrete habitat patches, all either occupied/unoccupied. Modern occupancy models are rooted in this view of space: discrete observations at spatial coordinates, with environmental covariates.

internally homogeneous islands, each a variable distance from the mainland with a fixed 'area'^[area here corresponds to resource availability, and has to spatial significance in the model] and distance from the mainland^[a never-ending source of all species in the metaweb]

- every species has the same probability of colonization/extinction
- the species richness at equilibrium as a function of the area replicates the species-area relationship
- its a process model, which is good--however power-laws are ubiquitous patterns that occur as an outcome due to many different mechanistic processes (find the citation for this, i think its a Clauset paper)

However, a tension counter to discrete space runs throughout modern spatial ecology. The availability of remote-sensing technology has enabled the availability of 'continuous' ecological data in the form of rasters. As satellites designed for Earth Science orbit the Earth, they bounce electromagnetic signals off the surface of our planet, and record the spectral signature they receive reflected back at them. The reflective signature of Earth's terrain can then be used to estimate various properties about its surface---land cover, hydrology and topography, abundance of abiotic resources like nitrogen and phosphorus, and so on. The properties used by both different satellites and different models vary widely in what they try to predict---from the level of coarse land-cover categorizations to the presence of particular species. Further, there is considerable variability in the spatial and temporal scale at which data is collected.

From this, we can apply the metapopulation data--occupancy at points, with environmental data at points, to produce rasters that estimate species occupancy based on env data. These species distribution models: max ent, bioclim. what is the strength of env effects?

There is a difference in scale in what this type of data it provides, what time period it covers, and what spatial resolution it has. This "resolution gap" is pervasive in most of the large-scale data sets ecologists try to use: species, etc.

## Metacommunities

Out of a synthesis of the fields of spatial and community ecology, we



- The metacommunity concept as a 'network of networks'-- a spatial network
- leibold [@leibold_metacommunity_2004]
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

- Poisot 2014s

- recent ecology letters papers

## Ecosystem Functioning and Services

How does the structure of an ecological network affect the ecosystem functioning, and how does functioning relate to the ability for an ecosystem to provide services to humans?   

- @hooper_global_2012
- @loreau_biodiversity_2002
- @gonzalez_estimating_2016
- @mouquet_extinction_2011
- @urban_improving_2016
- @balvanera_linking_2014
- @thompson_loss_2017





# A Metacommunity Model



## What can we measure?

As we've explored, it is essential for a model $f$ to interface with observable quantities $O(A)$ of the conceptual objects $A$ that $f$ is structured around. Move of what drives community dynamics in space and time is unobservable--the evolutionary life histories of organisms lie outside the temporal limits of our observation, as do the ecological conditions of the more-than extremely recent past. Even what we can directly observe--abundance/occupancy, traits, genomes, etc.--are subject to the limitations of exhaustive field work, which can only be done on relatively small spatial scales.

Especially in the realm of data aggregated across large spatial scales, we have databases composed of occupancy/abundance data, traits, and interactions (mangal paper). but there are often differences in the resolution of this data---e.g. taxonomic/phylogenetic resolution. In terms of abiotic data, we are enabled by advances in remote sensing, which enable us to collect, with variable but ever-improving spatial and temporal resolution, environmental variables like temperature, precipitation, as well as land-usage maps, and more recently, topographical and hydrological models of the Earth's surface. From other fields we also have well-developed predictive models of climatology, hydrology, and land-use, which can serve as inputs into our predictive ecological models.



Abstracting and modularity of a model. There are four pieces that have to be represented.

Generative models?? Why do we need generative models--



four parts:

1. Community Model: the topology of the metaweb $A$, and the way the biomass flows through the metaweb, $\frac{\partial B}{\partial t}$
2. Spatial Model: we have some set of locations ${x}$  in a spatial domain $S$. Each location $x$ is associated with a value of habitat suitability $H_i(x)$ for each species $i$, and a dispersal potential $\Phi_i(x \to y)$, which is the instantaneous probability that a unit of biomass from species $i$ moves from $x \to y \quad \forall x,y \in S$.
3. Selection Model: how do the traits $T_i(x,t)$ of a species $i$  at a location $x$ at time $t$ change?   $\frac{\partial T_i(x,t)}{\partial t} = w (H_i(x,t), T_i(x,t))$
   1. phylogenetic reading
4. Community Summary Model  $C(\vec{B})$


## 1. Community Model

What is a community? Energy flow on a graph. How do we model energy flow on a graph?

Two components, the topology of the metaweb, $A$, and dynamics, $\frac{\partial B}{\partial t}$


### a. A Generative Model of Food-Web Topology

Takes on parameters, $\theta_T = \{\dots\}$, and produces a metaweb, $A = \begin{bmatrix} A_{ij} \end{bmatrix}$, where $$A_{ij} = \begin{cases}1 \quad\quad& \text{if interaction is possible} \\ 0 & \text{otherwise}\end{cases}$$

- Niche Model, @williams_simple_2000
  - $\theta_T$ :
    - number of species, $N_s$
    - connectance, $C$
  - other parameters can represent structure, etc. allesina


### b. Thermodynamic Consumer-Resource Model (TCRM)

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

![this is a caption](/home/michael/prospectus/figures/different_spatial_models_w_labels.png)





![this is a caption](/home/michael/prospectus/figures/habitat suitability w labels.png)





- spatial graph or a lattice $L$ on a spatial domain $S$

- abstraction of multiple environmental variables into a distribution of 'habitat suitability',

- however, this is a function of traits also $H_i= f(T_i(L), E_i(L))$

- how does $x_i$ affect $x_j$? we represent this as the dispersal potential $\Phi = [\Phi_{ij}]$, where $\Phi_{ij}$ is the probability that a unit biomass moves $i \to j$ before reproducing.

  




## 3. Selection Model

Model of how that traits $T_i$ and growth rate $r_i$ change as a function of $H_i(x,t)$. One of the most well-studied problems in evolutionary biology.

$$\frac{\partial T_i(x,t)}{\partial t} = f(T_i(x), H_i(x))$$







## 4. Measuring (Meta)community Structure

- $\hat{B}$ -- observed community at some time $t$ and some location $x_j$
- types of measures of network structure
  - $f({\hat{B}})$, singular.
    - a measure of $\alpha$-div
    - most classic measures, Shannon entropy, etc.
  - $f(\hat{B}(x_j), \hat{B}(x_k))$, measure of difference between two networks, $\beta$-diversity
  - $G(B)$ , measures of total structure across all locations (and times?),  $\gamma$-diversity


\pagebreak

![this is a caption](/home/michael/prospectus/figures/metacomm_w_distributions.png)





Okay...but how do you classify the 'stability' of a non-equilibrium system---



![this is a caption](/home/michael/prospectus/figures/density_plot.jpg)



ff





![this is the punchline](/home/michael/prospectus/figures/different_scenarios.png)

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



# Dissertation Outline

## Chapter One 

- Introduction and Literature Review

- Looks a lot like this document but with a more in-depth review

## Chapter Two 

- The model software paper

## Chapter Three

- At what spatial scales do processes shift from being neutral to niche? 

## Chapter Four 

-  Applying model to specifics system for forecasting under land use and climate change

## Chapter Five 

- Applying model to inference in large datasets





# Table of Symbols



|                 Name                 |              Symbol               | Mapping (if a function)                                      | Meaning                                                      |
| :----------------------------------: | :-------------------------------: | :----------------------------------------------------------- | ------------------------------------------------------------ |
|            Concept Space             |                $A$                | -                                                            | the set of conceptual objects designed to represent scientific one could define in a scientific model $f$ |
|             State Space              |             $\Omega$              | -                                                            | the set of possible states a given system (respresented using a concept set $A$) could exist in at any given time. $\Omega$ can be thought of as the span of  $O(A)$. |
|         Observation Function         |                $O$                | $O : A \to \Omega$                                           | a function which maps conceptual objects in our models to observations, which typically (but not necessarily) take the form of real numbers |
|           Scientific Model           |                $f$                | $f : O(A) \to \Omega$                                        | the set of conceptual objects designed to represent scientific one could define in a scientific model |
|           Parameter Space            |             $\Theta$              |                                                              | the set of possible values the parameters $\theta$ of a model $f$ could have |
|         Dispersal Potential          |            $\Phi_{ij}$            | $\Phi : (L \times L) \to \mathbb{P}$                         | the probability that an individual born in $i$ dies in $j$   |
|            Spatial Domain            |                $S$                | -                                                            | the space in which spatial locations $L$ are represented as coordinates |
|          Spatial Locations           |                $L$                | -                                                            | the set of locations $L_i \in S$ , each with a coordinate    |
|          Probability Space           |           $\mathbb{P}$            | $P: {F} \to [0,1]$                                           | the combined set of a state space $\Omega$, a $\sigma$-algebra of events within the set the states, ${F} \in \Omega$ , and a probability measure $P$ which maps any ${F} \in \Omega$  to a number between $0$ and $1$ |
|          Trait Distribution          |            $T_i(x,t)$             | $T: L \to \mathbb{P}$                                        | the distribution of traits at population $i$ as a function of time. here $T_i(x,t)$ is a probability density function over $x \in [0,1]$  for any given population $i$. |
|          Bioenergetic Model          | $$\frac{\partial B}{\partial t}$$ | $$\frac{\partial B}{\partial t} : \mathbb{R}^{N_{s}} \to \mathbb{R}^{N_s}$$ | describes the flow of energy stored as biomass on a food web |
|         Likelihood Function          |  $\mathbb{L}(\hat{x} | \theta)$   | $\mathbb{L} : (\Omega \times \Theta) \to \mathbb{P}$         | a mapping from a combination of  state and parameter values to a probability of that combination occurring under some model $f$ |
|        Posterior Distribution        |       $P(\theta | \hat{x})$       | $P(\theta | \hat{x}) : (\Omega \times \Theta) \to \mathbb{P}$ | the probability distribution of a parameter $\theta$ given some data $\hat{x}$ and a prior $P(\theta)$ |
|          Prior Distribution          |            $P(\theta)$            | $P(\theta) : \Theta \to P$                                   | an a priori estimate of the distribution of a parameter $\theta$ |
|              Parameters              |             $\theta$              |                                                              | the parameters of any given model $f$                        |
|               Metaweb                |                $M$                |                                                              | a network of possible interactions between species, typically represented as an adjacency matrix |
|          Metaweb Parameters          |            $\theta_M$             |                                                              | the parameters for a generative model of metaweb topology    |
|    Bioenergetic Model Parameters     |            $\theta_B$             |                                                              | the parameters for a bioenergetic model $\frac{\partial B}{\partial t}$ |
|            Biomass Vector            |             $\vec{B}$             |                                                              | a vector of the biomasses of each species $i \in \mathbb{S}$ |
|      Biomass vector observation      |             $\hat{B}$             |                                                              |                                                              |
| Community Structure Summary Function |           $C(\hat{B})$            | f                                                            |                                                              |
|     Habitat Suitability Function     |           $H_i(L_j,t)$            | $H : ( L \times \mathbb{S} \times \tau) \to [0,1]$           | the habitat suitability of species $i$ and locations $L_j$ at time $t$ |
|            Set of species            |           $\mathbb{S}$            |                                                              |                                                              |
|             Time domain              |              $\tau$               |                                                              |                                                              |
|                                      |                                   |                                                              |                                                              |







\pagebreak

# References 

\pagebreak

