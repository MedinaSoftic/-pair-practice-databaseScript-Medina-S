START TRANSACTION;
DROP TABLE IF EXISTS customers, inventory;
DROP TABLE IF EXISTS urbanEats_north, urbanEats_south;

CREATE TABLE urbanEats_north(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    menu_item VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE urbanEats_south(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    menu_item VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE customers(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    menu_item_id INT,
    FOREIGN KEY (menu_item_id) REFERENCES urbanEats_north(id),
    FOREIGN KEY (menu_item_id) REFERENCES urbanEats_south(id),
    loyalty_program BOOLEAN 
);

CREATE TABLE inventory(
menu_item_id INT,
order VARCHAR(50)
FOREIGN KEY (menu_item_id) REFERENCES urbanEats_north(id),
FOREIGN KEY (menu_item_id) REFERENCES urbanEats_south(id)
);

INSERT INTO urbanEats_north (menu_item) VALUES
("TACOS"),
("PIZZA"),
("SUSHI");

INSERT INTO urbanEats_south (menu_item) VALUES
("RAMEN"),
("SUSHI"),
("PHO");

INSERT INTO customers 


INSERT INTO inventory

ROLLBACK;