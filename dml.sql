-- Insertar datos en la tabla country
INSERT INTO country (id_country, name_country) VALUES
('USA', 'United States'),
('CAN', 'Canada'),
('MEX', 'Mexico');

-- Insertar datos en la tabla model
INSERT INTO model (id_model, name_model) VALUES
('M001', 'Model 1'),
('M002', 'Model 2');

-- Insertar datos en la tabla brand
INSERT INTO brand (id_brand, name_brand) VALUES
('B001', 'Brand 1'),
('B002', 'Brand 2');

-- Insertar datos en la tabla phone_type
INSERT INTO phone_type (phone_type_id, type_phone) VALUES
(1, 'Mobile'),
(2, 'Home'),
(3, 'Work');

-- Insertar datos en la tabla document_type
INSERT INTO document_type (name_document) VALUES
('Passport'),
('ID Card'),
('Driver License');

-- Insertar datos en la tabla contact
INSERT INTO contact (id_contact, document_type, name_contact) VALUES
(1, 1, 'John Doe'),
(2, 2, 'Jane Smith');

-- Insertar datos en la tabla city
INSERT INTO city (id_city, name_city, country_id) VALUES
('NYC', 'New York', 'USA'),
('TOR', 'Toronto', 'CAN'),
('MEX', 'Mexico City', 'MEX');

-- Insertar datos en la tabla phone
INSERT INTO phone (id_phone, phone_type_id, phone_number) VALUES
(1, 1, '1234567890'),
(2, 2, '0987654321');

-- Insertar datos en la tabla client
INSERT INTO client (id_client, first_name, last_name, email, phone_id, city_id) VALUES
('C001', 'Alice', 'Johnson', 'alice@example.com', 1, 'NYC'),
('C002', 'Bob', 'Williams', 'bob@example.com', 2, 'TOR');

-- Insertar datos en la tabla supplier
INSERT INTO supplier (id_supplier, document_type, name_supplier, contact_id, phone_id, email, city_id) VALUES
('S001', 1, 'Supplier 1', 1, 1, 'supplier1@example.com', 'NYC'),
('S002', 2, 'Supplier 2', 2, 2, 'supplier2@example.com', 'TOR');

-- Insertar datos en la tabla bike
INSERT INTO bike (id_bike, model_id, brand_id, price, stock) VALUES
('B001', 'M001', 'B001', 500.00, 10),
('B002', 'M002', 'B002', 750.00, 5);

-- Insertar datos en la tabla replacement
INSERT INTO replacement (id_replacement, name_replacement, description, price, stock, supplier_id) VALUES
('R001', 'Replacement 1', 'Description 1', 50.00, 100, 'S001'),
('R002', 'Replacement 2', 'Description 2', 75.00, 200, 'S002');

-- Insertar datos en la tabla sale
INSERT INTO sale (date_sale, client_id, total_amount) VALUES
('2024-07-20', 'C001', 1250.00),
('2024-07-21', 'C002', 750.00);

-- Insertar datos en la tabla purchase
INSERT INTO purchase (date_purchase, supplier_id, total_amount) VALUES
('2024-07-22', 'S001', 5000.00),
('2024-07-23', 'S002', 7500.00);

-- Insertar datos en la tabla sale_detail
INSERT INTO sale_detail (id_sale_detail, sale_id, bike_id, bikes_number, unit_price) VALUES
('SD001', 1, 'B001', 1, 500.00),
('SD002', 1, 'B002', 1, 750.00),
('SD003', 2, 'B002', 1, 750.00);

-- Insertar datos en la tabla purchase_detail
INSERT INTO purchase_detail (id_purchase_detail, purchase_id, replacement_id, purchase_number, unit_price) VALUES
('PD001', 1, 'R001', 50, 50.00),
('PD002', 2, 'R002', 75, 75.00);

-- USE CASE 1
--Add new bikes
INSERT INTO bike (id_bike, model_id, brand_id, price, stock) VALUES
('B001', 'M001', 'B001', 500.00, 10),
('B002', 'M002', 'B002', 750.00, 5);

--Update info bike
UPDATE bike
SET price = 600.00, stock = 8
WHERE id_bike = 'B001';

--Delete info bike
DELETE FROM bike
WHERE id_bike = 'B001';

--USE CASE 2
--Add new purchase
INSERT INTO purchase (date_purchase, supplier_id, total_amount) VALUES
('2024-07-22', 'S001', 5000.00),
('2024-07-23', 'S002', 7500.00);

--Select purchases bike
SELECT id_purchase, date_purchase, supplier_id, total_amount
FROM purchase;

--Total purchases
SELECT SUM(total_amount) AS total_sales
FROM purchases;

--USE CASE 3
--Add suppliers and replacements
INSERT INTO supplier (id_supplier, document_type, name_supplier, contact_id, phone_id, email, city_id) VALUES
('S001', 1, 'Supplier 1', 1, 1, 'supplier1@example.com', 'NYC'),
('S002', 2, 'Supplier 2', 2, 2, 'supplier2@example.com', 'TOR');
INSERT INTO replacement (id_replacement, name_replacement, description, price, stock, supplier_id) VALUES
('R001', 'Replacement 1', 'Description 1', 50.00, 100, 'S001'),
('R002', 'Replacement 2', 'Description 2', 75.00, 200, 'S002');

--Update information 
UPDATE supplier
SET document_type = 2, name_supplier = 'Supplier 1.1'
WHERE id_supplier = 'S001';

UPDATE replacement 
SET name_replacement = 'Replacement 1.1', 'Description 1.1'
WHERE id_replacement = 'R001.1';

--Delete information
DELETE FROM supplier
WHERE id_supplier = 'S001';
DELETE FROM replacement
WHERE id_replacement = 'Replacement 1';

--USE CASE 4
--Show purchases of a specific client
SELECT sd.id_sale_detail, sd.sale_id, sd.bike_id, sd.bikes_number, sd.unit_price, s.date_sale, s.client_id, s.total_amount
FROM sale_detail AS sd
INNER JOIN sale AS s ON s.id_sale = sd.sale_id
INNER JOIN client AS c ON c.id_client = s.client_id
WHERE id_client = 'C001';

--USE CASE 5
--Purchase register
INSERT INTO purchase (date_purchase, supplier_id, total_amount) VALUES
('2024-07-22', 'S001', 5000.00),
('2024-07-23', 'S002', 7500.00);

--Replacement especifications
SELECT pd.id_purchase_detail, pd.purchase_id, p.supplier_id, su.name_supplier, pd.replacement_id, r.name_replacement, pd.purchase_number, pd.unit_price
FROM purchase_detail AS pd
INNER JOIN purchase AS p ON p.id_purchase = pd.purchase_id
INNER JOIN replacement AS r ON r.id_replacement = pd.replacement_id
INNER JOIN supplier AS su ON su.id_supplier = p.supplier_id;

--Update replacement stock
UPDATE replacement
SET stock = 20
WHERE id_replacement = 'R001';

--USE CASE 6
--Show 
SELECT sales_by_model.brand AS brand, sales_by_model.model AS model, sales_by_model.id_brand, sales_by_model.id_model
FROM (
    SELECT br.name_brand AS brand, m.name_model AS model, SUM(sd.bikes_number) AS sale_total, m.id_model, br.id_brand
    FROM brand br
    JOIN bike b ON b.brand_id = br.id_brand
    JOIN model m ON b.model_id = m.id_model
    JOIN sale_detail sd ON sd.bike_id = b.id_bike
    GROUP BY br.name_brand, m.name_model, m.id_model, br.id_brand
) AS sales_by_model
WHERE sale_total = (
    SELECT MAX(sale_total)
    FROM(
        SELECT br1.name_brand AS brand, m1.name_model AS model, SUM(sd1.bikes_number) AS total_purchases, m1.id_model, br1.id_brand
        FROM brand br1
        JOIN bike b1 ON b1.brand_id = br1.id_brand
        JOIN model m1 ON b1.model_id = m1.id_model
        JOIN sale_detail sd1 ON sd1.bike_id = b1.id_bike
        GROUP BY br1.name_brand, m1.name_model, m1.id_model, br1.id_brand
    ) AS sum
    WHERE sum.brand = sales_by_model.brand
);

--USE CASE 7
--Shows the customers who have spent the most in a specific year
SELECT id_client, name_client, sale_spend
FROM (
    SELECT cli.id_client AS id_client, CONCAT(cli.first_name,' ', cli.last_name) AS name_client, (
        SELECT SUM(total_amount)
        FROM sale s
        WHERE s.client_id = cli.id_client
        AND YEAR(s.date_sale) = 2024) AS sale_spend
        FROM client cli
    ) AS sub
WHERE sale_spend IS NOT NULL
ORDER BY sale_spend  DESC;

--USE CASE 8
--Shows the suppliers who have received the most purchases in the last month
SELECT id_supplier, name_supplier, total_purchase
FROM (
    SELECT sp.id_supplier AS id_supplier, sp.name_supplier AS name_supplier, COUNT(p.id_purchase) AS total_purchase
    FROM supplier sp
    JOIN purchase p ON sp.id_supplier = p.supplier_id 
    WHERE p.date_purchase >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY id_supplier, name_supplier
) AS sub
ORDER BY total_purchase DESC;

--USE CASE 9
--Replacements
SELECT r.id_replacement, less_purchased  
FROM (
    SELECT replacement_id, SUM(purchase_number) AS less_purchased
    FROM purchase_detail
    GROUP BY replacement_id
) AS sales_summary 
RIGHT JOIN replacement AS r ON r.id_replacement = sales_summary.replacement_id
ORDER BY less_purchased ASC; 

--USE CASE 10
--Show
SELECT city, top_sales
FROM (
    SELECT id_city, name_city AS city,
        (SELECT COUNT(s.id_sale)
        FROM sale AS s
        JOIN client AS cl ON cl.id_client = s.client_id
        WHERE cl.city_id = c.id_city) AS top_sales
    FROM city AS c
) AS city_sales
ORDER BY top_sales DESC
LIMIT 2;

--JOIN USE CASES
--USE CASE 11
--Show
SELECT c.id_city, SUM(s.total_amount) AS total_amount
FROM sale AS s
INNER JOIN client AS cli ON cli.id_client = s.client_id
INNER JOIN city AS c ON c.id_city = cli.city_id
GROUP BY c.id_city, total_amount;

--USE CASE 12
--Show 
SELECT sup.id_supplier, cou.id_country, cou.name_country
FROM supplier AS sup
INNER JOIN city AS ci ON ci.id_city = sup.city_id
INNER JOIN country AS cou ON cou.id_country = ci.country_id;
-- GROUP BY sup.id_supplier, cou.name_country;

--USE CASE 13
--Shows the total number of spare parts purchased from each supplier
SELECT s.id_supplier, s.name_supplier, SUM(pd.purchase_number) AS replacement_sale
FROM supplier s
JOIN purchase p ON s.id_supplier = p.supplier_id
JOIN purchase_detail pd ON pd.purchase_id = p.id_purchase
GROUP BY s.id_supplier, s.name_supplier
ORDER BY replacement_sale DESC;


--USE CASE 14
--Shows customers who have made purchases within a specific date range
SELECT cli.id_client AS id_client, CONCAT(cli.first_name, ' ', cli.last_name) AS name_client, s.date_sale AS date
FROM client cli
JOIN sale s ON s.client_id = cli.id_client
WHERE s.date_sale BETWEEN '2024-07-01' AND '2024-08-01';

--STORED PROCEDURES
--USE CASE 1
