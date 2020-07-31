include("./CommunityDynamics.jl")
using DataFrames, CSV, ProgressMeter

function count_species_at_end(log)
    max_timestep = length(log[1,:])
    ns = length(log[:,1])

    remaining_species_ct = 0

    for s in 1:ns
        if log[max_timestep] > 0
            remaining_species_ct += 1
        end
    end
    return remaining_species_ct
end

num_species_list = [5, 10, 15, 30, 50]
connectances = [0.1, 0.15, 0.2, 0.25, 0.3]
n_reps = 50
df = DataFrame(connectance=[], num_species=[], remaining_species_ct=[])
@showprogress for r in 1:n_reps
    for c in connectances
        for ns in num_species_list
            dyn_model = DynamicsModel(num_species=ns, food_web=FoodWeb(FoodWebParameters(number_of_species=ns,connectance=c)))
            log = run_dynamics(dyn_model)
            stable_species_ct = count_species_at_end(log)

            push!(df.connectance, c)
            push!(df.num_species, ns)
            push!(df.remaining_species_ct, stable_species_ct)
        end
    end
end
CSV.write("out.csv", df)
