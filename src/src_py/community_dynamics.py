from generative_food_web import FoodWeb, FoodWebParameters
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import copy
import networkx as nx
plt.style.use('fivethirtyeight')

class CommunityDynamicsParameters:
    def __init__(self, food_web, number_of_timesteps=300,timestep_width=0.1):
        self.food_web = food_web
        self.number_of_species = food_web.food_web_parameters.number_of_species
        self.number_of_timesteps = number_of_timesteps
        self.timestep_width = timestep_width
        self.adjacency_matrix = copy.deepcopy(food_web.adjacency_matrix)

class CommunityDynamicsModel:
    def get_masses(self):
        num_species = self.parameters.number_of_species
        Z = 1.5   # as used in sole-lab paper
        masses = [Z**(self.trophic_levels[i]) for i in range(num_species)]
        return masses

    def get_weight_vector(self):
        adjacency_matrix = self.adjacency_matrix
        num_species = self.parameters.number_of_species
        in_degree = [sum(adjacency_matrix[:,i]) for i in range(num_species) ]
        weight_vector = [(0.0) for i in range(num_species)]

        for i in range(num_species):
            if (in_degree[i] != 0 ):
                weight_vector[i] = 1.0/in_degree[i]
            else:
                weight_vector[i] = 0
        return weight_vector

    def get_attack_rate_matrix(self):
        num_species = self.parameters.number_of_species
        adjacency_matrix = self.adjacency_matrix
        attack_rate_matrix = np.zeros((num_species, num_species))

        a0 = 50.0         # kefi lab paper
        a0_plant = 10.0   # kefi lab paper

        for i in range(num_species):
            for j in range(num_species):
                if (adjacency_matrix[i,j]):
                    alpha_j = np.random.normal(0.7, 0.1) # kefi lab paper params
                    alpha_i = np.random.normal(0.4, 0.1) # kefi lab paper params
                    m_j = self.mass_vector[j]
                    m_i = self.mass_vector[i]
                    if (self.trophic_levels[i] != 0 and self.trophic_levels[j] != 0):
                        attack_rate_matrix[i,j] = a0 * m_i**alpha_i  * m_j**alpha_j
                    else:
                        attack_rate_matrix[i,j] = a0_plant * m_i * alpha_i
        return attack_rate_matrix

    def get_handling_time_matrix(self):
        num_species = self.parameters.number_of_species
        handling_time_matrix = np.zeros((num_species, num_species))
        adjacency_matrix = self.adjacency_matrix

        h0 = 1  # kefi lab paper

        for i in range(num_species):
            for j in range(num_species):
                if (adjacency_matrix[i,j]):
                    m_i = self.mass_vector[i]
                    m_j = self.mass_vector[j]
                    H_j = np.random.normal(-0.6, 0.1) # kefi lab paper params
                    H_i = np.random.normal(-0.5, 0.1) # kefi lab paper params
                    handling_time_matrix[i,j] = h0 * m_i**H_i  * m_j**H_j
        return handling_time_matrix

    def get_metabolic_demand(self):
        num_species = self.parameters.number_of_species
        metabolic_demand = [0.0 for x in range(num_species)]

        for i in range(num_species):
            if (self.trophic_levels[i] == 0):
                metabolic_demand[i] = 0.138*(self.mass_vector[i]**0.25)
            else:
                metabolic_demand[i] = 0.314*(self.mass_vector[i]**0.25)
        return metabolic_demand


    def __init__(self, food_web = FoodWeb(FoodWebParameters()) ):
        self.parameters =  CommunityDynamicsParameters(food_web)
        self.adjacency_matrix = copy.deepcopy(food_web.adjacency_matrix)
        self.biomass_vector = np.zeros(self.parameters.number_of_species)
        self.trophic_levels = food_web.trophic_levels
        self.mass_vector = self.get_masses()
        self.metabolic_demand = self.get_metabolic_demand()

        self.weight_vector = self.get_weight_vector()
        self.attack_rate_matrix = self.get_attack_rate_matrix()
        self.handling_time_matrix = self.get_handling_time_matrix()


    def compute_functional_response(self, i, j):
        adjacency_matrix = self.adjacency_matrix
        if (adjacency_matrix[i,j]==0):
            return

        num_species = self.parameters.number_of_species
        w_j = self.weight_vector[j]
        a_ij = self.attack_rate_matrix[i,j]
        biomass_vector = self.biomass_vector
        m_i = self.mass_vector[i]

        q = 0.3  # paper
        denom = 1.0
        for k in range(num_species):
            if (adjacency_matrix[i,k] == 1):
                a_jk = self.attack_rate_matrix[j,k]
                h_jk = self.handling_time_matrix[j,k]
                w_k = self.weight_vector[k]
                B_k = biomass_vector[k]
                #denom += w_k*a_jk*h_jk*(B_k)**(1+q)
                denom += w_j*a_jk*h_jk*(B_k)**(1+q)

        denom = (1.0/m_i) * denom

        numer = w_j * a_ij * biomass_vector[i]**(1+q)
        return(numer/denom)
    def get_functional_response_matrix(self):
        num_species = self.parameters.number_of_species
        functional_responce_matrix = np.zeros((num_species, num_species))

        for i in range(num_species):
            for j in range(num_species):
                functional_responce_matrix[i,j] = self.compute_functional_response(i,j)

        return functional_responce_matrix

    def update_this_species(self, i):
        B_i = self.biomass_vector[i]

        num_species = self.parameters.number_of_species
        delta_Bi = 0.0
        K_i = 1.0  # kefi paper
        this_trophic_level = self.trophic_levels[i]

        adjacency_matrix = self.adjacency_matrix
        dt = self.parameters.timestep_width

        # growth
        if (this_trophic_level == 0):
            delta_Bi += (1.0 - B_i/K_i) * B_i

        # eating
        for j in range(num_species):
            if adjacency_matrix[j,i] == 1:
                e_ij = 0.85
                if (self.trophic_levels[i] == 0):
                    e_ij = 0.45
                F_ij = self.functional_responce_matrix[j,i]
                delta_Bi += e_ij * F_ij

        # getting eaten
        for k in range(num_species):
            if adjacency_matrix[i,k] == 1:
                B_k = self.biomass_vector[k]
                F_ki = self.functional_responce_matrix[i,k]
                delta_Bi += (-1*B_k*F_ki)

        # metabolism and deaththe
        x_i = self.metabolic_demand[i]
        d0 = 0.1        # kefi
        delta_Bi += -1*(x_i*B_i  + d0*B_i)

        new_Bi = B_i + dt * delta_Bi

        return new_Bi

    def respond_to_extinction(self, i):
        num_species = self.parameters.number_of_species
        for j in range(num_species):
            self.adjacency_matrix[i,j] = 0
            self.adjacency_matrix[j,i] = 0

        self.weight_vector = self.get_weight_vector()
        self.attack_rate_matrix = self.get_attack_rate_matrix()
        self.handling_time_matrix = self.get_handling_time_matrix()


    def update_biomass_vector(self):
        old_biomass_vector = self.biomass_vector
        num_species = self.parameters.number_of_species
        new_biomass_vector = [0 for i in range(num_species)]

        for i in range(num_species):
            if (old_biomass_vector[i] > 0):
                new_biomass_vector[i] = self.update_this_species(i)
                if (new_biomass_vector[i] < (10**-3)*self.mass_vector[i]):
                    new_biomass_vector[i] = 0.0
                    self.respond_to_extinction(i)

        return new_biomass_vector

    def set_initial_condition(self):
        num_species = self.parameters.number_of_species
        for i in range(num_species):
            if (self.trophic_levels[i] == 0):
                self.biomass_vector[i] = 1.0
            else:
                self.biomass_vector[i] = 0.1

    def run_model(self):
        num_timesteps = self.parameters.number_of_timesteps
        delta_t = self.parameters.timestep_width

        self.set_initial_condition()

        log = np.zeros((self.parameters.number_of_species, num_timesteps))
        for t in range(num_timesteps):
            if (t % 10 == 0):
                pass
                #print(t)
            self.functional_responce_matrix = self.get_functional_response_matrix()
            #print('')
            #print('TIME %d: ' % (t), self.functional_responce_matrix)
            log[:, t] = self.biomass_vector
            new_biomass_vector = self.update_biomass_vector()
            self.biomass_vector = new_biomass_vector
        #print(self.adjacency_matrix)
        self.log = log

    def plot_log(self):
        num_species = self.parameters.number_of_species
        fig, (ax1, ax2) = plt.subplots(1,2)
        t = range(len(self.log[1,:]))

        for i in range(num_species):
            ax1.plot(t,self.log[i,:], label=[i])

        options = { 'arrowstyle': '->', 'arrowsize':30, 'node_size': 400, 'width': 1}
        G = nx.from_numpy_matrix(self.parameters.food_web.adjacency_matrix, create_using=nx.DiGraph)

        cmap = mpl.colors.ListedColormap(plt.rcParams['axes.prop_cycle'].by_key()['color'])
        nx.draw_networkx(G, arrows=True, node_color=range(num_species), **options, cmap=cmap)
        ax1.legend()

        plt.show()

    def count_surviving_species(self):
        num_species = self.parameters.number_of_species
        num_timesteps = self.parameters.number_of_timesteps
        species_ct = 0
        for i in range(num_species):
            if (self.log[i,num_timesteps-1] > 0):
                species_ct += 1
        return species_ct
