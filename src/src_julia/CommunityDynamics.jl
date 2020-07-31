include("./FoodWebModel.jl")
include("./CommunityDynamicsInit.jl")

using DelimitedFiles

function get_initial_condition(model)
    num_species::Int64 = model.parameters.number_of_species
    B = zeros(num_species)

    for i in 1:num_species
        if (model.food_web.trophic_levels[i] == 0)
            B[i] = 1.0
        else
            B[i] = rand(Uniform())
        end

    end
    return B
end

function get_functional_response(B, prey, predator, model)
    if (B[prey] > 0)
        num_species = model.parameters.number_of_species
        adjacency_matrix = model.adjacency_matrix

        in_degree_predator = model.in_degree[predator]
        a_ij = model.attack_rate_matrix[prey,predator]
        h_ij = model.handling_time_matrix[prey,predator]
        m_predator = model.masses[predator]

        q = model.parameters.hill_expontent

        numerator = (1.0/in_degree_predator) * h_ij * a_ij* (B[prey]^(1+q))

        denom = m_predator

        for k in 1:num_species
            if (B[k] > 0)
                if (adjacency_matrix[k,predator] == 1)
                    a_kj = model.attack_rate_matrix[k,predator]
                    h_kj = model.handling_time_matrix[k,predator]
                    denom += (m_predator)* ((1.0/in_degree_predator) * a_kj * h_kj * (B[k]^(1+q)))
                end
            end
        end

        return (numerator/denom)
    else
        return 0.0
    end
end

function respond_to_extinction(i, model)
    num_species = model.parameters.number_of_species
    new_adjacency_matrix::Array{Int64} = model.food_web.adjacency_matrix
    for j in 1:num_species
        new_adjacency_matrix[i,j] = 0
        new_adjacency_matrix[j,i] = 0
    end
    new_edgelist = get_edgelist(model.food_web.parameters, new_adjacency_matrix)
    model.edgelist = new_edgelist
    model.adjacency_matrix = new_adjacency_matrix
end

function get_new_B(B, model)
    num_species::Int64 = model.parameters.number_of_species
    dB = [0.0 for i in 1:num_species]
    edgelist = model.edgelist
    d0 = model.parameters.d0
    delta_t = model.parameters.delta_t

    for i in 1:num_species
        if (B[i] > 0)
            # growth (if a plant)
            if (model.food_web.trophic_levels[i] == 0)
                dB[i] += (1.0 - B[i])*B[i]
            end

            # mortality
            dB[i] -= (model.metabolic_demand[i] * B[i] + B[i]*d0)
        end
    end


    for (i,j) in edgelist
        if (B[i] > 0 && B[j] > 0)
            F_ij::Float64 = get_functional_response(B, i, j, model)
            # i gets eaten
            dB[i] -= (B[i]*F_ij)

            # j eats
            e_ij = (model.food_web.trophic_levels[i] == 0) ? 0.45 : 0.85
            dB[j] += e_ij * F_ij
        end
    end


    newB = [ 0.0 for i in 1:num_species]
    for i in 1:num_species
        if B[i] > 0
            newB[i] = (B[i] + delta_t* dB[i])
        end
    end

    for i in 1:num_species
        # extinction :(
        if (newB[i] < model.masses[i] * model.parameters.extinction_threshold)
            newB[i] = 0
            respond_to_extinction(i, model)
        end
    end

    return newB
end

function run_dynamics(model::DynamicsModel)
    num_species::Int64 = model.parameters.number_of_species
    tstep = model.parameters.delta_t
    num_timesteps = model.parameters.number_of_timesteps

    log::Array{Float64,2} = zeros(num_species, num_timesteps)

    B = get_initial_condition(model)
    for t in 1:num_timesteps
        log[:,t] = B
        B = get_new_B(B, model)
    end
    return log

#    prob = ODEProblem(dB_dt, B0, tspan, model)
#    sol = solve(prob)
#    print(sol)
#    plot(sol)
end

function print_model_parameters(model::DynamicsModel)
    print("DYNAMIC MODEL ==================\n\n\n\n")
    print(string("food web object", model.food_web))
    print("\n\n")

    print("MASSES =====\n")
    writedlm(stdout, model.masses)
    print("\n\n")


    print("METABOLIC DEMAND =====\n")
    writedlm(stdout, model.metabolic_demand)
    print("\n\n")


    print("ATTACK RATE MATRIX =====\n")
    writedlm(stdout, model.attack_rate_matrix)
    print("\n\n")

    print("HANDING TIME MATRIX =====\n")
    writedlm(stdout, model.handling_time_matrix)
    print("\n\n")

    print("DYNAMIC MODEL PARAMETERS ===============\n\n")
    for i in fieldnames(typeof(model.parameters))
        print(i, ":   \t", getfield(model.parameters, i), "\n")
    end
    print("\n\n")

    print("ADJACENCY MATRIX =====\n")
    writedlm(stdout, model.food_web.adjacency_matrix)
    print("\n\n")


end

function log_model(log, model)
    num_species::Int64 = model.parameters.number_of_species
    tstep = model.parameters.delta_t
    num_timesteps = model.parameters.number_of_timesteps

    open("timeseries.csv", "w") do io
        write(io, "species_id, time, biomass\n")
    end

    open("timeseries.csv", "a") do io
        for t in 1:num_timesteps
            for s in 1:num_species
                out = string(s,',', t*tstep, ',',log[s,t],'\n')
                write(io, out)
            end
        end
    end

    open("food_web.csv", "w") do io
        write(io, "species_id,trophic_level,in_degree, niche_value,mass,metabolic_demand\n")

        for s in 1:num_species
            out = string(s, ',', model.food_web.trophic_levels[s],
            ',', model.in_degree[s], ',', model.food_web.niche_values[s], ',', model.masses[s], ',', model.metabolic_demand[s], '\n')
            write(io, out)
        end
    end

end

model = DynamicsModel(num_species = 15)
log = run_dynamics(model)
log_model(log, model)
