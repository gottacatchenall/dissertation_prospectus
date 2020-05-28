# Dissertation Prospectus

Michael Catchen



## **Introduction**

### Why is community ecology related to biodiversity, evolution, broad questions?



Community ecology necessarily occurs in both space and time.

Ecosystems are inherently dynamical systems.



## Literature Review 

Dang i'm just chillin



## The Model

### What can we measure about this in the real world?

#### Biotic

- occupancy
- traits, interactions
  - usually in a database, compiled from individual studies with different aims
    - lacking standardization - interaction

#### Abiotic

- remote sensing is essential to spatial ecology
- occupancy
- traits, interactions
	- usually in a database, compiled from individual studies with different aims
		- lacking standardization - interaction 

- What can we use models to infer?


- Niche vs. Neutral
	- environmental conditions and their relation to ranges and interactions
	- dispersal and neutral colonization/extinction

### Whats a convenient mathematical framework to write this down?

poisot paper citation
- Environmental Conditions in space and time $E_i(x,t)$
- Species Indicator (occupancy/abundance) in space and time $S_i(x,t)$
- Traits in space and time $T_i(x,t)$
- Interaction Network $A_{ij}(x,t)$

For each location, $(x,y) \in \{(i,j) \in \mathbb{N}^{2}_{< L}\}$,

$$S_i\big(\vec{x}, t\big) = f\bigg(S\big(\vec{x}, t-1\big)\bigg)$$

#### differential

$$ f_i(\vec{S}) = S_i + \Delta t \bigg[\sum_j S_i [M(\vec{S})]_{ij} \bigg] $$

where $M(\vec{S})$ describes energy dynamics on the metaweb.

#### summarizing community structure

how do we summarize community structure in a lattice? summary metric, $g(\vec{x}, \vec{S}, t)$, which describes community structure in each cell

#### Major Questions

- differentiating niche vs neutral processes in metacommunity assembly
- critical transitions in community structure
	- when we change strength of environmental factors
	- when we change dispersal (connectivity, etc)


#### What does it _do_?

###  **Chapter One** —
- f

###  **Chapter Two** —
- f

###  **Chapter Three** —
- f
