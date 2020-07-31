include("./FoodWebModel.jl")
using Distributions: Normal

struct DynamicsModelParameters
    number_of_species::Int64
    number_of_timesteps::Int64
    delta_t::Float64
    allometric_scaling_param::Float64 #Z
    metabolic_scaling_plants::Float64
    metabolic_scaling_other::Float64
    metabelic_power_rate::Float64
    a0::Float64
    a0_plant::Float64
    mu_alpha_getting_eaten::Float64
    mu_alpha_eatting::Float64
    sigma_alpha::Float64
    h0::Float64
    mu_H_eating::Float64
    mu_H_getting_eaten::Float64
    sigma_H::Float64
    hill_expontent::Float64
    extinction_threshold::Float64
    d0::Float64
    function DynamicsModelParameters(num_species; num_timesteps=300, delta_t=0.1)
        return new(num_species, num_timesteps, delta_t, 1.5, 0.138, 0.314, 0.25, 50.0, 10.0, 0.4, 0.7, 0.1, 50.0, -0.6, -0.5, 0.1, 0.3, 0.01, 0.1)
    end
end

mutable struct DynamicsModel
    food_web::FoodWeb
    parameters::DynamicsModelParameters
    masses::Array{Float64}
    metabolic_demand::Array{Float64}
    in_degree::Array{Int64}
    attack_rate_matrix::Array{Float64, 2}
    handling_time_matrix::Array{Float64, 2}
    edgelist::Array{Tuple{Int64, Int64}}
    adjacency_matrix::Array{Int64,2}
    function DynamicsModel(; num_species = 25,
                        food_web = FoodWeb(FoodWebParameters(number_of_species=num_species)), parameters = DynamicsModelParameters(num_species))

        masses = get_masses(food_web, parameters)
        metabolic_demand = get_metabolic_demand(food_web, parameters, masses)
        in_degree = get_in_degree(food_web, parameters)
        attack_rate_matrix = get_attack_rate_matrix(food_web, parameters, masses)
        handling_time_matrix = get_handling_time_matrix(food_web, parameters, masses)
        return new(food_web, parameters, masses, metabolic_demand, in_degree, attack_rate_matrix, handling_time_matrix, food_web.edgelist, food_web.adjacency_matrix)
    end

end

function get_masses(food_web, parameters)
    num_species = parameters.number_of_species
    trophic_levels = food_web.trophic_levels
    Z = parameters.allometric_scaling_param

    masses = [0.0 for i in 1:num_species]

    for i in 1:num_species
        tr = trophic_levels[i]
        mn_mass = Z^trophic_levels[i]

        masses[i] = rand(Normal(mn_mass, mn_mass*0.01))
    end
    print(masses)
    return masses
end

function get_metabolic_demand(food_web, parameters, masses)
    num_species = parameters.number_of_species
    trophic_levels = food_web.trophic_levels
    metabolic_demand::Array{Float64} = zeros(num_species)

    z = parameters.metabelic_power_rate
    plant_scaling = parameters.metabolic_scaling_plants
    other_sclaing = parameters.metabolic_scaling_other

    for i in 1:num_species
        if (trophic_levels[i] == 0)
            metabolic_demand[i] = plant_scaling * (masses[i]^z)
        else
            metabolic_demand[i] = other_sclaing * (masses[i]^z)
        end
    end

    return metabolic_demand
end

function get_in_degree(food_web, parameters)
    num_species = parameters.number_of_species
    adjacency_matrix = food_web.adjacency_matrix
    in_degree::Array{Int64} = [sum(adjacency_matrix[:,i]) for i in 1:num_species]
    return in_degree
end

function get_attack_rate_matrix(food_web, parameters, masses)
    num_species = parameters.number_of_species

    a0 = parameters.a0
    a0_plant = parameters.a0_plant
    mu_alpha_eatting = parameters.mu_alpha_eatting
    mu_alpha_getting_eaten = parameters.mu_alpha_getting_eaten
    sigma_alpha = parameters.sigma_alpha



    adjacency_matrix = food_web.adjacency_matrix
    attack_rate_matrix::Array{Float64} = zeros(num_species, num_species)

    for i in 1:num_species
        for j in 1:num_species
            m_i = masses[i]
            m_j = masses[j]
            if adjacency_matrix[i,j] == 1
                alpha_eating::Float64 = rand(Normal(mu_alpha_eatting, sigma_alpha))
                alpha_getting_eaten::Float64 = rand(Normal(mu_alpha_getting_eaten, sigma_alpha))

                if (food_web.trophic_levels[i] != 0 && food_web.trophic_levels[j] != 0)
                    attack_rate_matrix[i,j] = a0* (m_i^alpha_getting_eaten) * (m_j^alpha_eating)
                else
                    attack_rate_matrix[i,j] = a0_plant * m_i * alpha_getting_eaten
                end
            end
        end
    end

    return attack_rate_matrix
end

function get_handling_time_matrix(food_web, parameters, masses)
    num_species = parameters.number_of_species

    h0 = parameters.h0
    mu_H_getting_eaten = parameters.mu_H_getting_eaten
    mu_H_eating = parameters.mu_H_eating
    sigma_H = parameters.sigma_H

    adjacency_matrix = food_web.adjacency_matrix
    handling_time_matrix::Array{Float64} = zeros(num_species, num_species)

    for i in 1:num_species
        for j in 1:num_species
            m_i = masses[i]
            m_j = masses[j]
            if adjacency_matrix[i,j] == 1
                H_getting_eaten = rand(Normal(mu_H_getting_eaten, sigma_H))
                H_eating = rand(Normal(mu_H_eating, sigma_H))
                handling_time_matrix[i,j] = h0 * (m_i^H_getting_eaten) * (m_j^H_eating)
            end
        end
    end

    return handling_time_matrix
end
