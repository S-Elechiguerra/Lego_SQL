-- Creación de la base de datos
CREATE DATABASE lego_inventory;
USE lego_inventory;
-- Tabla themes
CREATE TABLE themes (
    id INT PRIMARY KEY,
    themes_name VARCHAR(255),
    parent_id INT
);
-- Tabla sets
CREATE TABLE sets (
    set_num VARCHAR(50) PRIMARY KEY,
    sets_name VARCHAR(255),
    published_year INT,
    theme_id INT,
    num_parts INT,
    FOREIGN KEY (theme_id) REFERENCES themes(id)
);
-- Tabla part_categories
CREATE TABLE part_categories (
    id INT PRIMARY KEY,
    part_categories_name VARCHAR(255)
);
-- Tabla parts
CREATE TABLE parts (
    part_num VARCHAR(50) PRIMARY KEY,
    parts_name VARCHAR(255),
    part_cat_id INT,
    FOREIGN KEY (part_cat_id) REFERENCES part_categories(id)
);
-- Tabla colors
CREATE TABLE colors (
    id INT PRIMARY KEY,
    colors_name VARCHAR(255),
    rgb VARCHAR(6),
    is_trans BOOLEAN
);
-- Tabla inventories
CREATE TABLE inventories (
    id INT PRIMARY KEY,
    inventories_version INT,
    set_num VARCHAR(50),
    FOREIGN KEY (set_num) REFERENCES sets(set_num)
);
-- Tabla inventory_sets
CREATE TABLE inventory_sets (
	id INT AUTO_INCREMENT PRIMARY KEY,
    inventory_id INT,
    set_num VARCHAR(50),
    quantity INT,
    FOREIGN KEY (inventory_id) REFERENCES inventories(id),
    FOREIGN KEY (set_num) REFERENCES sets(set_num)
);
-- Tabla inventory_parts
CREATE TABLE inventory_parts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    inventory_id INT,
    part_num VARCHAR(50),
    color_id INT,
    quantity INT,
    is_spare BOOLEAN,
    FOREIGN KEY (inventory_id) REFERENCES inventories(id),
    FOREIGN KEY (part_num) REFERENCES parts(part_num),
    FOREIGN KEY (color_id) REFERENCES colors(id)
);