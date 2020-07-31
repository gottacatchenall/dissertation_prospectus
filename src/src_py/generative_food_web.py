import numpy as np
import matplotlib as mpl
import networkx as nx

class FoodWebParameters:
    def __init__(self,connectance=0.15, number_of_species=25, type = 'williams_martinez'):
        self.connectance = connectance
        self.number_of_species = number_of_species

class FoodWeb:
    def __init__(self, food_web_parameters):
        self.food_web_parameters = food_web_parameters
        self.niche_values = self.get_random_niche_values()
        self.consumption_intervals = self.get_random_consumption_intervals()
        self.adjacency_matrix = self.get_adjaceny_matrix_for_niche_model()
        self.trophic_levels = self.get_trophic_levels()

    def get_trophic_levels(self):
        adjacency_matrix = self.adjacency_matrix
        num_species = self.food_web_parameters.number_of_species
        L = [0 for i in range(num_species)]
        new_troph = True
        while (new_troph):
            new_troph = False
            for i in range(num_species):
                max_l = 0
                for j in range(num_species):
                    if (adjacency_matrix[j,i] == 1):
                        if L[j] >= max_l:
                            max_l = L[j] + 1

                if (max_l > L[i]):
                    L[i] = max_l
                    new_troph = True

        for i in range(num_species):
            for j in range(num_species):
                if (adjacency_matrix[j,i] == 1):
                    if (L[i] - L[j] > 1):
                        L[i] = L[j] + 1

        return(L)
    def get_random_niche_values(self):
            niche_values  = np.random.uniform(size=self.food_web_parameters.number_of_species)
            return niche_values

    def get_random_consumption_intervals(self):
        alpha = 1  # as used in original paper
        beta = (1.0/(2*self.food_web_parameters.connectance)) - 1

        consumer_interval_radii = np.random.beta(a=alpha, b=beta, size=self.food_web_parameters.number_of_species)
        consumer_interval_midpoints = [np.random.uniform(0, self.niche_values[i]) for i in range(self.food_web_parameters.number_of_species)]

        consumption_interval = [(max(0,consumer_interval_midpoints[i] - consumer_interval_radii[i]), min(consumer_interval_midpoints[i] + consumer_interval_radii[i], self.niche_values[i])) for i in range(self.food_web_parameters.number_of_species)]
        return consumption_interval

    def get_adjaceny_matrix_for_niche_model(self):
        num_species = self.food_web_parameters.number_of_species
        adjacency_matrix = np.zeros((num_species, num_species))

        for i in range(num_species):
            for j in range(num_species):
                prey_niche_value = self.niche_values[i]
                predator_lower_interval = self.consumption_intervals[j][0]
                predator_upper_interval = self.consumption_intervals[j][1]

                if (predator_lower_interval < prey_niche_value and prey_niche_value < predator_upper_interval):
                    adjacency_matrix[i,j] = 1
                else:
                    adjacency_matrix[i,j] = 0
        return adjacency_matrix

    def get_connectance(self):
        return (0.5*sum([sum(self.adjacency_matrix[i]) for i in range(self.food_web_parameters.number_of_species)])/(self.food_web_parameters.number_of_species**2))

    def plot_food_web(self):
        G = nx.from_numpy_matrix(self.adjacency_matrix)
        edges = nx.draw_networkx_edges(G, nx.layout.spring_layout(G), arrowstyle='->', node_color='blue',
                               arrowsize=10, width=2, label='')
        return (edges)
        #web = Web.Web(self.adjacency_matrix, display={'charge': 1500, 'linkStrength' : 0.5, 'colorBy': 'degree', 'sizeBy': 'degree'})
        #web.show()
