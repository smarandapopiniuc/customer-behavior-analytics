
import pandas as pd
import numpy as np

datafile = pd.read_csv(r"C:\Users\smara\Documents\ProjetFinFormation\sampled_data\FactEvents.csv")

clients = datafile[['client_id']].drop_duplicates()

clients['gender'] = np.random.choice(['Male', 'Female'], size=len(clients))

ages = np.random.normal(loc=40, scale=12, size=len(clients))
ages = np.clip(ages, 18, 90)

clients['age'] = ages.round().astype(int)

clients['country'] = np.random.choice(
    ['BE', 'FR', 'NL', 'IT', 'DE'],
    size=len(clients)
)

clients = clients.reset_index(drop=True)
clients.to_csv(r"C:\Users\smara\Documents\ProjetFinFormation\sampled_data\clients.csv", index=False)
print(clients.head())