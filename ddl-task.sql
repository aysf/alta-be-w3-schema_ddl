DROP DATABASE IF EXISTS alta_online_shop; -- reset
CREATE DATABASE IF NOT EXISTS alta_online_shop; -- answer 1
USE alta_online_shop;
CREATE TABLE users (
	id int NOT NULL AUTO_INCREMENT,
    username varchar(26) NOT NULL,
    birthday DATETIME NOT NULL,
    address varchar(225) NOT NULL,
    gender char(10) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    PRIMARY KEY(id)
    ); -- answer 2.a
CREATE TABLE operators (
	id int NOT NULL auto_increment,
    short_name char(2) NOT NULL,
    name VARCHAR(26) NOT NULL,
    PRIMARY KEY(id)
); -- answer 2.b
CREATE TABLE product_type (
	id int NOT NULL auto_increment,
    name varchar(225) NOT NULL,
    primary key(id)
); -- answer 2.b
CREATE TABLE product (
	id int NOT NULL AUTO_INCREMENT,
    product_type_id int NOT NULL,
    operators_id int NOT NULL,
    product_description varchar(225),
    PRIMARY KEY(id),
    FOREIGN KEY(operators_id) REFERENCES operators(id),
    FOREIGN KEY(product_type_id) REFERENCES product_type(id)
    ); -- answer 2.b
CREATE TABLE transactions (
	id int NOT NULL AUTO_INCREMENT,
    user_id int NOT NULL,
    transaction_date datetime NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    UNIQUE (user_id, transaction_date)
); -- answer 2.c
CREATE TABLE payment_methods (
	id int NOT NULL UNIQUE AUTO_INCREMENT,
    payment_name VARCHAR(26) NOT NULL,
    PRIMARY KEY (id)
); -- answer 2.b
CREATE TABLE detail_transaction (
	id int NOT NULL UNIQUE AUTO_INCREMENT, 
    transaction_id int NOT NULL,
	product_id int NOT NULL,
    status_transaction varchar(10) NOT NULL,
    payment_methods int NOT NULL,
    price int,
    qty int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (transaction_id) REFERENCES transactions(id),
	FOREIGN KEY (payment_methods) REFERENCES payment_methods(id)
    -- FOREIGN KEY(product_id) REFERENCES product(id)
); -- answer 2.c
ALTER TABLE detail_transaction ADD CONSTRAINT detail_transaction_fk3
FOREIGN KEY (product_id) REFERENCES product(id)
ON DELETE CASCADE;
CREATE TABLE kurir (
	id int PRIMARY KEY,
    name varchar(26) NOT NULL,
    created_at datetime,
    update_at datetime
); -- answer 3
ALTER TABLE kurir ADD COLUMN ongkos_dasar int; -- answer 4
RENAME TABLE kurir TO shipping; -- answer 5
DROP TABLE shipping; -- answer 6
CREATE TABLE payment_method_description (
    id int PRIMARY KEY,
    payment_description VARCHAR(225),
    payment_method_id INT,
    UNIQUE KEY (payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id)
); -- 1-1 relationship (pk-unique fk contraint )

CREATE TABLE user_address (
    id int PRIMARY KEY,
    user_address VARCHAR(225),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
); -- 1-M relationship (pk-fk relationship)

CREATE TABLE carts (
    user_id INT,
    product_id INT,
    quatity INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    PRIMARY KEY (user_id, product_id) 
);