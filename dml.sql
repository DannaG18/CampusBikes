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