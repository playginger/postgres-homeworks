from pathlib import Path

CURRENT_PATH = Path(__name__).parent
customers_data = Path.joinpath(CURRENT_PATH, 'north_data/customers_data.csv')
employees_data = Path.joinpath(CURRENT_PATH, 'north_data/employees_data.csv')
orders_data = Path.joinpath(CURRENT_PATH, 'north_data/orders_data.csv')
