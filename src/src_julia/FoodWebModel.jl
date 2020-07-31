using Distributions: Uniform, Beta

struct FoodWebParameters
    number_of_species::Int64;
    connectance::Float64;
    FoodWebParameters(;number_of_species=20, connectance=0.1) = new(number_of_species, connectance)
end

mutable struct FoodWeb
    parameters::FoodWebParameters;
    niche_values::Array{Float64, 1};
    consumption_intervals::Array{Tuple{Float64, Float64}};
    adjacency_matrix::Array{Int64, 2};
    edgelist::Array{Tuple{Int64,Int64}};
    trophic_levels::Array{Int64 ,1};

    function FoodWeb(params::FoodWebParameters=FoodWebParameters(); niche_values = get_random_niche_values(params), adj_mat = nothing)
        niche_values = niche_values
        consumption_intervals = get_random_consumption_intervals(params, niche_values)
        adjacency_matrix = get_adjaceny_matrix_for_niche_model(params, niche_values, consumption_intervals)
        if (adj_mat != nothing)
            adjacency_matrix = adj_mat
        end
        edgelist = get_edgelist(params, adjacency_matrix);
        trophic_levels = get_trophic_levels(params, adjacency_matrix);
        new(params, niche_values, consumption_intervals, adjacency_matrix, edgelist, trophic_levels)
    end
end

function get_random_niche_values(params::FoodWebParameters)
    num_species::Int64 = params.number_of_species
    niche_values::Array{Float64, 1} =  rand(Uniform(), num_species)
    return niche_values
end

function get_random_consumption_intervals(params::FoodWebParameters, niche_values::Array{Float64,1})
    num_species::Int64 = params.number_of_species

    ## parameters for beta from williams martinez 2001
    alpha::Float64 = 1.0
    beta::Float64 = (1.0/(2.0*params.connectance)) - 1

    consumption_interval_radii::Array{Float64} = rand(Beta(alpha, beta), num_species)

    consumer_interval_midpoints::Array{Float64} = [rand(Uniform(0, n_i)) for n_i in niche_values]

    consumption_intervals::Array{Tuple{Float64,Float64}} = []
    for i in 1:num_species
        low::Float64 = max(0.0, consumer_interval_midpoints[i] - consumption_interval_radii[i])
        hi::Float64 = min(niche_values[i], consumer_interval_midpoints[i] + consumption_interval_radii[i])

        interval::Tuple{Float64, Float64} = (low, hi)
        push!(consumption_intervals, interval)
    end

    return consumption_intervals
end

function get_adjaceny_matrix_for_niche_model(params::FoodWebParameters, niche_values::Array{Float64}, consumption_interval::Array{Tuple{Float64,Float64}})
    num_species::Int64 = params.number_of_species
    adjacency_matrix::Array{Int64} = zeros(num_species, num_species)

    for i in 1:num_species
        for j in 1:num_species
            if (consumption_interval[j][1] < niche_values[i] && niche_values[i] < consumption_interval[j][2] )
                adjacency_matrix[i,j] = 1
            end
        end
    end

    return adjacency_matrix
end

function get_edgelist(params::FoodWebParameters, adjacency_matrix::Array{Int64, 2})
    num_species::Int64 = params.number_of_species
    edgelist::Array{Tuple{Int64,Int64}} = []

    for i in 1:num_species
        for j in 1:num_species
            if (adjacency_matrix[i,j] == 1)
                push!(edgelist, (i,j))
            end
        end
    end

    return edgelist
end


function get_trophic_levels(params::FoodWebParameters, adjacency_matrix::Array{Int64, 2})
    num_species::Int64 = params.number_of_species
    trophic_levels::Array{Int64} = zeros(num_species)

    new_trophic_level::Bool = true
    while (new_trophic_level)
        new_trophic_level = false
        for j in 1:num_species
            max_troph_seen = 0
            for i in 1:num_species
                if (adjacency_matrix[i,j] == 1)
                    if trophic_levels[i] >= max_troph_seen
                        max_troph_seen = trophic_levels[i] + 1
                    end
                end
            end

            if (max_troph_seen > trophic_levels[j])
                trophic_levels[j] = max_troph_seen
                new_trophic_level = true
            end
        end
    end

    for i in 1:num_species
        for j in 1:num_species
            if (adjacency_matrix[j,i] == 1)
                if (trophic_levels[i] - trophic_levels[j] > 1)
                    trophic_levels[i] = trophic_levels[j] + 1
                end
            end
        end
    end

    return trophic_levels
end
