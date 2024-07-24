DROP DATABASE IF EXISTS campusbikes;
CREATE DATABASE IF NOT EXISTS campusbikes;
USE campusbikes;

CREATE TABLE IF NOT EXISTS country(
    id_country VARCHAR(5),
    name_country VARCHAR(25),
    CONSTRAINT pk_id_country PRIMARY KEY (id_country)
);

CREATE TABLE IF NOT EXISTS model(
    id_model VARCHAR(20),
    name_model VARCHAR(25),
    CONSTRAINT pk_id_model PRIMARY KEY (id_model)
);

CREATE TABLE IF NOT EXISTS brand(
    id_brand VARCHAR(20),
    name_brand VARCHAR(25),
    CONSTRAINT pk_id_brand PRIMARY KEY (id_brand)
);

CREATE TABLE IF NOT EXISTS phone_type(
    phone_type_id INT(2),
    type_phone VARCHAR(30),
    CONSTRAINT pk_phone_type_id PRIMARY KEY (phone_type_id)
);

CREATE TABLE IF NOT EXISTS document_type(
    id_document_type INT(2) AUTO_INCREMENT,
    name_document VARCHAR(10),
    CONSTRAINT pk_id_document_type PRIMARY KEY (id_document_type)
);

CREATE TABLE IF NOT EXISTS contact(
    id_contact INT(5),
    document_type INT(2),
    name_contact VARCHAR(25),
    CONSTRAINT pk_id_contact PRIMARY KEY (id_contact),
    CONSTRAINT fk_contact_document_type FOREIGN KEY (document_type) REFERENCES document_type(id_document_type)
);

CREATE TABLE IF NOT EXISTS city(
    id_city VARCHAR(5),
    name_city VARCHAR(25),
    country_id VARCHAR(5),
    CONSTRAINT pk_id_city PRIMARY KEY (id_city),
    CONSTRAINT fk_city_country_id FOREIGN KEY (country_id) REFERENCES country(id_country)
);

CREATE TABLE IF NOT EXISTS phone(
    id_phone INT(5) NOT NULL,
    phone_type_id INT(2),
    phone_number VARCHAR(25),
    CONSTRAINT pk_id_phone PRIMARY KEY (id_phone),
    CONSTRAINT fk_phone_type_id FOREIGN KEY (phone_type_id) REFERENCES phone_type(phone_type_id)
);

CREATE TABLE IF NOT EXISTS client(
    id_client VARCHAR(20),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(100),
    phone_id INT(5),
    city_id VARCHAR(5),
    CONSTRAINT pk_id_client PRIMARY KEY (id_client),
    CONSTRAINT fk_client_city_id FOREIGN KEY (city_id) REFERENCES city(id_city),
    CONSTRAINT fk_client_phone_id FOREIGN KEY (phone_id) REFERENCES phone(id_phone)
);

CREATE TABLE IF NOT EXISTS sale(
    id_sale INT(11) AUTO_INCREMENT,
    date_sale DATE,
    client_id VARCHAR(20),
    total_amount DECIMAL(10,2),
    CONSTRAINT pk_id_sale PRIMARY KEY (id_sale),
    CONSTRAINT fk_sale_client_id FOREIGN KEY (client_id) REFERENCES client(id_client)
);

CREATE TABLE IF NOT EXISTS bike(
    id_bike VARCHAR(10),
    model_id VARCHAR(20),
    brand_id VARCHAR(20),
    price DECIMAL(10,2),
    stock INT(10),
    CONSTRAINT pk_id_bike PRIMARY KEY (id_bike),
    CONSTRAINT fk_bike_model_id FOREIGN KEY (model_id) REFERENCES model(id_model),
    CONSTRAINT fk_bike_brand_id FOREIGN KEY (brand_id) REFERENCES brand(id_brand)
);

CREATE TABLE IF NOT EXISTS sale_detail(
    id_sale_detail VARCHAR(10),
    sale_id INT(11),
    bike_id VARCHAR(10),
    bikes_number INT(10),
    unit_price DECIMAL(10,2),
    CONSTRAINT pk_id_sale_detail PRIMARY KEY (id_sale_detail),
    CONSTRAINT fk_sale_detail_sale_id FOREIGN KEY (sale_id) REFERENCES sale(id_sale),
    CONSTRAINT fk_sale_bike_id FOREIGN KEY (bike_id) REFERENCES bike(id_bike)
);

CREATE TABLE IF NOT EXISTS supplier(
    id_supplier VARCHAR(20),
    document_type INT(2),
    name_supplier VARCHAR(25),
    contact_id INT(5),
    phone_id INT(5),
    email VARCHAR(100),
    city_id VARCHAR(5),
    CONSTRAINT pk_id_supplier PRIMARY KEY (id_supplier),
    CONSTRAINT fk_supplier_document_type FOREIGN KEY (document_type) REFERENCES document_type(id_document_type),
    CONSTRAINt fk_supplier_phone_id FOREIGN KEY (phone_id) REFERENCES phone(id_phone),
    CONSTRAINT fk_supplier_contact_id FOREIGN KEY (contact_id) REFERENCES contact(id_contact),
    CONSTRAINT fk_supplier_city_id FOREIGN KEY (city_id) REFERENCES city(id_city)
);

CREATE TABLE IF NOT EXISTS replacement(
    id_replacement VARCHAR(5),
    name_replacement VARCHAR(30),
    description VARCHAR(100),
    price DECIMAL(10,2),
    stock INT(10),
    supplier_id VARCHAR(20),
    CONSTRAINT pk_id_replacement PRIMARY KEY (id_replacement),
    CONSTRAINT fk_replacement_supplie_id FOREIGN KEY (supplier_id) REFERENCES supplier(id_supplier)
);

CREATE TABLE IF NOT EXISTS purchase(
    id_purchase INT(11) AUTO_INCREMENT,
    date_purchase DATE,
    supplier_id VARCHAR(20),
    total_amount DECIMAL(10,2),
    CONSTRAINT pk_id_purchase PRIMARY KEY (id_purchase),
    CONSTRAINT fk_purchase_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier(id_supplier)
);

CREATE TABLE IF NOT EXISTS purchase_detail(
    id_purchase_detail VARCHAR(10),
    purchase_id INT(11),
    replacement_id VARCHAR(5),
    purchase_number INT(10),
    unit_price DECIMAL(10,2),
    CONSTRAINT pk_id_purchase_detail PRIMARY KEY (id_purchase_detail),
    CONSTRAINT fk_purchase_detail_purchase_id FOREIGN KEY (purchase_id) REFERENCES purchase(id_purchase),
    CONSTRAINT fk_purchase_replacement_id FOREIGN KEY (replacement_id) REFERENCES replacement(id_replacement)
); 