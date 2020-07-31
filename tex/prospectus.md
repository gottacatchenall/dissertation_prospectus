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

 For most stochastic processes, we a limited by our ability to describe analytic likelihood functions that can be quickly computed to fit models.

It has long been difficult to describe a likelihood function for a stochastic model of a complex system. However, modern computational power enables us to simulate many replicates of stochastic simulation models, and via the central limit theorem^[There are notable caveats here, primarily that if the true distribution that we are trying to approximate doesn't have finite variance, CLT no longer applies.], we can treat the distribution of simulation model outcomes as approaching the likelihood function as the number of replicates increases. 



Simulation models have long been used forecasting and inference of complex systems. One does not struggle to list fields where simulation models are a ubiquitous tool of the trade--climate science, meteorology, epidemiology, etc. Ecology has much to gain in adopting these methods. 	



