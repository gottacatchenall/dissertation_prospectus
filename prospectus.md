---
title: Dissertation Prospectus
author: M.D. Catchen
link-citations: true
toc: true
abstract: |
	Forecasting the future of Earth's ecosystems during rapid Anthropogenic change is no small task. Robust prediction has long evaded ecological processes due to their inherently complex, stochastic, and emergent nature. However, many disciplines which deal with similarly complex phenomena have benefited from the further use of simulation models as tools for both forecasting and inference. There is much to be gained in ecology from the further adoption of these methods as regular. Here, we outline the potential for simulation models in the realm of understanding metacommunity structure, both for answering fundamental questions about how and why ecological communities are structure the way they are, but also for developing tools for application in the management of real systems in face of climatic and land-use change. At the moment, there do not exist software tools that exist explicitly for the purpose of forecasting community structure with inputs forecast model of land use, climatology, hydrology, etc. Here, we outline how simulation models can be used to make predictions with real data. We then describe a process-based model of metacommunity dynamics (based around @velland_2010, @poisot_2020, @thompson_2020). We then detail how we'll implement this model as software that is modular and can be used to answer questions a variety of questions about metacommunity dynamics, both in the "virtual laboratory" case(@ibm_book), as well in empirical systems. We then conclude by overview of the the structure of the proposed dissertation.
---



\pagebreak

# Introduction

\begin{quote}
\begin{flushright}
\textit{La guêpe et l'orchidée font rhizome, en tant que hétérogènes}\end{flushright}

\begin{flushright}
\text{Deleuze and Guattari}, \textit{Plateau mille} \end{flushright}

\end{quote}



\begin{quote}
\begin{flushright} 
\textit{Given the nature of all this new shit, you know, I-I-I-I... this could be a-a-a-a lot more, uh, uh, uh, uh, uh, uh, complex, I mean, it's not just, it might not be just such a simple... uh, you know?} \end{flushright}

\begin{flushright}
\text{Joel \& Ethan Coen}, \textit{The Big Lebowski } \text{(1997)} \end{flushright}

\end{quote}



When Edmond Halley predicted his now eponymous comet's return to Earth in 76 years in advance, it would have been wise to bet against him. Humans had been been trying to forecast the appearance of comets and meteors for millennia with little success. But Halley was the first to predict a comet's trajectory using the recently developed methods of Newtonian and Keplerian mechanics. Halley conjectured that past observations of "different" comets, each appearing roughly 76 years after the previous, were in fact the same object, and that the variability in the comet's period was attributable to the variable gravitational influence of Jupiter and Saturn. Halley's computations enabled him to successfully predict his comet's eventual return to Earth in 1758, and his prediction provided one of the foundational pieces of evidence for Kepler and Newton's models. Incidentally, Halley's success further fortified methodological reductionism as the principal tool of scientific epistemology. Broadly across the sciences, the problem solving strategy of starting with the simplest case and gradually building toward a higher fidelity representation of the system is ubiquitous (polya cite). Historically, this has been done due to sheer necessity---the limitations of analytical mathematics could not deal with complex high-dimensional representations of a system. 



In ecology, however, this approach often does not succeed in prediction because the properties of the ecological systems are emergent, and do not exist when we reduce a system down to its individual parts. For example, consider the Lotka-Volterra model. Much like the model of Newtonian gravity Halley applied to his comet, LV is written in the language of coupled differential equations^[The reality is computing the gravitational dynamics of more than two bodies of comparable mass is, much like ecological modeling, tough. Halley was able to work around the infamous n-body problem, but modern astrodynamicists use simulation models for many of the same reasons we advocate their use in ecology, coming up in the main text.]. The characteristic feature of the two-species LV model are its boom-and-bust limit cycles, and this qualitative behavior is observed in many systems (@cite). In controlled settings, LV can make fairly good predictions about the abundances of predator and prey, but in complex ecosystems, the $n$-species generalized LV model doesn't succeed predicting the true abundances in most systems with much accuracy, 76 years out or otherwise. This is not to say  LV is not interesting and worthy of study in its own right---it is what Okubo (1972) calls a "toy model" (@cite_okubo)---an intentional oversimplification that can reveal fundamental mechanisms driving the dynamics of real systems. However, for the purposes of forecasting, there is at least enough influence on the abundance of each species from the combined factors of environmental and demographic stochasticity, trait-matching, differences in spatial distributions, and so on, that LV isn't suited for applications in conservation management. Trophic interactions between pairs of species are the building blocks of ecological communities, and yet the properties of communities cannot be understood simply by generalizing LV to larger systems, as there are latent processes, both deterministic and stochastic, structuring communities that are only apparent outside the scope of any particular interaction between two species. This is the essence of what make any system _complex_. 

Of course, in reality every natural system is complex. The motion of matter is subject to the ever-changing pairwise gravitational forces of all other matter in existence, and yet Halley was successful in approximating all of these interactions with the set of conceptual objects $A = \{\text{Sun}, \text{Jupiter}, \text{Saturn}, \text{Earth}, \text{Comet} \}$. Not only that, but Newtonian mechanics allows us to treat all of the matter of each body in $A$ as located at its center of mass, represented as a single point. Halley's model treated each celestial body as if it were internally homogeneous, and even though we know that matter is not evenly distributed in any of our solar system's planets, his approximation of internal homogeneity did not invalidate his model's predictions. 

In ecology (and the biological sciences in general), we are not so lucky. Ecological systems have long evaded effective prediction not just because they are inherently complex (in both a mathematical and lehperson sense of the word), but also because their complexity is irreducible to a set of concepts from which neat and tidy quantitative predictions can be made. There is internal heterogeneity at all scales of biological organization (@levins_lewontin, @levin). In community ecology, it seems that atomic level of organization is naturally the individual of any given species. Yet, adopting the Platonic form "individual" with a property "species" neglects the immense variability  in the biological processes that compose any given individual, and the variability of the individuals that compose a species. Certainly this abstraction would cause consternation from the behavioral ecologists down the hall, to the cell biologists studying gene expression, to the biochemists in the next building, etc. This is not to say that we should build ecological models starting from the building blocks of particle physics as to encapsulate the heterogeneity across the spectrum of levels of biological organization (Levins 1992), but instead we must be cognizant of what our models treat as internally homogeneous---a false premise in biological systems. In _The Dialectical Biologist_, Lewontin and Levins write: 

>  A space capsule could not land on the moon without Newtonian abstractions, nor could it land with them alone. The problem for science is to understand the proper domain of explanation of each abstraction rather than become its prisoner.
>
> Lewontin and Levins  (1978?)



Computer simulation models have upended the methods of science across all disciplines, precisely because they enable us to explore the "proper domain of explanation of each abstraction" with more care, and often less required expertise^[In the sense that computer software  can often be implemented by a person whose is a non-expert in the methods of the software, but is using it for an applied purpose, see much of bioinformatics as an example.], than the tools of analytical math. The modular nature of software means any conceptual object used in a simulation model can be represented in as much fidelity as the author chooses. One can implement the LV model (without any in-depth knowledge of how to solve differential equations, in fact) in 30 lines of code, or create the most convoluted individual-based model imaginable---it then becomes within the author's purview to define the "proper domain of explanation of each abstraction".



Using simulation models, we contest, we can now explore the complex processes that produce the astounding biodiversity we see on Earth in far more detail, and with greater respect toward their complexity. Further, these tools have potential as we attempt to understand the dramatic influence humans have on  our planet and the life to which it is a unique home. Simulation models have long been used for forecasting and inference in complex systems. One does not struggle to list fields where simulation models are a ubiquitous tool of the trade--climate science, meteorology, epidemiology, etc. Ecology has much to gain in adopting these methods as regular. There are certainly challenges in this domain--how do we find a bridge between complex simulation models and data? How do we validate that these simulation models 'work', in that they accurately represent the ecological process they are meant to model?---some potential answers will be discussed further in the next section.

The primary goal of this prospectus is to outline the benefits and future applications of simulation models in biodiversity science, both for the purposes of answering "purely" scientific questions, but also for forecasting and management in real ecological systems. Most studies which incorporate simulation tend to fall into one of two categories: the first being where the simulation model is used as a "virtual laboratory" (@volker_grimm_ibm) to experiment with systems whose spatial/temporal scale are not practical/possible in the real world, the second being for the application of a simulation model to inference in a real system. Here, we outline how simulation models can be used to make predictions with real data. We then describe a process-based model of metacommunity dynamics (based around @poisot_2014 and @velland_2010, that recent ecology letters paper). We then detail how we'll implement this model as software, and how it will be used to answer questions about the processes that structure metacommunities across space and time, as well as forecast how Anthropogenic influence in the form of land-use and climate change will change metacommunity structure in the decades to come. We then conclude by outlining the structure of each dissertation chapter.



\pagebreak

# Literature Overview

Here we overview the literature in the fields surrounding the core questions of the dissertation.  

## Models and Data

Scientists love models. I would classify the vast majority of time I spend "working" (under the categories of) building, interpreting, thinking, reading, writing, and talking about models. And inevitably, models are described as "good" or "bad", "right" or "wrong". So what are these models? At its core a model contains some set of conceptual objects $A$, which interact in some form. In order to test if a model $f$ adequately represents reality, $f$ much make predictions $y$ that may or may not agree with observed reality $\hat{y}$. To make a comparison between a model and reality, there must be some way to observe and measure the concepts in $A$. More formally, there must be some observation mapping $O: A \to \mathbb{R}^{d_1}$, where $d_1$ is the dimensionality of our measurement. And so a scientific model $f$ inevitably create a mapping between observable states of our defined concepts and quantitative predicted outcomes, $f : O(A) \to \mathbb{R}^{d_2}$, where $d_2$ is the dimensionality of $y$. Further, a model typically takes on some parameters $\theta$, which often correspond to some latent variable in $A$. Typically $\theta$ is a set of scalar coefficients used in the definition of the mapping $y = f(\hat{x}, \theta)$.



We then check if $y \approx \hat{y}$, and if so we say our model is good, and we Google "Nature submission instructions". If not, we say our model is bad and try something else. We can formalize this using model selection criteria. Model selection has deep and rich history, starting somewhere near "Occam's Razor" and ending far outside the scope of this document. For our purposes, it suffices to understand that there exist several model selection criteria that enable us to determine which of a set of competing explanatory models, $\{f_1, f_2, \dots\}$ provides the highest fidelity explanation of our data. Many popular methods (AIC, BIC, MDL) follow the heuristic that models should maximize the ratio of the predictive power they provide to the amount of information they contain in their definition. Others (crossvalidation) focus on a model's predictive accuracy when the data is split into training and test sets.  



The upshot is that the task for those who are interested in (building, designing, using, etc.) models is defining $f$ in such a way that it (hopefully) makes accurate predictions. We can broadly split all models into two types: process models and statistical models (@mcelreath). Statistical models themselves can be divided again, into data models and algorithmic models (@breimann). Statistical Data models have long been the foundation of inference in ecology---most methods of regression and GLMs fall under this category. Algorithmic models (which typically fall under the ambiguous banner "machine learning") do not define $f$ with much regard towards the actual concepts in $A$ at all, but instead are cleverly designed algorithms which can accurately map input conditions to output conditions in some cases. In contrast, process models are based around the mechanisms that produce the data (@mcelreath). Process models can be conceptual, e.g. "niche partitioning promotes coexistence", or quantitative, e.g. simulation models. 



Models do many different things: hypothesis testing, inference, parameter estimation, forecasting,etc. Often, when we do science, models are only a bridge between the data we collect and actual hypotheses. See the figure below from @mcelreath. Nearly all statistical models function by reducing the dimensionality of our data. This is often done out of sheer necessity, either for degrees-of-freedom or sanity--however an unfortunate byproduct of some summary statistics is that they produce the same results under differing process models. To use the example from Figure 1, models for inferring selection historically rely on summary statistics like $F_{ST}$, often summarized across multiple loci, in order to "test" the observed value of $F_{ST}$ against some expectation, like migration-drift balance, to determine if there is evidence of selection.



![From McElreath 2019--the relationship between hypotheses, process models, and statistical models represented as a network. Original caption: _Relations among hypotheses (/home/michael/prospectus/figures/mcelreath.png), detailed process models (middle), and statistical models (right), illustrated by the example of “neu- tral” models of evolution. Hypotheses (H) are typically vague, and so cor- respond to more than one process model (P). Statistical evaluations of hy- potheses rarely address process models directly.  Instead, they rely upon statistical models (M), all of which reflect only some aspects of the process models. As a result, relations are multiple in both directions: Hypotheses do not imply unique models, and models do not imply unique hypotheses. This fact greatly complicates statistical inference._](/home/michael/prospectus/figures/mcelreath.png)





Purely statistical models are certainly not without value. However, for the purposes of inference and forecasting in biodiversity science, and complex systems in general, the increasing availability of computing power to simulate complex process models at large scales have enabled the gap between process models and statistical models to shrink in recent years. Methods for fitting empirical data to complex simulation models has seen much interest in the literature of a wide-variety of fields in recent years. In the network science and complex systems literature, methods of this type are typically called "Bayesian nonparametrics" (@orbanz), or sometimes "likelihood-free inference". In ecology and evolutionary biology, these methods are often called Approximate Bayesian Compution (ABC), based on the early adoption of that nomenclature by Beaumont (@beaumont), who used first applied ABC methods in evolutionary genetics.



In order to understand why ABC has significant potential in ecology, it is best to start by asking: what is it that makes applying statistical models to data so much easier than process models? The problem begins with the difficulty of estimating the value of parameters in a process model from real data. All models $f$ have parameters $\theta$ which lie outside of what is observable about the model's concepts $A$. As an example, consider fitting a species-distribution model (SDM), $y = f(x, \theta)$, where $x$ is the value of an environmental variable that has been measured across space, and $y$ is the predicted probability of a given species being present. To fit this model $y =f(x, \theta)$, we need some observed instances of both environmental conditions $\hat{x}$ and species occupancy $\hat{y}$ in order to estimate $\theta$---an "inverse problem" whereby we want to solve the model backwards, so to speak, in order to estimate the inputs $\theta$ that produced $\hat{y}$ given $\hat{x}$ (@stouffer). 

For most statistical data models, there are seemingly endless methods of estimating $\theta$  in both frequentist and Bayesian worlds, yet what the vast majority of these methods have in common is that they estimate $\theta$ by using a likelihood function, $\mathbb{L}({x} | \theta)$, which is defined as the probability of observing some data point $\hat{x}$ given a model definition $f$ and some parameter values $\theta$. In a frequentist world, the likelihood function is a ubiquitous tool for parameter inference. Most off-the-shelf statistical 'tests', e.g. ANOVA, are simply a packaged likelihood function that can be used to quickly estimate parameters for a wide variety of problems with conceptual similarities. Similarly, in a Bayesian world, the likelihood  function is essential in the application of Bayes' theorem to inference, 

$$ P(\theta | \hat{x}) = \frac{P(\hat{x} | \theta)  P(\theta)}{P(\hat{x})} = \frac{\mathbb{L}(\hat{x}, \theta)  P(\theta)}{\int_\Theta \mathbb{L}(\hat{x} | \theta) P(\theta) d\theta}$$



If our model $f$ is simple, we can write our likelihood down analytically, e.g. if we describe a naive SDM where the probability of occurrence at a location in space $L$ is given by the difference between the "mean" trait value of a species, $T$, and some environmental condition $E({L})$ related to the trait in question^[Of course, capturing the capacity for a species to persist using a single dimension is, to say the least, unlikely. The oversimplification here is in service of defining the most simple model possible.],  we can define a model $f$ that says the probability of occurrence at ${L}$ is a Gaussian evaluated at $E({L}) - T$, which induces a single parameter, $\theta = \{ \sigma \}$. Because our model is defined with an analytically tractable distribution, we can write down our likelihood $\mathbb{L}(x | \theta)$ fairly easily: $$\mathbb{L}(\text{Species present at} \ {L} \ |\  \sigma) = \frac{1}{\sigma \sqrt{2\pi}} \exp \Big( \frac{-(T-E({L}))^2}{2\sigma^2} \Big)$$

The ability to write our likelihood down in simple analytic terms means that value of $\mathbb{L}$ is straightforward to compute for any values of $T, E(\vec{L}),$ or $\sigma$, which is necessary for the majority of parameter inference methods. Once we estimate $\sigma$, we can estimate the probability of occurrence at any point in space $L$ by simply evaluating $\mathbb{L}(\text{Species present} | E(L) , T, \sigma)$ at that location, at which point we have a fully-fledged SDM.

What then, if we want to describe a model $f$ where the probability of occurrence is driven by both neutral changes in the spatial distributions of each species, environmental stochasticity, variability in species' traits in space and time, and so forth? A likelihood function for this type of process quickly becomes intractable. However, modern computational power enables us to simulate many replicates of stochastic simulation models, we can treat the distribution of simulation model outcomes as approaching the likelihood function as the number of replicates increases^[There are several caveats here, all outside the scope of this document]. One can then use ABC methods (most of which rely on typical MCMC rejection-sampling) to infer model parameters, and to use model selection criteria to determine which mechanistic process, written as a simulation, is more likely to have produced a set of data. 

The contemporary literature surrounding ABC focuses on model validation, prior selection  (@jacobs_unified_2014), methods for sampling parameters better (@beaumont_adaptive_2009), estimating the likelihood via regression on simulation data to minimize  replicates (@beaumont_approximate_2019)

- _Bayesian {Models} of {Graphs}, {Arrays} and {Other} {Exchangeable} {Random} {Structures}}_ @orbanz_bayesian_2015
- _Handbook of ABC_ @sisson_handbook_2018



## The Structure of Ecological Networks

The search for generality among ecological communities long flummoxed early ecologists, culminating in the aphorism that community ecology is "a mess" (@citation_original, @citation_velland).

Early theoretical work on community structure begins with the Diversity-Stability "Paradox", largely attributed to  May's _Will a Large Complex System be Stable_ (@cite) and _Stability and Complex is Model Ecosystems_ (@cite). May found, contrary to the conventional wisdom at the time, that increasing the diversity of species in an ecological community decreases its stability. May's work considered both a linear system, $\dot{x} = M\vec{x}$, and a generalized Lotka-Volterra system, $\dot{x} = \vec{x} \odot (M \vec{x} + \vec{g})$, where $\vec{x}$ is a vector of abundances, $\vec{g}$ is a vector of change in abundance absent any consumption and $M_{ij}$ between any species $i$ and $j$ is the interaction strength^[itself a term fraught with ambiguity]. May's generative model of a food web $M$ with $N_s$ species is

 $$M = \begin{cases}\sim N(0, \sigma^2) \quad\quad\quad &\text{w.p. }\ c\\ 0 &\text{else}\end{cases}$$ 

It is important to emphasize that "stable" in this context means fixed-point stability in a deterministic system. One can compute the stability of a fixed-point by examining the eigenvalues of the Jacobian of your system around any fixed point. For both of the models may used, the Jacobian around a fixed point is always the adjacency matrix, and so without computing any derivatives we can simply check if the eigenvalues $\lambda$ of the adjacency matrix $M$ all have real component less than $0$, i.e. $\{ \text{Re}(\lambda) < 0 \}  \ \ \forall\lambda$, to determine if the system has a stable equilibrium. By generating and evaluating the stability of food-webs this way, May showed as $N_s$ increases, the probability that a food web will be stable goes to $0$. There is where the so-called 'paradox' lies---we observe food-webs in nature that are woven between far more species than we would expect under May's model, and so naturally the study of complexity in food webs turned to both understanding the processes that structure food webs such that they can persist.



One of the most powerful tools for problem-solving is paying attention to what is _invariant_ about a system, meaning that which does not change in the system, even as we adjust its parameters (@polya). Ecosystems vary in seemingly dimensionless ways. Yet, we can still find an invariant in ecology---the amount of energy per unit area on the planet is a measurable value, and insofar as we have any undisputed "laws" in science, one that is fairly commonly accepted is that energy has to go somewhere. The application of thermodynamics to trophic communities led to a renaissance in our understanding of food web structure. We directly had measurable things we could test against a model's expectation, like allometric scaling (@cohen_and_newman, @gravel_trophic_tibg, @stouffer_intervality) and metabolic energy-efficiency in trophic interactions (@yodzis_innes). This enabled us to develop more sophisticated models of both community structure, in the form of generative network models \[@cohen_and_newman, @williams_martinez\] that can be fit to empirical food webs \[@allesina\]. In parallel, network science has developed its own set of generative models for network structure which have several natural applications in food web ecology. Stochastic-Block-Models (SBMs) have seen extensive use for modular and nested network structures outside of ecology. There is a trade-off between good fit and mechanisms in an SBM--it doesn't tell you anything about the process making the data, it just learns how the network its structured in such a way that it can generate structurally similar networks.  Further, this also led to the development of  community dynamics models that are better rooted in thermodynamic constraints than LV \[@yodizs_innes, more recents also\], where each species $i$ exhibits a "functional response" on species $j$, which is proportional to how much biomass moves $i \to j$  at any instant. A set of generative network models, and a deterministic thermodynamic community model exist as the software library as `BioEnergetic.jl` (cite). 

## Spatial Ecology

Spatial ecology as it exists today would be radically different if not for the Theory of Island Biogeography (TIBG) \[@macarthur_and_wilson\]. TIBG is a foundation for both modern spatial and community ecology, and further provides a mechanistic explanation for the species-area relationship, one of the most well-established "laws" in ecology. The conceptual construction of space used by TIBG---a set of internally homogeneous 'islands', each variable in size and surrounded by inhospitable water/matrix, each either occupied or unoccupied by a particular species and connected via dispersal---had deep impacts on the methodology and models used to study ecological patterns across space. Around the same time, metapopulation theory, coined by Levins \[@levins_metapop\], more explicitly explored occupancy dynamics. Much like TIBG, Levins considered as system of isolated patches, each either occupied or unoccupied in time. The proportion of patches $p$ occupied at any time was modeled as

$$\frac{dp}{dt} = pc(1-p) - cp$$

where $c$ is the instantaneous probability of colonization and $e$ is the instantaneous probability of extinction of any given patch. From this Levins derived that the system will only persist if $\frac{c}{e} > 1$.  Levins' Metapopulation model and TIBG share much in common, all patches are homogeneous in that they all are colonized or go extinct with the same probability as every other patch, and it is assumed that each system progresses toward an equilibrium state over time. The assumption of uniform colonization and extinction rates across all patches was eventually challenged by Hanski and Ovaskainen, who developed a spatially-explicit model of metapopulation dynamics (@hanski_1994) , where a finite number of populations each has an explicit location in space, an area (which is a proxy for resource availability, much like TIBG), and a unique probability of colonization of extinction based both on the physical proximity to other patches and the occupancy state of the rest of the system. Further, the increased availability of computer power in the 1990s enabled the first simulation models to be applied in spatial ecology. Many studies focused on the effects of habitat structure and loss by simulating occupancy dynamics on a lattice and measuring the probability of metapopulation persistence (@bascompte, etc) . 

Although TIBG and both Levins' and Hanski's metapopulation models rely on discrete-space constructions of space, a tension counter to discrete space runs throughout modern spatial ecology. The increasing availability of remote-sensing data has enabled the first 'continuous' ecological data. As satellites designed for Earth Science orbit the Earth, they bounce electromagnetic signals off the surface of our planet, and record the spectral signature they receive reflected back at them. The reflective signature of Earth's terrain can then be used to estimate various properties about its surface---land cover, hydrology and topography, abundance of abiotic resources like nitrogen and phosphorus, and so on. The properties used by both different satellites and different models vary widely in what they try to predict---from the level of coarse land-cover categorizations to the presence of particular species. Further, there is considerable variability in the spatial and temporal scale at which data is collected--however, it is still hard to overstate the potential value of large-scale raster data in ecological forecasting, as we now have methods to build complex models of habitat suitability and dispersal using resistance surfaces (@cite), which have the potential to integrate nicely with climate and land-use forecasting models derived from other fields (cite).

## Metacommunities

Leibold et al. \[@leibold_metacommunity_2004\] introduced the metacommunity framework a synthesis of community and spatial ecology. They define four paradigms under which previous research on the interplay of community and spatial ecology can be categorized: 1) the Species-Sorting perspective, 2) the Patch-Dynamics perspective, 3) the Mass-Effect Perspective, and 4) the Neutral perspective.

Although understanding the effects of spatial processes on community structure has been a crucial part of the discipline since its rapid growth in the 1950s and 1960s (@macarthur, @hutchinson), this work only considered space solely as a domain across the environment varies--- each species was considered a static object in space in time, which are distributed according to selection on environmental variables. This forms the theoretical basis for niche theory as a mechanism behind community assembly, or what Leibold et al. call the Species-Sorting perspective of metacommunity dynamics. The Patch-Dynamics perspective is rooted in the TIBG from above--occupancy dynamics  on discrete, internally homogeneous patches/islands, where diversity is limited by dispersal and not resource availability. The Mass-Effect perspective shifts to systems where dispersal drives patterns of local demography, rather than occupancy dynamics---sources and sinks (pulham, etc.). Finally, the Neutral perspective considers community dynamics driven by random drift, i.e. dynamics at scales where there is not enough variability in either selection or dispersal to drive variation of community structure across space, beyond than the variability attributable to the inherent stochasticity of population dynamics.  

The methods used in each of the domains of these paradigms often differed drastically---however Velland 2010 (@velland) argues that within each of these four perspectives we see the same four fundamental processes driving dynamics, just in different amounts. Velland's four processes are selection, dispersal, drift, and speciation--functionally the same as the four fundamental processes in evolutionary genetics, which similarly deals with shifting compositions of units of over space and time, the difference being that evolutionary genetics deals with alleles, not species. These fundamental processes have been used in recent years to develop _process-based_ models of metacommunity dynamics, which can be compared to actual data (@poisot_2014, @thompson).



One question remains---at what different levels of each of the four processes do communities move between Leibold et al.'s four prespectives?


\pagebreak

# A Metacommunity Model

Here we describe a process-based simulation model of metacommunity dynamics across space, which will be implemented as a software toolkit which will be used for each research chapter in the dissertation. 

## What can we measure?

In the last section we explored how it is essential for a model $f$ to interface with observable quantities $O(A)$ of the conceptual objects $A$ that $f$ is built with. Much of what drives community dynamics in space and time is not directly observable to us--the evolutionary life histories of organisms lie outside the temporal limits of our observation, as do the ecological conditions of the more-than extremely recent past, only what we can infer. What we can directly observe--abundance/occupancy at a given time, traits or genomes sampled from individuals, etc.--are subject to the limitations of exhaustive field work, which can only be done on relatively small spatial scales. We have databases composed of occupancy/abundance data, traits, inferred phylogenetic history, and interactions (mangal paper, ncbi, etc), but there is often much variability in the resolution of this data. For abiotic variables, we can collect, with variable but ever-improving spatial and temporal resolution, environmental variables like temperature, precipitation, as well as land-usage maps, and more recently, topographical and hydrological models of the Earth's surface. From other fields we also have well-developed predictive models of climatology, hydrology, and land-use, which can serve as inputs into our predictive ecological models.

## The Four Parts of a Metacommunity Model

Here, we divide our metacommunity model into four parts:

1. **Metaweb Model**: $\{M, B, \frac{\partial B}{\partial t}\}$

   The Metaweb model consists of the topology of the metaweb $M$, and the way the biomass $B$ flows through the metaweb, $\frac{\partial B}{\partial t}$. The metaweb $M$ can be derived empirically, or built from a generative model (@williams_martinez, @allesina). $\frac{\partial B}{\partial t}$ can be a deterministic model (like used in @delmas, thompson, dakos stability), or include stochasticity and trait-matching as part of the functional response. 

2. **Spatial Model**: $\{L, S, H, E, \Phi \}$

   We have some set of locations $L$ in a spatial domain $S$. This representation of landscape structure maps onto the most common spatial representations in ecology: patch-based, spatial graph, and raster/lattice---see Figure 2.  Each location $L$ is associated with a values of environmental variables $E(L)$ and of habitat suitability $H_i(L)$ for each species $i$, which is empirically derivable from various existing models at either large scales (SDMs) or small scales (resistance surfaces/land use) or can be generated using any number of methods for generating spatially auto-correlated data---see Figure 3. Finally, the spatial model includes a dispersal potential $[\Phi^{(i)}_{xy}]$, which is the instantaneous probability that a unit of biomass from species $i$ moves from $x \to y \quad \forall x,y \in S$. The value of $\Phi^{(i)}_{xy}$ is derivable from a resistance surface produced via Curcuitscape \[@cite\], or can be modeled as a function of isolation-by-distance using a dispersal kernel (@hanski, who knows all of them). 

   ![this is a caption](/home/michael/prospectus/figures/different_spatial_models_w_labels.png)

   

   ![this is a caption](/home/michael/prospectus/figures/habitat suitability w labels.png)

3. **Selection Model**: $\{ E, T, \frac{\partial T}{\partial t}\}$

   The selection model describes the traits $T_i(L)$ of each species $i$ at a location $L$, and some function $\frac{\partial T}{\partial t}$ which describes how $T_i(L)$ changes over time as a function of both $E(L)$ and $T_i(L)$, which has several candidates from early evolutionary biology (@cite). Further, the selection model could include some measure of speciation based on differences in $T_i$, however it doesn't directly relate to the questions in the proposed chapters.

   

4. **Community Summary Model**:  $\{ C(\hat{B}) \}$

   Finally, the Community Summary model is a summary statistic which maps from the observed state of biomass abundance (or occupancy) $\hat{B}$ at some place and time to a value that represents community structure, e.g. Shannon-entropy as a measure of $\alpha$-diversity. $C$ could also be a measure of $\beta$ or $\gamma$-diversity. If we are using a measure of $\alpha$-diversity, we may include an additional summary statistic to encapsulate the distribution of $C$ across all locations $L$. See Figure 4. One goal with the metacommunity model is to compare various metacommunity summary statistics to explore how they covary. Further, if summary statistics are not differentiable even when the generative process is different,  that itself is interesting, and, in general, simulation models are excellent testing grounds for the biases of summary stats.

![this is a caption](/home/michael/prospectus/figures/metacomm_w_distributions.png)

## Software Implementation 

Here, we describe how we will implement this metacommunity model as a modular toolbox of software to simulate metacommunity dynamics that interfaces with actual data and can be applied forecast in real systems. 



In Figure 5 we can see how the conceptual objects in our metacommunity model $A = \{B, L, M, T, \Phi, H, C, \frac{\partial B}{\partial t}, \frac{\partial T}{\partial t} \}$ can interface with both generative models for the sake of using the software as a "virtual laboratory" \[@volker_grimm\] and empirical data to forecast in real systems. The point is not necessarily to vary all elements at once, but instead to have a modular set of tools that cover a wide variety of use-cases. 

![this is a caption](/home/michael/prospectus/figures/inputs.png)





### Finding the pseudoequilibria of our metacommunity model





![this is a caption](/home/michael/prospectus/figures/density_plot.png)





### Fitting to data with ABC 

![Conceptual overview of Approximate Bayesian Computation (ABC). The version of an ABC Sampler presented here is methodologically the simplest (and original) version, based on using a simulated likelihood to run a rejection-based sampling MCMC algorithm. In panel 2 (top-right), to actually compute $\mathbb{L}(\hat{y} | \theta)$ from simulation outputs, traditionally one defineds an acceptance tolerance $\rho$, and accepts $\hat{y} - y_{sim} < \rho$ . Alternatively, one can run some regression on the on the simulation outcomes to get an analytic approximation of $\mathbb{L}(\hat{y} | \theta)$.  More recent improvements to ABC sampling deviate from simple rejection sampling algorithms for efficiency, e.g. doing rejection sampling whilst composing the simulated likelihood to reduce the amount of time spent running the simulation model in "bad" regions of parameter space---see Adaptive Monte Carlo [@beaumont_adaptive_2009] and Sequential Monte Carlo [@cite].](/home/michael/prospectus/figures/abc_conceputal.png)







\pagebreak

# References





There is still a reliance on summary statistics, but if summary statistics are not differentiable even when the generative process is different,  that itself is interesting, and, in general, simulation models are excellent testing grounds for the biases of summary statistics (see Jost's D vs Fst etc).





In the "virtual laboratory" case, the parameter values often are meant to encapsulate the the entire spectrum of possible values, are based in what the researcher (or reviewers) find interesting. In the second case, parameter inference is vital in producing useful predictions.
