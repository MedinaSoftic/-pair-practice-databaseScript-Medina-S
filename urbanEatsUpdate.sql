START TRANSACTION;
DROP TABLE IF EXISTS inventory, customers, restaurant_menus, menu_items, restaurants;

-- will display each branch of the resturant with its own id
CREATE TABLE restaurants(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);
-- hold all menu items 
CREATE TABLE menu_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);
-- seperates the menu items from each resturant 
CREATE TABLE restaurant_menus (
    restaurant_id INT,
    menu_item_id INT,
    PRIMARY KEY (restaurant_id, menu_item_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);
-- shows what the customer orders and if they are in the loyalty program 
CREATE TABLE customers(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_item VARCHAR(50)NOT NULL,
    loyalty_program BOOLEAN
);
-- tracks which customers ordered which items at each resturant, we could add more information 
-- to be able to have a set amount of items, not sure how to do the math on that yet. 
CREATE TABLE inventory(
	order_item_id INT NOT NULL,
	restaurant_id INT,
	menu_item_id INT,
	FOREIGN KEY (order_item_id) REFERENCES customers(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);

INSERT INTO restaurants (name) VALUES
("urbanEats_north"),
("urbanEats_south");

INSERT INTO menu_items (name, description) VALUES
("TACOS", "Spicy beef tacos with salsa"),
("PIZZA", "Detroit Style cheese pizza"),
("RAMEN","Creamy chicken miso"),
("SUSHI","Assorted sushi platter"),
("PHO","Extra mint Vitnamese noodle soup");

INSERT INTO restaurant_menus (restaurant_id, menu_item_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(2, 4),
(2, 5);


INSERT INTO customers (order_item, loyalty_program) VALUES
('Tacos', TRUE),
('Pho', FALSE),
('Ramen', TRUE);

INSERT INTO inventory (order_item_id, restaurant_id, menu_item_id) VALUES
(1, 1, 1),
(2, 2, 5),
(3, 2, 4);

COMMIT;
