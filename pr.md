> *La guêpe et l'orchidée font rhizome, en tant que hétérogènes*
>
> , *Plateau mille*

> *Given the nature of all this new shit, you know, I-I-I-I\... this
> could be a-a-a-a lot more, uh, uh, uh, uh, uh, uh, complex, I mean,
> it's not just, it might not be just such a simple\... uh, you know?*
>
> , *The Big Lebowski*

Introduction
============

When Edmond Halley predicted his now eponymous comet's return to Earth
in 76 years in advance, it would have made sense to bet against
him---after all, humans had been been trying to forecast the appearance
of comets and meteors for millennia, with little success. But Halley was
the first to predict a comet's trajectory using the recently developed
methods of Newtonian and Keplerian mechanics. Halley conjectured that
past observations of \"different\" comets, each appearing roughly 76
years after the previous, were in fact the same object, and that the
variability in the comet's period was attributable to the variable
gravitational influence of Jupiter and Saturn. His computations enabled
him to successfully predict his comet's eventual return to Earth in
1758, and his prediction provided one of the foundational pieces of
evidence for Kepler and Newton's models. Halley's success also further
embedded methodological reductionism as the principal method of
scientific discovery. Since Halley's time, the problem solving strategy
of starting with the simplest case and gradually building toward a
higher fidelity representation of the system has become increasingly
ubiquitous across the sciences [@polya_how_2009]. There have been good
reasons for this---the limitations of analytical mathematics could not
deal with high-dimensional representations of a system, and therefore
reducing it down to as few measurable values as possible was necessary
to allow a conceptual representation of a system to interface with the
quantitative tools of the time. Of course, in reality every natural
system is complex. The motion of matter is subject to the ever-changing
pairwise gravitational forces of all other matter in existence, and yet
Halley was successful in predicting the gravitational dynamics of his
comet by considering only a few celestial bodies. Not only that, but
Newtonian mechanics describes that state of each object $\in A$ with
only two values, position and momentum. Surely if one were to measure
the distribution of matter within the Sun, describing it as a single
point at its center would seem overzealous. Yet, this abstraction did
not invalidate Halley's model because the effects of internal
heterogeneity are practically immeasurable on the scale of entire
system.

In ecology (and the biological science in general) this approach often
does not succeed in because the properties of the systems we study are
emergent, and do not exist when we reduce a system down to its simplest
form. For example, consider the Lotka-Volterra model. Much like the
model of Newtonian gravity Halley applied to his comet, LV is written in
the language of coupled differential equations [^1]. The characteristic
feature of the two-species LV model are its boom-and-bust limit cycles,
and this qualitative behavior is observed in many systems. In controlled
settings, LV can make fairly good predictions about the abundances of
predator and prey [@varon_bacterial_1978; @fussmann_crossing_2000], but
in complex ecosystems, the $n$-species generalized LV model doesn't
succeed predicting the true abundances in most systems with much
accuracy [@momeni_lotka-volterra_2017], 76 years out or otherwise. This
is not to say LV is not interesting and worthy of study in its own
right---it is what Okubo (1972) calls a \"toy model\"
[@okubo_diffusion_2001]---an intentional oversimplification that can
reveal fundamental mechanisms driving the dynamics of real systems.
However, for the purposes of forecasting, there is at least enough
influence on the abundance of each species from the combined factors of
environmental and demographic stochasticity, trait-matching, differences
in spatial distributions, and so on, that LV isn't suited for
applications in conservation management. Trophic interactions between
pairs of species are the building blocks of ecological communities, and
yet the properties of communities cannot be understood simply by
generalizing LV to larger systems, as there are latent processes, both
deterministic and stochastic, structuring communities that are only
apparent outside the scope of any particular interaction between two
species. This is the essence of what make any system *complex*.

Ecological systems have long evaded effective prediction because there
is internal heterogeneity at all scales of biological organization
[@levins_dialectical_1987; @levin_problem_1992], and the effects of this
heterogeneity propagate across across scales. In community ecology, it
seems that atomic level of organization is naturally the individual of
any given species. Yet, adopting the Platonic form "individual\" with a
property \"species\" neglects the immense variability in the biological
processes that compose any given individual, and the variability of the
individuals that compose a species. Certainly this abstraction would
cause consternation from the behavioral ecologists down the hall, to the
cell biologists studying gene expression, to the biochemists in the next
building, etc. This is not to say that we should build ecological models
starting from the building blocks of particle physics in order to
encapsulate the heterogeneity across the spectrum of levels of
biological organization [@levin_problem_1992], but instead we must be
cognizant of what our models treat as internally homogeneous---a false
premise in biological systems. In *The Dialectical Biologist*, Lewontin
and Levins write:

> A space capsule could not land on the moon without Newtonian
> abstractions, nor could it land with them alone. The problem for
> science is to understand the proper domain of explanation of each
> abstraction rather than become its prisoner. [@levin_problem_1992]

Widely across fields, computer simulation models have upended the
methods of science, precisely because they enable us to explore the
\"proper domain of explanation of each abstraction\" with more care, and
often less required expertise[^2] than the tools of analytical math. The
modular nature of software means any conceptual object used in a
simulation model can be represented in as much fidelity as the author
chooses. One can implement the LV model (without any in-depth knowledge
of how to solve differential equations, in fact) in 30 lines of code, or
create the most convoluted individual-based model imaginable---it then
becomes within the author's purview to define the "proper domain of
explanation of each abstraction.\"

Using simulation models, we contest, we can now explore the complex
processes that produce the astounding biodiversity we see on Earth in
far more detail, and with greater respect toward their complexity than
canned statistical models. Further, these tools have vast potential as
we attempt to predict the consequences of the dramatic influence humans
have on our planet and the life to which it is a unique home. Simulation
models have now long been used for forecasting and inference in complex
systems. One does not struggle to list fields where simulation models
are a ubiquitous tool of the trade--climate science, meteorology,
epidemiology, etc. Biodiversity science has much to gain in adopting
these methods as regular. There are certainly challenges in this
domain--how do we find a bridge between complex simulation models and
data? How do we validate that these simulation models 'work', in that
they make accurate predictions about the ecological process they are
meant to model?---some potential answers will be discussed further in
the next section.

The primary goal of this prospectus is to outline the benefits and
future applications of simulation models in metacommunity ecology, both
for the purposes of answering \"purely\" scientific questions, but also
for forecasting and management in real systems. Most studies which
incorporate simulation tend to fall into one of two categories: the
first being where the simulation model is used as a "virtual
laboratory\" [@railsback_agent-based_2011] to experiment with systems
whose spatial/temporal scale are not practical/possible in the real
world, the second being for the application of a simulation model to
inference in a real system. Here, we outline how simulation models can
be used to make predictions with real data. We then describe a
process-based model of metacommunity dynamics (based around ,
[@vellend_conceptual_2010; @poisot_beyond_2015; @thompson_process-based_2020].
We then detail how we'll implement this model as software, and how it
will be used to answer questions about the processes that structure
metacommunities across space and time, as well as forecast how
Anthropogenic influence in the form of land-use and climate change will
change metacommunity structure in the decades to come. We then conclude
by outlining the structure of the dissertation.

Literature Overview
===================

Here we overview the literature in the fields surrounding the core
questions of the dissertation. One of the points of this is to acquaint
the reader with what I've read to see where the gaps are.

::: {#models-and-data}
Models and Data
---------------
:::

Scientists love models. I would classify the vast majority of time I
spend "working" (under the categories of) building, interpreting,
thinking, reading, writing, and talking about models. And inevitably,
models are described as \"good\" or \"bad\", \"right\" or \"wrong\". So
what are these models? At its core a model contains some set of
conceptual objects $A$, which interact in some form. In order to test if
a model $f$ adequately represents the world, $f$ must make predictions
$y$ that may or may not agree with observed reality $\hat{y}$. To make a
comparison between a model and reality, there must be some way to
observe and measure the concepts in $A$. More formally, there must be
some observation mapping $O: A \to \mathbb{R}^{d_1}$, where $d_1$ is the
dimensionality of our measurement. And so a scientific model $f$
inevitably create a mapping between observable states of our defined
concepts and quantitative predicted outcomes,
$f : O(A) \to \mathbb{R}^{d_2}$, where $d_2$ is the dimensionality of
$y$. Further, a model typically takes on some parameters $\theta$, which
often correspond to some latent variable in $A$. Typically $\theta$ is a
set of scalar coefficients used in the definition of the model's mapping
$y = f(\hat{x}, \theta)$.

We then check if $y \approx \hat{y}$, and if so we say our model is
good. If not, we say our model is bad and try something else. We can
formalize this using model selection criteria. Model selection has deep
and rich history, starting somewhere near Occam's Razor and ending far
outside the scope of this document. For our purposes, it suffices to
mention that there exist several model selection criteria that enable us
to determine which of a set of competing explanatory models,
$\{f_1, f_2, \dots\}$ provides the highest fidelity explanation of our
data. Many popular methods (AIC, BIC, MDL) follow the heuristic that
models should maximize the ratio of the predictive power they provide to
the amount of information they contain in their definition. Others
(crossvalidation) focus on a model's predictive accuracy when the data
is split into training and test sets.

The upshot is that the task for those who are interested in (building,
designing, using, etc.) models is defining $f$ in such a way that it
(hopefully) makes accurate predictions. We can broadly split all models
into two types: process models and statistical models
[@mcelreath_statistical_2020]. Statistical models themselves can be
further subdivided into data models and algorithmic models
[@breiman_statistical_2001]. Statistical Data models have long been the
foundation of inference in ecology---most methods of regression,
including GLMs, fall under this category. Algorithmic models (which
typically fall under the ambiguous banner "machine learning") do not
define $f$ with much regard towards the actual concepts in $A$ at all,
but instead are cleverly designed algorithms which can accurately map
input conditions to output conditions in some cases. In contrast,
process models are based around the conceptual representations of the
mechanisms that produce the data [@mcelreath_statistical_2020]). Process
models can be purely conceptual, e.g. "niche partitioning promotes
coexistence", or quantitative, e.g. Newtonian gravity, LV, simulation
models. No type is inherently more correct---different models are suited
for different things: hypothesis testing, inference, parameter
estimation, forecasting, etc.

Often, when we do science, models are only a bridge between the data we
collect and actual hypotheses.

See the figure below from [@mcelreath_statistical_2020]. Nearly all
statistical models function by reducing the dimensionality of our data.
This is often done out of sheer necessity, either for degrees-of-freedom
or sanity--however an unfortunate byproduct of some summary statistics
is that they produce the same results under differing process models. To
use the example from Figure 1, models for inferring selection
historically rely on summary statistics like $F_{ST}$, often summarized
across multiple loci, in order to "test" the observed value of $F_{ST}$
against some expectation, like migration-drift balance, to determine if
there is evidence of selection.

![From @mcelreath_statistical_2020--the relationship between hypotheses,
process models, and statistical models represented as a network.
Original caption: *Relations among hypotheses
(/home/michael/prospectus/figures/mcelreath.png), detailed process
models (middle), and statistical models (right), illustrated by the
example of "neu- tral" models of evolution. Hypotheses (H) are typically
vague, and so cor- respond to more than one process model (P).
Statistical evaluations of hy- potheses rarely address process models
directly. Instead, they rely upon statistical models (M), all of which
reflect only some aspects of the process models. As a result, relations
are multiple in both directions: Hypotheses do not imply unique models,
and models do not imply unique hypotheses. This fact greatly complicates
statistical inference.*](/home/michael/prospectus/figures/mcelreath.png)

Purely statistical models are certainly not without value. However, for
the purposes of inference and forecasting in biodiversity science, and
complex systems in general, the increasing availability of computing
power to simulate complex process models at large scales have enabled
the gap between process models and statistical models to shrink in
recent years. Methods for fitting empirical data to complex simulation
models has seen much interest in the literature of a wide-variety of
fields. In the network science and complex systems literature, methods
of this type are typically called "Bayesian nonparametrics"
[@orbanz_bayesian_2015], or sometimes "likelihood-free inference"
[@alsing_massive_2018; @didelot_likelihood-free_2011; @drovandi_likelihood-free_2011].
In ecology and evolutionary biology, these methods are often called
Approximate Bayesian Compution (ABC), based on the early adoption of
that nomenclature by Beaumont [@beaumont_approximate_2019], who used
first applied ABC methods in evolutionary genetics in the early 2000s.

In order to understand why ABC has significant potential in ecology, it
is best to start by asking: what is it that makes applying statistical
models to data so much easier than process models? The problem begins
with the difficulty of estimating the value of parameters in a process
model from real data. All models $f$ have parameters $\theta$ which lie
outside of what is observable about the model's concepts $A$. As an
example, consider fitting a species-distribution model (SDM),
$y = f(x, \theta)$, where $x$ is the value of an environmental variable
that has been measured across space, and $y$ is the predicted
probability of a given species being present. To fit this model
$y =f(x, \theta)$, we need some observed instances of both environmental
conditions $\hat{x}$ and species occupancy $\hat{y}$ in order to
estimate $\theta$---an "inverse problem" whereby we want to solve the
model backwards, so to speak, in order to estimate the inputs $\theta$
that produced $\hat{y}$ given $\hat{x}$ [@stouffer_all_2019].

For most statistical data models, there are seemingly endless methods of
estimating $\theta$ in both frequentist and Bayesian worlds, yet what
the vast majority of these methods have in common is that they estimate
$\theta$ by using a likelihood function, $\mathbb{L}({x} | \theta)$,
which is defined as the probability of observing some data point
$\hat{x}$ given a model definition $f$ and some parameter values
$\theta$. In a frequentist statistics, the likelihood function is a
ubiquitous tool for parameter inference. Most off-the-shelf statistical
'tests', e.g. ANOVA, are simply a packaged likelihood function that can
be used to quickly estimate parameters for a wide variety of problems
with conceptual similarities. Similarly, in a Bayesian world, the
likelihood function is essential in the application of Bayes' theorem to
inference,

$$P(\theta | \hat{x}) = \frac{P(\hat{x} | \theta)  P(\theta)}{P(\hat{x})} = \frac{\mathbb{L}(\hat{x}, \theta)  P(\theta)}{\int_\Theta \mathbb{L}(\hat{x} | \theta) P(\theta) d\theta}$$

If our model $f$ is simple, we can write our likelihood down
analytically, e.g. if we describe a naive SDM where the probability of
occurrence at a location in space $L$ is given by the difference between
the "mean" trait value of a species, $T$, and some environmental
condition $E({L})$ related to the trait in question[^3], we can define a
model $f$ that says the probability of occurrence at ${L}$ is a Gaussian
evaluated at $E({L}) - T$, which induces a single parameter,
$\theta = \{ \sigma \}$. Because our model is defined with an
analytically tractable distribution, we can write down our likelihood
$\mathbb{L}(x | \theta)$ fairly easily:
$$\mathbb{L}(\text{Species present at} \ {L} \ |\  \sigma) = \frac{1}{\sigma \sqrt{2\pi}} \exp \Big( \frac{-(T-E({L}))^2}{2\sigma^2} \Big)$$
The ability to write our likelihood down in simple analytic terms means
$\mathbb{L}$ is straightforward to compute for any values of
$T, E(\vec{L}),$ or $\sigma$, which is necessary for the majority of
parameter inference methods. Once we estimate $\sigma$, we can estimate
the probability of occurrence at any point in space $L$ by simply
evaluating $\mathbb{L}(\text{Species present} | E(L) , T, \sigma)$ at
that location, at which point we have a fully-fledged SDM.

What then, if we want to describe a model $f$ where the probability of
occurrence is driven by both neutral changes in the spatial
distributions of each species, environmental stochasticity, variability
in species' traits in space and time, and so forth? A likelihood
function for this type of process quickly becomes intractable. However,
modern computational power enables us to simulate many replicates of
stochastic simulation models, which we can treat as approaching the
likelihood function as the number of replicates increases[^4]. One can
then use ABC methods (most of which rely on typical MCMC
rejection-sampling) to infer model parameters, and to use model
selection criteria to determine which mechanistic process, written as a
simulation, is more likely to have produced a set of data.

Trade-offs: limited number of mechanistic scenarios, computational time,
etc.

The contemporary literature surrounding ABC focuses on model validation,
prior selection [@jacobs_unified_2014]), methods for sampling parameters
better [@beaumont_adaptive_2009]), estimating the likelihood via
regression on simulation data to minimize replicates
[@beaumont_approximate_2019])

*Handbook of ABC* [@sisson_handbook_2018]

::: {#the-structure-of-ecological-networks}
The Structure of Ecological Networks
------------------------------------
:::

The search for generality among ecological communities long flummoxed
early ecologists, culminating in the aphorism that community ecology is
"a mess\"
[@lawton_are_1999; @simberloff_community_2004; @vellend_conceptual_2010].

The earliest work on the topology of ecological networks begins with the
Diversity-Stability \"Paradox\", largely attributed to May
[@may_will_1972; @may_stability_2001]. May found, contrary to the
conventional wisdom at the time, that increasing the diversity of
species in an ecological community decreases its stability. May's work
considered dynamics in the forms of both a linear system,
$\dot{x} = M\vec{x}$, and a generalized Lotka-Volterra system,
$\dot{x} = \vec{x} \odot (M \vec{x} + \vec{g})$, where $\vec{x}$ is a
vector of abundances, $\vec{g}$ is a vector of change in abundance
absent any consumption and $M_{ij}$ between any species $i$ and $j$ is
the interaction strength[^5]. May's generative model of a food web $M$
with $N_s$ species is

$$M = \begin{cases}\sim N(0, \sigma^2) \quad\quad\quad &\text{w.p. }\ c\\ 0 &\text{else}\end{cases}$$

It is important to emphasize that \"stable\" in this context means
fixed-point stability in a deterministic system. One can compute the
stability of a fixed-point by examining the eigenvalues of the Jacobian
of your system around any fixed point. For both of the models may used,
the Jacobian around a fixed point is always the adjacency matrix, and so
without computing any derivatives we can simply check if the eigenvalues
$\lambda$ of the adjacency matrix $M$ all have real component less than
$0$, i.e. $\{ \text{Re}(\lambda) < 0 \} \ \ \forall\lambda$, to
determine if the system has a stable equilibrium. By generating and
evaluating the stability of food-webs this way, May showed as $N_s$
increases, the probability that a food web will be stable goes to $0$.
There is where the so-called 'paradox' lies---we observe food-webs in
nature that are woven between far more species than we would expect
under May's model [@foodwebglobally], and so naturally the study of
complexity in food webs turned to both understanding the processes that
structure food webs such that they can persist.

One of the most powerful tools for problem-solving is paying attention
to what is *invariant* about a system, meaning that which does not
change in the system, even as we adjust its parameters
[@@polya_how_2009]). Ecosystems vary in seemingly dimensionless ways.
Yet, we can still find an invariant in ecology---the amount of energy
per unit area on the planet is a measurable value, and insofar as we
have any undisputed "laws" in science, one that is fairly commonly
accepted is that energy has to go somewhere. The application of
thermodynamics to trophic communities led to a renaissance in our
understanding of food web structure. We directly had measurable things
we could test against a model's expectation, like allometric scaling
[@cohen_food_1977; @gravel_trophic_2011; @stouffer_robust_2006]) and
metabolic energy-efficiency in trophic interactions
[@yodzis_body_1992]). This enabled us to develop more sophisticated
models of both community structure, in the form of generative network
models [@cohen_food_1977; @williams_simple_2000] that can be fit to
empirical food webs [@allesina_general_2008], and the development of
community dynamics models that are better rooted in thermodynamic
constraints. Such models are rooted in MacArthur's Consumer-Resource
model [@macarthur_cr], with additional parameters added for metabolic
efficiency and energy-use based on allometry [@yodzis_body_1992]. These
models have much a much stronger empirical basis than LV-type models,
but come with the trade-off of, in most cases, analytic intractability.
Both these generative models of network structure and dynamics models
have been used to study the stability of complex food webs
[@allesina_stability_2012; @allesina_predicting_2015], and consider more
dimensions of stability than May's fixed-point method [@dominguezpaper],
and an existing software library `BioEnergetic.jl` contains a set of
generative network models, and a deterministic thermodynamic community
model solver [@delmas_simulation_2017].

In parallel, network science has developed its own set of generative
models for network structure which have several natural applications in
community ecology. One common feature of empirical ecological networks
is they exhibit modularity and nestedness. Understanding the modular
structure of networks [^6] has been a consistent theme in the networks
literature for many years [@newman; @clauset]. Stochastic-Block-Models
(SBMs) have seen extensive use for modular and nested network structures
outside of ecology. Although SBMs are good at detecting modularity and
nestedness, there is a trade off between good-fit and information about
the process generating the network structure. SBMs only detect patterns
in data, they can not on their own tell us how communities are
assembled.

What are the modern questions

::: {#spatial-ecology}
Spatial Ecology
---------------
:::

Spatial ecology as it exists today would be radically different if not
for the Theory of Island Biogeography (TIBG) [@macarthur_theory_2016].
TIBG is a foundation for both modern spatial and community ecology, and
further provides a mechanistic explanation for the species-area
relationship, one of the most well-established \"laws\" in ecology. The
conceptual construction of space used by TIBG---a set of internally
homogeneous 'islands', each variable in size and surrounded by
inhospitable water/matrix, each either occupied or unoccupied by a
particular species and connected via dispersal---had deep impacts on the
methodology and models used to study ecological patterns across space.
Around the same time, metapopulation theory, coined by Levins
[@levins_demographic_1969], explicitly explored occupancy dynamics in a
similar way. Much like TIBG, Levins considered as system of isolated
patches, each either occupied or unoccupied in time. The proportion of
patches $p$ occupied at any time was modeled as

$$\frac{dp}{dt} = cp(1-p) - ep$$

where $c$ is the instantaneous probability of colonization and $e$ is
the instantaneous probability of extinction of any given patch. From
this Levins derived that the system will only persist if
$\frac{c}{e} > 1$. Levins' Metapopulation model and TIBG share much in
common, all patches are homogeneous in that they all are colonized or go
extinct with the same probability as every other patch, and it is
assumed that each system progresses toward an equilibrium state over
time. The assumption of uniform colonization and extinction rates across
all patches was eventually challenged by Hanski and Ovaskainen, who
developed a spatially-explicit model of metapopulation dynamics
[@hanski_practical_1994]) , where a finite number of populations each
has an explicit location in space, an area (which is a proxy for
resource availability, much like TIBG), and a unique probability of
colonization of extinction based both on the physical proximity to other
patches and the occupancy state of the rest of the system. Further, the
increased availability of computer power in the 1990s enabled the first
simulation models to be applied in spatial ecology. Many studies focused
on the effects of habitat structure and loss by simulating occupancy
dynamics on a lattice and measuring the probability of metapopulation
persistence [@bascompte_habitat_1996], etc) .

Although TIBG and both Levins' and Hanski's metapopulation models rely
on discrete-space constructions of space, the increasing availability of
remote-sensing data has enabled the use of 'continuous' ecological data
in the form of rasters. As satellites designed for Earth Science orbit
the Earth, they bounce electromagnetic signals off the surface of our
planet, and record the spectral signature they receive reflected back at
them. The reflective signature of Earth's terrain can then be used to
estimate various properties about its surface---land cover, hydrology
and topography, abundance of abiotic resources like nitrogen and
phosphorus, and so on. The properties used by both different satellites
and different models vary widely in what they try to predict---from the
level of coarse land-cover categorizations to the presence of particular
species [@cite]. Further, there is considerable variability in the
spatial and temporal scale at which data is collected--however, it is
still hard to overstate the potential value of large-scale raster data
in ecological forecasting, as we now have methods to build complex
models of habitat suitability and dispersal using resistance surfaces
[@cite]).

These have the potential to integrate nicely with climate and land-use
forecasting models derived from other fields ([@dietze]).

::: {#metacommunities}
Metacommunities
---------------
:::

Leibold et al. [@leibold_metacommunity_2004] introduced the
metacommunity framework a synthesis of community and spatial ecology.
They define four paradigms under which previous research on the
interplay of community and spatial ecology can be categorized: 1) the
Species-Sorting perspective, 2) the Patch-Dynamics perspective, 3) the
Mass-Effect Perspective, and 4) the Neutral perspective.

The Species-Sorting perspective is the foundational work of niche theory
[@hutchinson_ecological_1973; @chase_ecological_2003], which is the
earliest study of the effects of spatial processes on community
structure. However, this work considered space solely as a domain in
which the environment varies---each species is a static object in space
in time, which are distributed according to selection on environmental
variables. The Patch-Dynamics perspective is rooted in the TIBG from
above--occupancy dynamics on discrete, internally homogeneous
patches/islands, where diversity is limited by dispersal and not
resource availability. The Mass-Effect perspective shifts to systems
where dispersal drives patterns of local demography, rather than
occupancy. Included here is the theory of sources and sinks \cite{},
which have seen widespread application in several subfields \cite{}.
Finally, the Neutral perspective considers community dynamics driven by
random drift, i.e. dynamics at scales where there is not enough
variability in either the environment or traits to drive variation of
community structure across space, beyond the variability attributable to
the inherent stochasticity of population dynamics [@hubbell].

The conceptual frameworks used in each of the historical literatures for
each of these paradigms often differed drastically---however Velland
2010 [@vellend_conceptual_2010] argues that within each of these four
perspectives we see the same four fundamental processes driving
dynamics, just in different amounts. Velland's four processes are
Selection, Dispersal, Drift, and Speciation--functionally the same as
the fundamental processes in evolutionary genetics, which similarly
deals with shifting compositions of units of over space and time, the
difference being that the unit is alleles, not species. These
fundamental processes have been used in recent years to develop
process-based models of metacommunity dynamics, which aim to provide a
more general explanation of metacommunity structure [@poisot_2014],
[@thompson]).

biodiversity/ef/es relationship. know the least about this.

Several questions remain---at what different levels of each of the four
processes do communities move between Leibold et al.'s four
prespectives?

A Metacommunity Model
=====================

Here we describe a process-based simulation model of metacommunity
dynamics across space, which will be implemented as a software toolkit
which will be used for each research chapter in the dissertation.

::: {#what-can-we-measure}
What can we measure?
--------------------
:::

In the last section we explored how it is essential for a model $f$ to
interface with observable quantities $O(A)$ of the conceptual objects
$A$ that $f$ is built with. Much of what drives community dynamics in
space and time is not directly observable to us--the evolutionary life
histories of organisms lie outside the temporal limits of our
observation, as do the ecological conditions of the more-than extremely
recent past, only what we can infer. What we can directly
observe--abundance/occupancy at a given time, traits or genomes sampled
from individuals, etc.--are subject to the limitations of exhaustive
field work, which can only be done on relatively small spatial scales.
We have databases composed of occupancy/abundance data, traits, inferred
phylogenetic history, and interactions (mangal paper, ncbi, etc), but
there is often much variability in the resolution of this data. For
abiotic variables, we can collect, with variable but ever-improving
spatial and temporal resolution, environmental variables like
temperature, precipitation, as well as land-usage maps, and more
recently, topographical and hydrological models of the Earth's surface.
From other fields we also have well-developed predictive models of
climatology, hydrology, and land-use, which can serve as inputs into our
predictive ecological models.

::: {#the-four-parts-of-a-metacommunity-model}
The Four Parts of a Metacommunity Model
---------------------------------------
:::

Here, we divide our metacommunity model into four parts:

1.  **Metaweb Model**: $\{M, B, \frac{\partial B}{\partial t}\}$

    The Metaweb model consists of the topology of the metaweb $M$, and
    the way the biomass $B$ flows through the metaweb,
    $\frac{\partial B}{\partial t}$. The metaweb $M$ can be derived
    empirically, or built from a generative model [@williams_martinez],
    [@allesina]). $\frac{\partial B}{\partial t}$ can be a deterministic
    model (like used in [@delmas], thompson, dakos stability), or
    include stochasticity and trait-matching as part of the functional
    response.

2.  **Spatial Model**: $\{L, S, H, E, \Phi \}$

    We have some set of locations $L$ in a spatial domain $S$. This
    representation of landscape structure maps onto the most common
    spatial representations in ecology: patch-based, spatial graph, and
    raster/lattice---see Figure 2. Each location $L$ is associated with
    a values of environmental variables $E(L)$ and of habitat
    suitability $H_i(L)$ for each species $i$, which is empirically
    derivable from various existing models at either large scales (SDMs)
    or small scales (resistance surfaces/land use maps)---see Figure
    3---or can alternatively be generated using any number of methods
    for simulating spatially auto-correlated data. Finally, the spatial
    model represents dispersal via the dispersal potential
    $[\Phi^{(i)}_{xy}]$, which is the instantaneous probability that a
    unit of biomass from species $i$ moves from
    $x \to y \quad \forall x,y \in S$. The value of $\Phi^{(i)}_{xy}$ is
    derivable from a resistance surface produced via Curcuitscape
    [@cite], or can be modeled as a function of isolation-by-distance
    using a dispersal kernel [@hanski], who knows all of them).

    ![Three different representations of landscape structure often used
    in ecology (patches, spatial graph, lattice/raster). Each of these
    spatial models consist of discrete locations $L_i$ in a spatial
    domain $S$. Each $L_i$ interacts with $L_j$ according to the
    dispersal potential $\Phi$, see main
    text.](/home/michael/prospectus/figures/different_spatial_models_w_labels.png)

    ![Methods for creating a spatial model of habitat suitability for a
    species $j$. On large scales, habitat suitability is approximated by
    species distribution models. At smaller scales, land-use models and
    resistance surfaces
    ](/home/michael/prospectus/figures/habitat suitability w labels.png)

3.  **Selection Model**: $\{ E, T, \frac{\partial T}{\partial t}\}$

    The selection model describes the traits $T_i(L)$ of each species
    $i$ at a location $L$, and some function
    $\frac{\partial T}{\partial t}$ which describes how $T_i(L)$ changes
    over time as a function of both $E(L)$ and $T_i(L)$, which has
    several candidates from evolutionary biology
    [@price_selection_1970; @queller_fundamental_2017]. Further, the
    selection model could include some measure of speciation based on
    differences in $T_i$, however it doesn't directly relate to the
    questions in the proposed chapters, so we omit further details.

4.  **Community Summary Model**: $\{ C(\hat{B}) \}$

    Finally, the Community Summary model is a summary statistic which
    maps from the observed state of biomass abundance (or occupancy)
    $\hat{B}$ at some place and time to a value that representscan be
    compared to actual data community structure, e.g. Shannon-entropy as
    a measure of $\alpha$-diversity. $C$ could also be a measure of
    $\beta$ or $\gamma$-diversity. If we are using a measure of
    $\alpha$-diversity, we may include an additional summary statistic
    to encapsulate the distribution of $C$ across all locations $L$. See
    Figure 4. One goal with the metacommunity model is to compare
    various metacommunity summary statistics to explore how they covary.
    Further, if summary statistics are not differentiable even when the
    generative process is different, that itself is interesting, and, in
    general, simulation models are excellent testing grounds for the
    biases of summary stats.

![Metacommunity state space $\Omega$ (left), as summarized by some
statistic $C$. Each colored dot in $\Omega$ represents a different
pseudoequilibria in state-space (unobservable to us), which corresponds
with some value or distribution of values of the summary statistic
$C(\hat{B})$. In the figure, each pseudoequilibrium corresponds with a
distinct distribution of $\hat{B}$ (some measure of $\alpha$-diversity)
across locations $L$
(right).](/home/michael/prospectus/figures/metacomm_w_distributions.png)

::: {#software-implementation}
Software Implementation
-----------------------
:::

Here, we describe how we will implement this metacommunity model as a
modular toolbox of software to simulate metacommunity dynamics that
interfaces with actual data and can be applied forecast in real systems.

::: {#interfacing-with-generative-models-and-data}
### Building an Instance of the Model {#interfacing-with-generative-models-and-data}
:::

In Figure 5 we can see how the conceptual objects in our metacommunity
model
$A = \{B, L, M, T, \Phi, H, C, \frac{\partial B}{\partial t}, \frac{\partial T}{\partial t} \}$
can interface with both generative models for the sake of using the
software as a "virtual laboratory" [@volker_grimm] and empirical data to
forecast in real systems. The point is not necessarily to vary all
elements at once, but instead to have a modular set of tools that cover
a wide variety of use-cases. For example, if for a given use-case
selection is not a relevant part of the question being asked, one could
remove selection on traits from the model entirely.

What is hat y and hat x For example, the data used as an input $\hat{y}$
could be an empirical metaweb $M$, with observations of abundance or
occupancy $\hat{B}$, and the researcher could be interested in
estimating the values of dispersal in $\Phi$. In this case, perhaps we
would implement a simulation with and without trait variability, with
and without stochastic dispersal, with different priors on $\Phi$, and
so forth, fit each to the data, and use information criterion to
determine which has the best predictive capacity via crossvalidation
(see 'Choosing Models and Priors' below).

![this is a caption](/home/michael/prospectus/figures/inputs.png)

::: {#finding-the-pseudoequilibria-of-our-metacommunity-model}
### Describing Metacommunity Dynamics {#finding-the-pseudoequilibria-of-our-metacommunity-model}
:::

For any given instance of a model $\hat{A}$, one can then simulate the
dynamics of the community, at which point we have a sampled trajectory
$B(t) \ \ \forall t \in \tau$ where $\tau$ is the simulation time
domain. From this, we apply our summary statistic
$C(B(t)) \ \ \forall t \in \tau$, and we have a trajectory in summary
statistic space $\Omega$---see figure ref. After running our model for
many replicates, we can compute a density over the state-space $\Omega$
which represents the proportion of time the model spent in that part of
$\Omega$. One natural question is whether most models tend to converge
to a small area of $\Omega$ and sit at equilibrium, or wander around
state-space eternally (see Dissertation Outline --- Chapter 4).

![A density over summary-statistic space $\Omega$, computer by averaging
states across replicates. A density could be time-indexed, or averaged
across all
timesteps.](/home/michael/prospectus/figures/density_plot.png)

::: {#fitting-to-data-with-abc}
### Fitting Simulations to Data with ABC {#fitting-to-data-with-abc}
:::

In order to fit this metacommunity model to real data, we'll build an
ABC sampler which takes in a definition of a simulation model $\hat{A}$
and a set of priors with hyperparameters $\text{Priors}(\chi)$ as
inputs, and estimates the posterior distribution---see Figure acb.

The version of an ABC Sampler presented here is methodologically the
simplest (and original) version, based on using a simulated likelihood
to run a rejection-based sampling MCMC algorithm. In the top-right panel
of figure ref, to actually compute $\mathbb{L}(\hat{y} | \theta)$ from
simulation outputs under [@beaumont_adaptive_2003], one defines an
acceptance tolerance $\rho$, and accepts
$\mathbb{L}(y_{sim} | \theta) = \mathbb{L}(\hat{y} | \theta)$ if
$|\hat{y} - y_{sim}| < \rho$ . Alternatively, one can run a regression
on the on the simulation outcomes to get an analytic approximation of
$\mathbb{L}(\hat{y} | \theta)$ [@whodidthis]. More recent improvements
to ABC sampling deviate from simple rejection sampling algorithms for
efficiency, e.g. doing rejection sampling whilst composing the simulated
likelihood to reduce the amount of time spent running the simulation
model in "bad" regions of parameter space---see Adaptive Monte Carlo
[@beaumont_adaptive_2009] and Sequential Monte Carlo [@cite].

To do this, the sampler draws a set of parameters
$\hat{\theta} \sim \text{Priors}(\chi)$ and runs the simulation
procedure described in the previous section to describe a density in
$\Omega$ that approximates the likelihood function,
$\mathbb{L}(C(B) | \hat{\theta})$, and then uses this approximated
likelihood to estimate the posterior distribution $P(\theta | \hat{y})$.

![ A conceptual overview of an Approximate Bayesian Computation (ABC)
Sampler. An ABC Sampler takes in data $\hat{y}$, a simulation model
$f(\theta)$, and a set of priors on simulation model parameters
$\text{Priors}(\chi)$. The sampler generates an approximation of the
likelihood function $\mathbb{L}$ by running a simulation loop
(top-left), where each replicate the parameters $\theta$ are drawn from
the priors. As the number of replicates increases, the distribution of
outcomes approaches the likelihood function
$\mathbb{L}(C(\hat{B}) | \theta)$ (top-right), which can be used to
infer the posterior $P(\theta | \hat{y})$ via rejection sampling methods
(bottom-left). (This figure implies using a regression on simulation
data in (2) to estimate $\mathbb{L}$, although early ABC papers use a
tolerance around $L(\hat{y}|\theta))$ to do rejection sampling, see
[@beaumont_approximate_2019])](/home/michael/prospectus/figures/abc_conceputal.png)

If we have several competing simulation models or sets of hyperpriors,
we can compare them using information criterion to see which one best
describes the data.

::: {#choosing-models-and-priors}
### Choosing Models and Priors
:::

In order to select which version of a simulation model (e.g.
deterministic vs. stochastic dispersal) and set of priors gives our
model the most predictive power, we need a method for applying an
information criterion to a set of models and priors--see figure not done
yet.

To validate our models, we have few options beyond in-sample prediction.
Crossvalidation can be done by repeated subsmapling. k-fold
crossvalidation considers

k-fold crossvalidation

::: {#forecasting}
### Forecasting
:::

Once we've estimated the best fitting posterior distribution
$P(\theta | \hat{y})$, we can use it for forecasting via the best
fitting simulation model. We can simply draw
$\hat{\theta} \sim P(\theta | \hat{y})$ and run the dynamics model
forward in time. Doing this many times, we get a density of predicted
outcomes across the time domain $\tau$, with our uncertainty in
parameter estimated propagated through to our forecast. If we have a
forecasted model of land-use or climate change, we can also use that as
an input into the model to shift $E_i(L, t)$ and $H_i(L,t)$ over time as
well, while incorporating the uncertainty in those forecast models as
well.

The goal would be to fore

![this is a
caption](/home/michael/prospectus/figures/different_scenarios.png)

Dissertation Outline
====================

Here, we outline the general structure of the five planned dissertation
chapters. At the moment, I'm planning for five chapters, the first being
a review, the second being a software paper detailing the model, and
then three research chapters where the model is applied. For the three
research chapters, I'm planning to use the model as a \"virtual
laboratory\" in two of them, to first answer questions about
metacommunity structure and diversity as a function of the different
levels of Velland 2010's [@vellend_conceptual_2010] fundemental
processes, and second to focus specifically on landscape connectivity's
effects on diversity. In the final chapter, I aim to interface the model
with data from a real system to forecast the effects of either climate
or land-use change, depending on what data set will work best.

Chapter One --- Introduction and Review {#chapter-one-introduction-and-review .unnumbered}
---------------------------------------

An Introduction and Review Chapter, looks a lot like this document. The
goal is to introduce the problems of understanding the processes behind
metacommunity structure and dynamics, review (as opposed to overview)
the literature in the adjacent fields, and summarize the major results
of the dissertation.

Chapter Two --- Model Paper {#chapter-two-model-paper .unnumbered}
---------------------------

A chapter about the model, detailing the model as described above, how
it is implemented as software, and how it can be used to answer
questions in community ecology. This chapter would be aimed at a
software journal, e.g. Methods in Ecology and Evolution. Hopefully we
could use LEAP data as an empirical example in the actual paper,
although that work might fall under chapter five in the dissertation.

Chapter Three --- Metacommunity Assembly {#chapter-three-metacommunity-assembly .unnumbered}
----------------------------------------

-   At what proportions of selection, dispersal, and drift so we move
    in-between Leibold et al.'s four paradigms?

-   At what spatial scales and temporal does commmunity assembly shift
    from being driven by neutral to niche processes?

-   How does selection on biotic interactions (e.g. trait-matching)
    effect metacommunity structure and diversity?

-   How does the dimensionality of trait-space effect the capacity for
    diversity in communities?

-   What are different summary statistics used to measure $\alpha$,
    $\beta$, and $\gamma$-diversity in ecological networks, and how do
    they covary?

-   What structural features do food-webs that stable under rewirings
    have in common? Do these predictions agree with our existiexistingng
    understanding of stability in food-webs [@allesina]?

-   When does environmental change cause metacommunity rewirings?

-   What models succeed in predicting the onset of metacommunity
    structure, e.g. all the critical transitions paeprs.

Chapter Four --- Space and Metacommunity Structure {#chapter-four-space-and-metacommunity-structure .unnumbered}
--------------------------------------------------

Using the model as a virtual laboratory [@rollsback_agent_2005] to
determine the effect of landscape connectivity on metacommunity
structure.

-   How does landscape connectivity change metacommunity structure?

-   What makes a given metacommunity structure to sensitive to changes
    in landscape connectivity?

-   Many previous models of metacommunity ecology assume equal dispersal
    capacity across species. What happens when we change this?

-   Can we identify which habitat patches are most influential in
    allowing biodiversity to persist in a landscape?

-   How does the spatial heterogeneity in the environment affect the
    diversity capacity of a landscape?

![this is a
caption](/home/michael/prospectus/figures/gonzalez_ef_es.png)

Chapter Five --- Forecasting  {#chapter-five-forecasting .unnumbered}
-----------------------------

-   A dataset with one metacommunity with temporal data --- LEAP, other
    experiments

-   Use SDMs to forecast what rewirings of networks look like under
    different climate forecast models.

-   Determine what effects corridors would have on community structure
    in a Protected Area forecast this local system in face of
    climate/land use. Canadian Protected area data, St. Lawrence
    region..

-   Using the model with large dataset (i.e. Mangal \cite{}) to see
    which processes are most likely driving each network, and to
    forecast community structure using whatever SDM/Habitat suitability
    models I can get for species in the dataset for forecasting

Conclusion
==========

At this point, the next steps are to review the relevant literature that
I've not yet seen--much of the purpose for reviewing the literature
earlier was to determine find the gaps in what I've read. I'm also going
to start building the software and reviewing the data sources that are
available.

What am I worried about? Simulation time for these types of models can
get computationally very expensive and slow. ABC requires many
replicates to get a good description of the likelihood function, and
doing crossvalidation requires fitting many times on subset s of the
data. Ideally fitting regressions to the likelihood function can speed
this up. Other concerns include if ABC is too sensitive to priors or
typically provides results with poor fit. If so, parameter estimation
for forecasting could be done using hierarchical models or something
more well established in the literature.

Table of Symbols
================

                   Name                                Symbol                Meaning
  -------------------------------------- ----------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
              Concept Space                              $A$                 the set of conceptual objects designed to represent scientific one could define in a scientific model $f$
               State Space                            $\Omega$               the set of possible states a given system (respresented using a concept set $A$) could exist in at any given time. $\Omega$ can be thought of as the span of $O(A)$.
           Observation Function                          $O$                 a function which maps conceptual objects in our models to observations, which typically (but not necessarily) take the form of real numbers
             Scientific Model                            $f$                 the set of conceptual objects designed to represent scientific one could define in a scientific model
             Parameter Space                          $\Theta$               the set of possible values the parameters $\theta$ of a model $f$ could have
           Dispersal Potential                       $\Phi_{ij}$             the probability that a unit biomass born in $i$ reproduces in $j$
              Spatial Domain                             $S$                 the space in which spatial locations $L$ are represented as coordinates
            Spatial Locations                            $L$                 the set of locations $L_i \in S$ , each with a coordinate
            Probability Space                       $\mathbb{P}$             the combined set of a state space $\Omega$, a $\sigma$-algebra of events within the set the states, ${F} \in \Omega$ , and a probability measure $P$ which maps any ${F} \in \Omega$ to a number between $0$ and $1$
            Trait Distribution                       $T_i(x,t)$              the distribution of traits at population $i$ as a function of time. here $T_i(x,t)$ is a probability density function over $x \in [0,1]$ for any given population $i$.
            Bioenergetic Model            $$\frac{\partial B}{\partial t}$$  describes the flow of energy stored as biomass on a food web
           Likelihood Function             $\mathbb{L}(\hat{x} | \theta)$    a mapping from a combination of state and parameter values to a probability of that combination occurring under some model $f$
          Posterior Distribution                $P(\theta | \hat{x})$        the probability distribution of a parameter $\theta$ given some data $\hat{x}$ and a prior $P(\theta)$
            Prior Distribution                       $P(\theta)$             an a priori estimate of the distribution of a parameter $\theta$
                Parameters                            $\theta$               the parameters of any given model $f$
                 Metaweb                                 $M$                 a network of possible interactions between species, typically represented as an adjacency matrix
                                                                             
                                                                             
              Biomass Vector                          $\vec{B}$              
        Biomass vector observation                    $\hat{B}$              
   Community Structure Summary Function             $C(\hat{B})$             
       Habitat Suitability Function                 $H_i(L_j,t)$             the habitat suitability of species $i$ and locations $L_j$ at time $t$
              Set of species                        $\mathbb{S}$             
               Time domain                             $\tau$                
                                                                             

There is still a reliance on summary statistics, but if summary
statistics are not differentiable even when the generative process is
different, that is in itself is interesting, and, in general, simulation
models are excellent testing grounds for the biases of summary
statistics (see Jost's D vs Fst etc).

In the \"virtual laboratory\" case, the parameter values often are meant
to encapsulate the the entire spectrum of possible values, are based in
what the researcher (or reviewers) find interesting. In the second case,
parameter inference is vital in producing useful predictions.

[^1]: The reality is computing the gravitational dynamics of more than
    two bodies of comparable mass is, much like ecological modeling,
    tough. Halley's work avoided the infamous n-body problem, but modern
    astrodynamicists use simulation models for many of the same reasons
    we advocate their use in ecology, coming up in the main text.

[^2]: In the sense that computer software can often be implemented by a
    person whose is a non-expert in the methods of the software, but is
    using it for an applied purpose, see much of bioinformatics as an
    example.

[^3]: Of course, capturing the capacity for a species to persist using a
    single dimension is, to say the least, unlikely. The
    oversimplification here is in service of defining the most simple
    model possible.

[^4]: There are several caveats here, all outside the scope of this
    document

[^5]: Itself a term fraught with ambiguity, although recent work has
    addressed this \cite{}

[^6]: Confusingly, network scientists call this \"community structure\",
    but to avoid confusion with ecological communities, we'll avoid this
    word.
