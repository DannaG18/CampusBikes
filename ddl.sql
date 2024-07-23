CREATE DATABASE IF NOT EXISTS campusbikes;
USE campusbikes;

CREATE TABLE IF NOT EXISTS country(
    id_country VARCHAR(5),
    name VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS model(
    id_model VARCHAR(20),
    name VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS brand(
    id_brand VARCHAR(20),
    name VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS phone_type(
    phone_type_id INT(2),
    type VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS contact(
    id_contact INT(5),
    document_type INT(2),
    name VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS document_type(
    id_document_type INT(2) AUTO_INCREMENT,
    name VARCHAR(10);
);

CREATE TABLE IF NOT EXISTS city(
    id_city VARCHAR(5),
    name VARCHAR(25),
    country_id VARCHAR(5)
);

CREATE TABLE IF NOT EXISTS sale(
    id_sale INT(11) AUTO_INCREMENT,
    date_sale DATE,
    client_id VARCHAR(20),
    total_amount DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS sale_detail(
    id_sale_detail VARCHAR(10),
    sale_id INT(11),
    bike_id VARCHAR(10),
    bikes_number INT(10),
    unit_price DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS phone(
    id_phone INT(5) AUTO_INRREMENT,
    phone_type_id INT(2),
    phone_number VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS client(
    id_client VARCHAR(20),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(100),
    phone_id INT(5),
    city_id VARCHAR(5)
);

CREATE TABLE IF NOT EXISTS bike(
    id_bike VARCHAR(10),
    model_id VARCHAR(20),
    brand_id VARCHAR(20),
    price DECIMAL(10,2),
    stock INT(10)
);

CREATE TABLE IF NOT EXISTS supplier(
    id_supplier VARCHAR(20),
    document_type INT(2),
    name VARCHAR(25),
    contact_id INT(5),
    phone_id INT(5),
    email VARCHAR(100),
    city_id INT(5)
);

CREATE TABLE IF NOYT EXISTS replacement(
    id_replacement VARCHAR(5),
    name VARCHAR(30),
    description VARCHAR(100),
    price DECIMAL(10,2),
    stock INT(10),
    supplier_id VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS purchase(
    id_purchase INT(11) AUTO_INCREMENT,
    date DATE,
    supplier_id VARCHAR(20),
    total_amount DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS purchase_detail(
    id_purchase_detail VARCHAR(10),
    purchase_id INT(11),
    replacement_id VARCHAR(5),
    purchase_number INT(10),
    unit_price DECIMAL(10,2)
); 