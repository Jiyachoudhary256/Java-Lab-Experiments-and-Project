CREATE DATABASE IF NOT EXISTS shopsphere
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shopsphere;

CREATE TABLE IF NOT EXISTS products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(120) NOT NULL,
  description VARCHAR(500) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(80) NOT NULL,
  image_url VARCHAR(500) DEFAULT NULL,
  stock INT NOT NULL DEFAULT 10
);

INSERT INTO products (name, description, price, category, image_url, stock)
SELECT 'Classic Sneakers', 'Everyday sneakers with a clean, comfortable design.', 1499.00, 'Footwear', NULL, 20
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Classic Sneakers');
INSERT INTO products (name, description, price, category, image_url, stock)
SELECT 'Wireless Headphones', 'Wireless headphones for music and online classes.', 2199.00, 'Electronics', NULL, 15
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Wireless Headphones');
INSERT INTO products (name, description, price, category, image_url, stock)
SELECT 'Campus Backpack', 'A practical backpack for college and everyday use.', 999.00, 'Accessories', NULL, 25
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Campus Backpack');
INSERT INTO products (name, description, price, category, image_url, stock)
SELECT 'Minimal Watch', 'A minimal everyday watch design.', 1799.00, 'Accessories', NULL, 12
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Minimal Watch');
