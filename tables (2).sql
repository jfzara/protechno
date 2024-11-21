CREATE TABLE utilisateur (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DOUBLE,
    image_url VARCHAR(255),
    category_id BIGINT,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE produit (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(255) NOT NULL,
    price DOUBLE,
    image_url VARCHAR(255)
);

CREATE TABLE categorie (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE commande (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT,
    utilisateur_id BIGINT,
    quantity INT,
    date DATE,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
);

INSERT INTO utilisateur (username, password, email) 
VALUES ('client1', 'password123', 'client1@example.com'),
       ('client2', 'password123', 'client2@example.com'),
       ('admin', 'password123', 'admin@example.com');
       
       
INSERT INTO produit (name, description, category, price, image_url) 
VALUES 
('Accesoire1', 'Xxxxxoooooo', 'Accessoire', 10.99, 'accessoire1.jpg'),
('Accesoire2', 'Xxxxxoooooo', 'Accessoire', 20.99, 'accessoire2.jpg'),
('Accesoire3', 'Xxxxxoooooo', 'Accessoire', 30.99, 'accessoire3.jpg'),
('Accesoire4', 'Xxxxxoooooo', 'Accessoire', 35.99, 'accessoire4.jpg'),
('Accesoire5', 'Xxxxxoooooo', 'Accessoire', 40.99, 'accessoire5.jpg'),
('Laptop1', 'Xxxxxoooooo', 'Laptop', 50.99, 'laptop1.jpg'),
('Laptop2', 'Xxxxxoooooo', 'Laptop', 60.99, 'laptop2.jpg'),
('Laptop3', 'Xxxxxoooooo', 'Laptop', 70.99, 'laptop3.jpg'),
('Laptop4', 'Xxxxxoooooo', 'Laptop', 80.99, 'laptop4.jpg'),
('Laptop5', 'Xxxxxoooooo', 'Laptop', 80.99, 'laptop5.jpg'),
('Cellphone1', 'Xxxxxoooooo', 'Cellphone', 100.99, 'cellphone1.jpg'),
('Cellphone2', 'Xxxxxoooooo', 'Cellphone', 110.99, 'cellphone2.jpg'),
('Cellphone3', 'Xxxxxoooooo', 'Cellphone', 120.99, 'cellphone3.jpg'),
('Cellphone4', 'Xxxxxoooooo', 'Cellphone', 130.99, 'cellphone4.jpg'),
('Cellphone5', 'Xxxxxoooooo', 'Cellphone', 140.99, 'cellphone5.jpg'),
('Cellphone6', 'Xxxxxoooooo', 'Cellphone', 150.99, 'cellphone6.jpg');

-- Insertion des catégories
INSERT INTO categorie (name, description) 
VALUES 
('Accessoire', 'DescriptionAccessoire'),
('Laptop', 'DescriptionLaptop'),
('Cellphone', 'DescriptionCellphone');

INSERT INTO category (name, description) 
VALUES 
('Accessoire', 'DescriptionAccessoire'),
('Laptop', 'DescriptionLaptop'),
('Cellphone', 'DescriptionCellphone');

-- Insertion des produits
INSERT INTO product (name, description, price, image_url, category_id) 
VALUES 
('Accesoire1', 'Xxxxxoooooo', 10.99, 'accessoire1.jpg', 1),
('Accesoire2', 'Xxxxxoooooo', 20.99, 'accessoire2.jpg', 1),
('Accesoire3', 'Xxxxxoooooo', 30.99, 'accessoire3.jpg', 1),
('Accesoire4', 'Xxxxxoooooo', 35.99, 'accessoire4.jpg', 1),
('Accesoire5', 'Xxxxxoooooo', 40.99, 'accessoire5.jpg', 1),
('Laptop1', 'Xxxxxoooooo', 50.99, 'laptop1.jpg', 2),
('Laptop2', 'Xxxxxoooooo', 60.99, 'laptop2.jpg', 2),
('Laptop3', 'Xxxxxoooooo', 70.99, 'laptop3.jpg', 2),
('Laptop4', 'Xxxxxoooooo', 80.99, 'laptop4.jpg', 2),
('Laptop5', 'Xxxxxoooooo', 80.99, 'laptop5.jpg', 2),
('Cellphone1', 'Xxxxxoooooo', 100.99, 'cellphone1.jpg', 3),
('Cellphone2', 'Xxxxxoooooo', 110.99, 'cellphone2.jpg', 3),
('Cellphone3', 'Xxxxxoooooo', 120.99, 'cellphone3.jpg', 3),
('Cellphone4', 'Xxxxxoooooo', 130.99, 'cellphone4.jpg', 3),
('Cellphone5', 'Xxxxxoooooo', 140.99, 'cellphone5.jpg', 3),
('Cellphone6', 'Xxxxxoooooo', 150.99, 'cellphone6.jpg', 3);

INSERT INTO commande (product_id, utilisateur_id, quantity, date) 
VALUES 
(1, 1, 2, '2023-10-01'),
(2, 2, 1, '2023-10-02'),
(10, 1, 3, '2023-10-03'),
(7, 2, 1, '2023-10-04'),
(5, 2, 2, '2023-10-05');