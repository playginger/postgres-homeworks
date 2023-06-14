-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products
ADD CONSTRAINT chk_price CHECK (unit_price > 0);

select unit_price
from products

-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE products
ADD CONSTRAINT chk_discontinued CHECK (discontinued IN (0,1));

select discontinued
from products
-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
SELECT *
INTO discontinued_products
FROM products
WHERE discontinued = 1;

select discontinued
from products

-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.
ALTER TABLE order_details DROP CONSTRAINT fk_order_details_products;

DELETE FROM order_details
WHERE product_id NOT IN (SELECT product_id FROM products WHERE product_id = order_details.product_id);
DELETE FROM orders WHERE order_id NOT IN (SELECT order_id FROM order_details);
ALTER TABLE order_details ADD CONSTRAINT fk_order_details_products FOREIGN KEY(product_id) REFERENCES products(product_id)