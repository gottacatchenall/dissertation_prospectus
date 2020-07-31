setwd("~/prospectus/")
library(tidyverse)
library('ggthemr')
ggthemr('earth')



read.csv('testout.csv') %>% glimpse() %>%
  group_by(C,S) %>%
  mutate(prop_surv = survS/S) %>%
  ggplot(aes(S, prop_surv, color=factor(C))) + geom_point() + facet_wrap(. ~ C) +theme_minimal()

















read.csv('timeseries.csv') %>%
  full_join(read.csv('food_web.csv'), by='species_id') %>%
  group_by(time) %>%
  mutate(total_biomass=sum(biomass)) %>%
  group_by(time,species_id) %>% 
  mutate(relative_abundance=biomass/total_biomass) %>%
  ggplot(aes(time, relative_abundance, group=species_id, color=factor(trophic_level))) +
  geom_line(size=1.5, alpha=0.5) +
  theme_minimal() 

read.csv('timeseries.csv') %>%
  full_join(read.csv('food_web.csv'), by='species_id') %>%
  group_by(time) %>%
  mutate(total_biomass=sum(biomass)) %>%
  filter(biomass > 0) %>%
  group_by(tisme,species_id) %>% 
  mutate(relative_abundance=biomass/total_biomass) %>%
  ggplot(aes(log(mass), relative_abundance, group=species_id, color=factor(trophic_level))) +
  geom_point() +
  theme_minimal() 

