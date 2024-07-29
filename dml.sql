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
-- Describes how the system updates the bicycle inventory when a sale is made.
  
DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS UpdateBikesStock (
    IN p_id_bike VARCHAR(10),
    IN p_new_stock INT,
    OUT p_updated_stock INT
)
BEGIN 
  
    UPDATE bike
    SET stock = p_new_stock
    WHERE id_bike = p_id_bike;


    SELECT stock INTO p_updated_stock
    FROM bike
    WHERE id_bike = p_id_bike;
END $$

DELIMITER ;

CALL UpdateBikesStock ('B001', 100, @updated_stock);
SELECT @updated_stock AS updated_stock;

--USE CASE 2
-- Describes how the system records a new sale, including creating the sale and entering the sale details.

DELIMITER $$

CREATE PROCEDURE SaleRegister (
    IN p_date_sale DATE,
    IN p_client_id VARCHAR(20),
    IN p_total_amount DECIMAL(10,2),
    IN p_id_sale_detail VARCHAR(10),
    IN p_bike1_id VARCHAR(10),
    IN p_bike1_number INT,
    IN p_bike1_price DECIMAL(10,2)
)
BEGIN
    DECLARE v_sale_id INT;

    INSERT INTO sale (date_sale, client_id, total_amount)
    VALUES (p_date_sale, p_client_id, p_total_amount);

    SET v_sale_id = LAST_INSERT_ID();

    INSERT INTO sale_detail (id_sale_detail, sale_id, bike_id, bikes_number, unit_price)
    VALUES (p_id_sale_detail, v_sale_id, p_bike1_id, p_bike1_number, p_bike1_price);

    SELECT 
        s.id_sale, 
        s.date_sale, 
        s.client_id, 
        s.total_amount,
        sd.id_sale_detail,
        sd.bike_id, 
        sd.bikes_number, 
        sd.unit_price
    FROM 
        sale s
    JOIN 
        sale_detail sd ON s.id_sale = sd.sale_id
    WHERE 
        s.id_sale = v_sale_id;
END $$

DELIMITER ;

CALL SaleRegister(
    '2024-07-26', 
    'C002', 
    1250.00, 
    'SD005',
    'B002', 
    2, 
    500.00
);

--USE CASE 3
-- describes how the system generates a sales report for a specific customer, showing all sales made by the customer and the details of each sale.

DELIMITER $$

CREATE PROCEDURE SaleReport (
    IN p_client_id VARCHAR(20) 
)
BEGIN 
    SELECT 
        s.id_sale, 
        s.date_sale, 
        s.client_id, 
        s.total_amount,
        sd.id_sale_detail,
        sd.bike_id, 
        sd.bikes_number, 
        sd.unit_price
    FROM sale AS s
    JOIN sale_detail AS sd ON sd.sale_id = s.id_sale
    WHERE s.client_id = p_client_id;
END $$

DELIMITER ;

CALL SaleReport (
    'C002'
);

--USE CASE 4
-- Describes how the system records a new purchase of spare parts from a supplier.

DELIMITER $$

CREATE PROCEDURE PurchaseRegister (
    IN p_date_purchase DATE,
    IN p_supplier_id VARCHAR(20),
    IN p_total_amount DECIMAL(10,2),
    IN p_id_purchase_detail VARCHAR(10),
    IN p_replacement_id VARCHAR(5),
    IN p_purchase_number INT(10),
    IN p_unit_price DECIMAL(10,2)
)
BEGIN
    DECLARE p_purchase_id INT;

    INSERT INTO purchase (date_purchase, supplier_id, total_amount)
    VALUES (p_date_purchase, p_supplier_id, p_total_amount);

    SET p_purchase_id = LAST_INSERT_ID();

    INSERT INTO purchase_detail (id_purchase_detail, purchase_id, replacement_id, purchase_number, unit_price)
    VALUES (p_id_purchase_detail, p_purchase_id, p_replacement_id, p_purchase_number, p_unit_price);

    UPDATE replacement 
    SET stock = stock + p_purchase_number
    WHERE id_replacement = p_replacement_id;

END $$

DELIMITER ;

CALL PurchaseRegister(
    '2024-07-26', 
    'S001', 
    5000.00, 
    'PD004', 
    'R001', 
    10, 
    100.00
);

--USE CASE 5
-- Describes how the system generates a bicycle and spare parts inventory report.

DELIMITER $$

CREATE PROCEDURE GenerateInventoryReport()
BEGIN

    SELECT 
        b.id_bike AS BikeID,
        b.model_id AS ModelID,
        m.name_model AS ModelName,
        b.brand_id AS BrandID,
        br.name_brand AS BrandName,
        b.price AS Price,
        b.stock AS Stock
    FROM 
        bike b
    JOIN 
        model m ON b.model_id = m.id_model
    JOIN 
        brand br ON b.brand_id = br.id_brand;

    SELECT 
        r.id_replacement AS ReplacementID,
        r.name_replacement AS ReplacementName,
        r.description AS Description,
        r.price AS Price,
        r.stock AS Stock
    FROM 
        replacement r;
END $$

DELIMITER ;

--USE CASE 6
--Shows how the system allows for mass updating of prices for all bikes of a specific brand.
DROP PROCEDURE IF EXISTS update_bike_prices();

DELIMITER $$

CREATE PROCEDURE update_bike_prices(
    IN p_brand_id VARCHAR(20),
    IN p_percentage_increment DECIMAL(5,2)
)
BEGIN
    IF p_percentage_increment <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The percentage increase must be greater than 0.';
    ELSE
        UPDATE bike
        SET price = price * (1 + (p_percentage_increment / 100))
        WHERE brand_id = p_brand_id;
    END IF;
END$$

DELIMITER ;

CALL update_bike_prices('B001', 10.0);

--USE CASE 7
--Shows how the system generates a report of customers grouped by city.
DROP PROCEDURE IF EXISTS clients_by_city;

DELIMITER $$

CREATE PROCEDURE clients_by_city()
BEGIN
    SELECT c.name_city AS city, COUNT(cli.id_client) AS total_clients
    FROM client cli 
    JOIN city c ON cli.city_id = c.id_city
    GROUP BY c.name_city;
END$$

DELIMITER ;

CALL clients_by_city();

--USE CASE 8
--Shows how the system checks the stock of a bicycle before allowing the sale.
DROP PROCEDURE IF EXISTS check_stock;

DELIMITER $$

CREATE PROCEDURE check_stock(
    IN p_id_bike VARCHAR(10),
    IN requested INT,
    OUT stock_status VARCHAR(50)
)
BEGIN
    DECLARE current_stock INT;

    SELECT stock
    INTO current_stock
    FROM bike
    WHERE id_bike = p_id_bike;

    IF current_stock >= requested THEN
        SET stock_status = 'Sufficient stock available';
    ELSE 
        SET stock_status = 'Insufficient stock';
    END IF;
END$$

DELIMITER ;

CALL check_stock('B001', 2, @status);
SELECT @status AS stock_status;

--USE CASE 9
--Shows how the system records the return of a bicycle by a customer.
DROP PROCEDURE IF EXISTS return_sale;

DELIMITER $$

CREATE PROCEDURE return_sale(
    IN p_id_sale INT,
    IN p_id_bike VARCHAR(10),
    IN p_refund_amount INT
)
BEGIN
    DECLARE new_stock INT;

    SELECT stock 
    INTO new_stock 
    FROM bike
    WHERE id_bike = p_id_bike;

    SET new_stock = new_stock + p_refund_amount;

    UPDATE bike
    SET stock = new_stock
    WHERE id_bike = p_id_bike;

    DELETE FROM sale_detail WHERE sale_id = p_id_sale;

    DELETE FROM sale WHERE id_sale = p_id_sale;
END$$

DELIMITER ;

CALL return_sale(1, 'B001', 1);

--USE CASE 10
--Shows how the system generates a report of purchases made to a specific supplier, showing all the details of the purchases.
DROP PROCEDURE IF EXISTS purchase_report;

DELIMITER $$

CREATE PROCEDURE purchase_report(
    IN p_id_supplier VARCHAR(20)
)
BEGIN
    SELECT
        p.id_purchase,
        p.date_purchase,
        pd.replacement_id,
        r.name_replacement,
        pd.purchase_number,
        pd.unit_price,
        (pd.purchase_number * pd.unit_price) AS total_price
    FROM purchase p
    JOIN purchase_detail pd ON pd.purchase_id = p.id_purchase
    JOIN replacement r ON r.id_replacement = pd.replacement_id
    WHERE p.supplier_id = p_id_supplier;
END$$

DELIMITER ;

CALL purchase_report('S001');

--USE CASE 11
--Shows how the system applies a discount to a sale before recording the details of the sale.
DROP PROCEDURE IF EXISTS discount_sale;

DELIMITER $$

CREATE PROCEDURE discount_sale(
    IN p_client_id VARCHAR(20),
    IN p_bike_id VARCHAR(10),
    IN p_bikes_number INT(10),
    IN p_unit_price DECIMAL(10,2),
    IN p_discount DECIMAL(5,2)
)
BEGIN
    DECLARE total_amount DECIMAL(10,2);
    DECLARE discount_amount DECIMAL(10,2);
    DECLARE final_amount DECIMAL(10,2);
    DECLARE new_id_sale_detail VARCHAR(10);

    SET total_amount = p_bikes_number * p_unit_price;
    SET discount_amount = total_amount * (p_discount / 100);
    SET final_amount = total_amount - discount_amount;

    INSERT INTO sale (date_sale, client_id, total_amount)
    VALUES (CURDATE(), p_client_id, final_amount);

    SET @last_sale_id = LAST_INSERT_ID();
    SET new_id_sale_detail = LEFT(CONCAT('SD', UUID_SHORT()), 10);

    INSERT INTO sale_detail (id_sale_detail, sale_id, bike_id, bikes_number, unit_price)
    VALUES (new_id_sale_detail, @last_sale_id, p_bike_id, p_bikes_number, p_unit_price);
END$$

DELIMITER ;

CALL discount_sale('C001', 'B001', 2, 500.00, 10.0);

--SUMMARY FUNCTIONS
--USE CASE 1
--Shows how the system calculates the total sales made in a specific month.
DROP PROCEDURE IF EXISTS calculate_monthly_sales;

DELIMITER $$

CREATE PROCEDURE calculate_monthly_sales(
    IN p_month INT,
    IN p_year INT,
    OUT total_sales DECIMAL(10,2)
)
BEGIN
    SELECT SUM(total_amount)
    INTO total_sales
    FROM sale
    WHERE MONTH(date_sale) = p_month
    AND YEAR(date_sale) = p_year;
    
    IF total_sales IS NULL THEN
        SET total_sales = 0.00;
    END IF;
END$$

DELIMITER ;

CALL calculate_monthly_sales(7, 2024, @total_sales);
SELECT @total_sales AS monthly_sales;


--USE CASE 2
--Shows how the system calculates the average sales made by a specific customer.
DROP PROCEDURE IF EXISTS calculate_average_sales;

DELIMITER $$

CREATE PROCEDURE calculate_average_sales(
    IN p_client_id VARCHAR(20),
    OUT average_sales DECIMAL(10,2)
)
BEGIN
    SELECT AVG(total_amount)
    INTO average_sales
    FROM sale
    WHERE client_id = p_client_id;
    
    IF average_sales IS NULL THEN
        SET average_sales = 0.00;
    END IF;
END$$

DELIMITER ;

CALL calculate_average_sales('C001', @average_sales);
SELECT @average_sales AS average_sales;

--USE CASE 3
--Shows how the system counts the number of sales made within a specific date range.
DROP PROCEDURE IF EXISTS count_sales_by_date_range;

DELIMITER $$

CREATE PROCEDURE count_sales_by_date_range(
    IN p_start_date DATE,
    IN p_end_date DATE,
    OUT total_sales INT
)
BEGIN
    SET total_sales = 0;

    SELECT COUNT(*)
    INTO total_sales
    FROM sale
    WHERE date_sale BETWEEN p_start_date AND p_end_date;
END$$

DELIMITER ;

CALL count_sales_by_date_range('2024-07-01', '2024-07-31', @total_sales);
SELECT @total_sales AS total_sales;

--USE CASE 4
--Shows how the system calculates the total number of spare parts purchased from a specific supplier.
DROP PROCEDURE IF EXISTS calculate_total_replacements_by_supplier;

DELIMITER $$

CREATE PROCEDURE calculate_total_replacements_by_supplier(
    IN p_id_supplier VARCHAR(20),
    OUT total_replacements INT
)
BEGIN
    SET total_replacements = 0;

    SELECT SUM(pd.purchase_number) INTO total_replacements
    FROM purchase_detail pd
    JOIN purchase p ON pd.purchase_id = p.id_purchase
    WHERE p.supplier_id = p_id_supplier;
END$$

DELIMITER ;

CALL calculate_total_replacements_by_supplier('S001', @total_replacements);
SELECT @total_replacements AS total_replacements;

--USE CASE 5
--Shows how the system calculates the total revenue generated in a specific year.
DROP PROCEDURE IF EXISTS calculate_total_income_by_year;

DELIMITER $$

CREATE PROCEDURE calculate_total_income_by_year(
    IN p_year INT,
    OUT total_income DECIMAL(10,2)
)
BEGIN
    SET total_income = 0.00;

    SELECT SUM(total_amount) INTO total_income
    FROM sale
    WHERE YEAR(date_sale) = p_year;
END$$

DELIMITER ;

CALL calculate_total_income_by_year(2024, @total_income);
SELECT @total_income AS total_income;

--USE CASE 6
--Shows how the system counts the number of customers who have made at least one purchase in a specific month.
DROP PROCEDURE IF EXISTS count_active_clients_by_month;

DELIMITER $$

CREATE PROCEDURE count_active_clients_by_month(
    IN p_month INT,
    IN p_year INT,
    OUT active_client_count INT
)
BEGIN
    SET active_client_count = 0;

    SELECT COUNT(DISTINCT client_id) INTO active_client_count
    FROM sale
    WHERE MONTH(date_sale) = p_month
    AND YEAR(date_sale) = p_year;
END$$

DELIMITER ;

CALL count_active_clients_by_month(7, 2024, @active_client_count);
SELECT @active_client_count AS active_client_count;

--USE CASE 7
--Shows how the system calculates the average purchases made from a specific supplier.
DROP PROCEDURE IF EXISTS calculate_average_purchases_by_supplier;

DELIMITER $$

CREATE PROCEDURE calculate_average_purchases_by_supplier(
    IN p_supplier_id VARCHAR(10),
    OUT avg_purchases DECIMAL(10,2)
)
BEGIN
    DECLARE total_purchases INT;
    DECLARE number_of_purchases INT;
    
    SELECT COUNT(*) INTO number_of_purchases
    FROM purchase
    WHERE supplier_id = p_supplier_id;

    SELECT COUNT(DISTINCT id_purchase) INTO total_purchases
    FROM purchase;

    IF total_purchases > 0 THEN
        SET avg_purchases = number_of_purchases / total_purchases;
    ELSE
        SET avg_purchases = 0;
    END IF;
END$$

DELIMITER ;

CALL calculate_average_purchases_by_supplier('S002', @avg_purchase_amount);
SELECT @avg_purchase_amount AS avg_purchase_amount;

--USE CASE 8
--Shows how the system calculates total sales grouped by the brand of bicycles sold.
DROP PROCEDURE IF EXISTS calculate_total_sales_by_brand;

DELIMITER $$

CREATE PROCEDURE calculate_total_sales_by_brand()
BEGIN
    SELECT
        b.brand_id AS brand_id,
        br.name_brand AS brand_name,
        SUM(sd.unit_price * sd.bikes_number) AS total_sales
    FROM sale_detail sd
    JOIN bike b ON sd.bike_id = b.id_bike
    JOIN brand br ON b.brand_id = br.id_brand
    GROUP BY b.brand_id, br.name_brand;
END$$

DELIMITER ;

CALL calculate_total_sales_by_brand();

--USE CASE 9
--Shows how the system calculates the average price of bicycles grouped by brand.
DROP PROCEDURE IF EXISTS calculate_average_price_by_brand;

DELIMITER $$

CREATE PROCEDURE calculate_average_price_by_brand()
BEGIN
    SELECT 
        b.brand_id AS brand_id,
        br.name_brand AS brand_name,
        AVG(b.price) AS average_price
    FROM bike b
    JOIN brand br ON b.brand_id = br.id_brand
    GROUP BY b.brand_id, br.name_brand;
END$$

DELIMITER ;

CALL calculate_average_price_by_brand();

--USE CASE 10
--Shows how the system counts the number of spare parts supplied by each supplier.
DROP PROCEDURE IF EXISTS count_parts_by_supplier;

DELIMITER $$

CREATE PROCEDURE count_parts_by_supplier()
BEGIN
    SELECT
        s.id_supplier AS supplier_id,
        s.name_supplier AS supplier_name,
        COUNT(r.id_replacement) AS number_of_parts
    FROM replacement r
    JOIN supplier s ON r.supplier_id = s.id_supplier
    GROUP BY s.id_supplier, s.name_supplier;
END$$

DELIMITER ;

CALL count_parts_by_supplier();

--USE CASE 11
--Shows how the system calculates the total revenue generated by each customer.
DROP PROCEDURE IF EXISTS total_revenue_client;

DELIMITER $$

CREATE PROCEDURE total_revenue_client(
    IN p_id_client VARCHAR(20)
)
BEGIN
    SELECT CONCAT(cli.first_name, ' ', cli.last_name) AS name_client, SUM(s.total_amount) AS total_sales
    FROM client cli
    JOIN sale s ON cli.id_client = s.client_id
    WHERE cli.id_client = p_id_client
    GROUP BY cli.first_name, cli.last_name;
END$$

DELIMITER ;

CALL total_revenue_client('C001');

--USE CASE 12
--Shows how the system calculates the average monthly purchases made by all customers.
DROP PROCEDURE IF EXISTS average_purchase_month;

DELIMITER $$

CREATE PROCEDURE average_purchase_month(
    IN p_month INT
)
BEGIN 
    SELECT AVG(s.total_amount) AS average_purchase
    FROM sale s
    WHERE MONTH(s.date_sale) = p_month;
END$$

DELIMITER ;

CALL average_purchase_month(7);

--USE CASE 13
--Shows how the system calculates the total sales made on each day of the week.
DROP PROCEDURE IF EXISTS sales_day;

DELIMITER $$

CREATE PROCEDURE sales_day(
    IN p_day INT
)
BEGIN
    SELECT SUM(total_amount) AS total_sales
    FROM sale s
    WHERE DAY(s.date_sale) = p_day;
END$$

DELIMITER ;

CALL sales_day(28);

--USE CASE 14
--Shows how the system counts the number of sales made for each bike category (e.g. mountain, road, hybrid).

DELIMITER $$

CREATE PROCEDURE GetSalesCountByModel(
    IN p_model_id VARCHAR(20)
)
BEGIN
    SELECT 
        m.id_model,
        m.name_model,
        (SELECT COUNT(sd.bike_id) 
        FROM sale_detail sd 
        JOIN bike b ON sd.bike_id = b.id_bike 
        WHERE b.model_id = m.id_model) AS sales_count
    FROM 
        model m
    WHERE 
        m.id_model = p_model_id;
END $$

DELIMITER ;

CALL GetSalesCountByModel('M001');

--USE CASE 15
--Shows how the system calculates the total sales made each month, grouped by year.

DELIMITER $$

CREATE PROCEDURE SellsByMonthYear (
    IN p_date_year INT,
    IN p_date_month INT
) 
BEGIN 
    SELECT YEAR(date_sale) AS year, MONTH(date_sale) AS month, SUM(total_amount) AS total_amount
    FROM sale 
    WHERE YEAR(date_sale) = p_date_year AND MONTH(date_sale) = p_date_month
    GROUP BY YEAR(date_sale), MONTH(date_sale);
END $$

DELIMITER ;

CALL SellsByMonthYear (2024,07);
