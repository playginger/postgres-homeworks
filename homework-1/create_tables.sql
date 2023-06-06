-- SQL-команды для создания таблиц
CREATE TABLE employees
(
    employee_id int PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    title varchar(255) NOT NULL,
    birth_date date NOT NULL,
    notes text NOT NULL
);

SELECT * FROM employees;

CREATE TABLE customer
(
    customer_id varchar(10) PRIMARY KEY,
    company_name varchar(255) NOT NULL,
    contact_name varchar(255) NOT NULL
);


CREATE TABLE orders
(
	order_id int PRIMARY KEY NOT NULL,
	customer_id varchar(10) REFERENCES customer(customer_id),
	employee_id int REFERENCES employees(employee_id),
	order_date date NOT NULL,
	ship_city varchar(100) NOT NULL
);
