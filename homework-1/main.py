"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv
from settings import employees_data, customers_data, orders_data

# Подключение к базе данных
with psycopg2.connect(
        database='north',
        user='postgres',
        password='135790eeg',
        host='localhost',
        port='5432'
) as conn:
    # Заполнение таблицы employees данными из employees.csv
    with conn.cursor() as cur:
        with open(employees_data, 'r') as f:
            reader = csv.reader(f)
            next(reader)  # Пропустить заголовок
            for row in reader:
                cur.execute(
                    "INSERT INTO employees  VALUES (%s, %s, %s, %s, %s, %s)",
                    (int(row[0]), row[1], row[2], row[3], row[4], row[5])
                )

    # Заполнение таблицы customers данными из customers.csv
    with conn.cursor() as cur:
        with open(customers_data, 'r') as f:
            reader = csv.reader(f)
            next(reader)  # Пропустить заголовок
            for row in reader:
                cur.execute(
                    "INSERT INTO customer  VALUES (%s, %s, %s)",
                    (row[0], row[1], row[2])
                )

    # Заполнение таблицы orders данными из orders.csv
    with conn.cursor() as cur:
        with open(orders_data, 'r') as f:
            reader = csv.reader(f)
            next(reader)  # Пропустить заголовок
            for row in reader:
                cur.execute(
                    "INSERT INTO orders  VALUES (%s, %s, %s, %s, %s)",
                    (int(row[0]), row[1], int(row[2]), row[3], row[4])
                )

# Закрыть подключение

conn.close()
