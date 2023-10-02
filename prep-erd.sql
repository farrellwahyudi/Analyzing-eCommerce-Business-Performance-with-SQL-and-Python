-- Create Table
create table if not exists customers_dataset (
	customer_id VARCHAR(50) PRIMARY KEY NOT NULL,
	customer_unique_id VARCHAR(50),
	customer_zip_code_prefix VARCHAR(50),
	customer_city VARCHAR(50),
	customer_state VARCHAR(50)
);

-- Import dataset
COPY customers_dataset
FROM 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\customers_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Create Table
create table if not exists geolocation_dataset (
	geolocation_zip_code_prefix VARCHAR(50),
	geolocation_lat VARCHAR(50),
	geolocation_lng VARCHAR(50),
	geolocation_city VARCHAR(50),
	geolocation_state VARCHAR(50)
);

-- Import dataset
COPY geolocation_dataset
FROM 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Create Table
create table if not exists order_items_dataset (
	order_id VARCHAR(50),
	order_item_id VARCHAR(50),
	product_id VARCHAR(50),
	seller_id VARCHAR(50),
	shipping_limit_date TIMESTAMP,
	price DOUBLE PRECISION,
	freight_value DOUBLE PRECISION
);

-- Import dataset
COPY order_items_dataset
FROM 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Create Table
create table if not exists order_payments_dataset (
	"order_id" VARCHAR(50),
	"payment_sequential" INT,
	"payment_type" VARCHAR(50),
	"payment_installments" INT,
	"payment_value" DOUBLE PRECISION
);

-- Import dataset
COPY order_payments_dataset
FROM 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Create Table
create table if not exists order_reviews_dataset (
	"review_id" VARCHAR(50),
	"order_id" VARCHAR(50),
	"review_score" INT,
	"review_comment_title" VARCHAR(50),
	"review_comment_message" VARCHAR,
	"review_creation_date" TIMESTAMP,
	"review_answer_timestamp" TIMESTAMP
);

-- Import dataset
COPY order_reviews_dataset
FROM 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Create Table
create table if not exists orders_dataset (
	"order_id" VARCHAR(50) PRIMARY KEY NOT NULL,
	"customer_id" VARCHAR(50),
	"order_status" VARCHAR(50),
	"order_purchase_timestamp" TIMESTAMP,
	"order_approved_at" TIMESTAMP,
	"order_delivered_carrier_date" TIMESTAMP,
	"order_delivered_customer_date" TIMESTAMP,
	"order_estimated_delivery_date" TIMESTAMP
);

-- Import dataset
COPY orders_dataset
FROM 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\orders_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Create Table
create table if not exists product_dataset (
	idx INT,
	product_id VARCHAR(50) PRIMARY KEY NOT NULL,
	product_category_name VARCHAR(50),
	product_name_length DOUBLE PRECISION,
	product_description_length DOUBLE PRECISION,
	product_photos_qty DOUBLE PRECISION,
	product_weight_g DOUBLE PRECISION,
	product_length_cm DOUBLE PRECISION,
	product_height_cm DOUBLE PRECISION,
	product_width_cm DOUBLE PRECISION
);

-- Import dataset
COPY product_dataset
FROM 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\product_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Create Table
create table if not exists sellers_dataset (
	"seller_id" VARCHAR(50) PRIMARY KEY NOT NULL,
	"seller_zip_code_prefix" VARCHAR(50),
	"seller_city" VARCHAR(50),
	"seller_state" VARCHAR(50)
);

-- Import dataset
COPY sellers_dataset
FROM 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\sellers_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Deleting zipcode_prefix duplicates from geolocation_dataset
DELETE FROM geolocation_dataset b
USING geolocation_dataset d
WHERE b.ctid < d.ctid AND b.geolocation_zip_code_prefix = d.geolocation_zip_code_prefix;

-- Dropping the unnamed column in product_dataset
ALTER TABLE product_dataset DROP COLUMN idx;

-- Setting zipcode_prefix as PK in geolocation_dataset
ALTER TABLE geolocation_dataset ADD PRIMARY KEY (geolocation_zip_code_prefix);

-- Inserting customer_zipcode_prefix that are not present in geolocation_zip_code_prefix
-- into the geolocation_zip_code_prefix
INSERT INTO geolocation_dataset (geolocation_zip_code_prefix, geolocation_city, geolocation_state)
SELECT DISTINCT ON (customer_zip_code_prefix) customer_zip_code_prefix, customer_city, customer_state
FROM customers_dataset
WHERE customer_zip_code_prefix NOT IN (SELECT geolocation_zip_code_prefix FROM geolocation_dataset);

-- Inserting seller_zipcode_prefix that are not present in geolocation_zip_code_prefix
-- into the geolocation_zip_code_prefix
INSERT INTO geolocation_dataset (geolocation_zip_code_prefix, geolocation_city, geolocation_state)
SELECT DISTINCT ON (seller_zip_code_prefix) seller_zip_code_prefix, seller_city, seller_state
FROM sellers_dataset
WHERE seller_zip_code_prefix NOT IN (SELECT geolocation_zip_code_prefix FROM geolocation_dataset);

-- Adding foreign keys to establish relationship between tables
ALTER TABLE customers_dataset ADD CONSTRAINT fk_customer_geolocation FOREIGN KEY (customer_zip_code_prefix) REFERENCES geolocation_dataset (geolocation_zip_code_prefix);
ALTER TABLE sellers_dataset ADD CONSTRAINT fk_seller_geolocation FOREIGN KEY (seller_zip_code_prefix) REFERENCES geolocation_dataset (geolocation_zip_code_prefix);
ALTER TABLE order_items_dataset ADD CONSTRAINT fk_item_seller FOREIGN KEY (seller_id) REFERENCES sellers_dataset (seller_id);
ALTER TABLE order_items_dataset ADD CONSTRAINT fk_item_product FOREIGN KEY (product_id) REFERENCES product_dataset (product_id);
ALTER TABLE order_items_dataset ADD CONSTRAINT fk_item_order FOREIGN KEY (order_id) REFERENCES orders_dataset (order_id);
ALTER TABLE order_payments_dataset ADD CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders_dataset (order_id);
ALTER TABLE order_reviews_dataset ADD CONSTRAINT fk_review_order FOREIGN KEY (order_id) REFERENCES orders_dataset (order_id);
ALTER TABLE orders_dataset ADD CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES customers_dataset (customer_id);






