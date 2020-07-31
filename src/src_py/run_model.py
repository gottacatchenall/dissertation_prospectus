from community_dynamics import CommunityDynamicsModel, CommunityDynamicsParameters
from generative_food_web import FoodWeb, FoodWebParameters

num_species_set = [2,3, 5, 10, 15, 20, 25, 30, 50]
connectance_set = [0.1, 0.2, 0.3, 0.45]
n_reps = 100

def ns_connectance_data():
    file = './out.csv'
    with open(file, 'w') as f:
        f.write('num_species,c,surving_ct\n')

    total_ct = len(num_species_set) * len(connectance_set) * n_reps
    ct = 0
    for ns in num_species_set:
        for c in connectance_set:
            for r in range(n_reps):
                fw = FoodWeb(FoodWebParameters(number_of_species=ns, connectance=c))
                cdm = CommunityDynamicsModel(food_web=fw)
                cdm.run_model()
                surv = cdm.count_surviving_species()
                with open(file, 'a') as f:
                    f.write('%d,%f,%d\n' % (ns, c, surv))
                ct += 1
            print('%d / %d' % (ct, total_ct))

ns_connectance_data()
#fw = FoodWeb(FoodWebParameters(number_of_species=30, connectance=0.15))
#cdm = CommunityDynamicsModel(food_web=fw)
#cdm.run_model()
#cdm.plot_log()
