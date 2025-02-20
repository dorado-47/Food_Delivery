create database food_delivery;

use food_delivery;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20)
);

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20),
    cuisine_type VARCHAR(50),
    rating DECIMAL(2, 1)
);

CREATE TABLE Dishes (
    dish_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    rating DECIMAL(2, 1),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    restaurant_id INT,
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(50),
    order_date TIMESTAMP,
    estimated_delivery_time TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    dish_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (dish_id) REFERENCES Dishes(dish_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    restaurant_id INT,
    dish_id INT,
    rating DECIMAL(2, 1),
    comments TEXT,
    review_date TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (dish_id) REFERENCES Dishes(dish_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Inserting users
INSERT INTO Users (username, email, password, address, phone_number) 
VALUES 
('michael_jones', 'michael.jones@example.com', 'mike1234', '789 Birch Lane, Springfield', '555-234-5678'),
('susan_brown', 'susan.brown@example.com', 'brownpass', '321 Maple Drive, Rivertown', '555-987-6543'),
('emily_wilson', 'emily.wilson@example.com', 'emilypass2025', '654 Pine Street, Oakwood', '555-321-8765'),
('david_martin', 'david.martin@example.com', 'davemart2025', '101 Cedar Avenue, Greenfield', '555-654-4321'),
('olivia_white', 'olivia.white@example.com', 'olivia123', '202 Willow Boulevard, Brooktown', '555-765-3210');


-- Inserting restaurants
INSERT INTO Restaurants (name, address, phone_number, cuisine_type, rating) 
VALUES 
('Sushi World', '202 Ocean Avenue, Seaside City', '123-555-1122', 'Japanese', 4.7),
('Taco Fiesta', '303 Sunset Boulevard, Beach Town', '123-555-2233', 'Mexican', 4.6),
('Pasta Express', '404 Oak Street, Downtown', '123-555-3344', 'Italian', 4.4),
('Steakhouse Prime', '505 Highland Road, Hilltop', '123-555-4455', 'Steakhouse', 4.8),
('Veggie Delight', '606 Green Way, Urban Area', '123-555-5566', 'Vegetarian', 4.3);


-- Inserting dishes
INSERT INTO Dishes (restaurant_id, name, description, price, rating) 
VALUES 
(1, 'Margherita Pizza', 'Classic pizza with tomatoes, mozzarella, and basil.', 12.99, 4.7),
(1, 'Pepperoni Pizza', 'Pizza topped with pepperoni slices and cheese.', 14.99, 4.5),
(2, 'Cheeseburger', 'Juicy beef patty with melted cheese and pickles.', 10.99, 4.3),
(2, 'Veggie Burger', 'A vegetarian patty with lettuce, tomato, and sauce.', 11.49, 4.1),
(2, 'SWeet Corn PIzza', 'A sweeet bread with peri peri suace.', 12.34, 4.8);

-- Inserting orders
INSERT INTO Orders (user_id, restaurant_id, total_amount, order_status, order_date, estimated_delivery_time) 
VALUES 
(3, 3, 45.50, 'Delivered', '2025-02-20 14:00:00', '2025-02-20 14:45:00'),
(4, 4, 60.75, 'Cancelled', '2025-02-20 14:30:00', '2025-02-20 15:15:00'),
(5, 5, 35.00, 'Pending', '2025-02-20 15:00:00', '2025-02-20 15:45:00'),
(1, 3, 19.99, 'Delivered', '2025-02-20 16:00:00', '2025-02-20 16:45:00'),
(2, 4, 80.25, 'Pending', '2025-02-20 17:00:00', '2025-02-20 17:45:00');


-- Inserting order items
INSERT INTO Order_Items (order_id, dish_id, quantity, price) 
VALUES 
(1, 1, 1, 12.99),
(1, 2, 1, 14.99),
(2, 3, 1, 10.99),
(2, 4, 1, 11.49),
(2, 5, 1, 17.99);

-- Inserting reviews
INSERT INTO Reviews (user_id, restaurant_id, dish_id, rating, comments, review_date) 
VALUES 
(3, 3, 1, 4.5, 'Delicious sushi, fresh and flavorful!', '2025-02-20 15:00:00'),
(4, 4, 2, 3.5, 'The steak was overcooked, but the sides were great.', '2025-02-20 15:30:00'),
(5, 5, 4, 4.8, 'Fantastic vegetarian options, highly recommend the quinoa bowl.', '2025-02-20 16:00:00'),
(1, 2, 3, 4.0, 'The burger was juicy, but the fries were too soggy.', '2025-02-20 16:30:00'),
(2, 5, 5, 5.0, 'Incredible vegan options, I loved the cauliflower wings!', '2025-02-20 17:00:00');


-- Inserting payments
INSERT INTO Payments (order_id, payment_method, payment_status, payment_date) 
VALUES 
(3, 'Credit Card', 'Completed', '2025-02-20 14:45:00'),
(4, 'Debit Card', 'Failed', '2025-02-20 15:00:00'),
(5, 'PayPal', 'Pending', '2025-02-20 15:30:00'),
(6, 'Credit Card', 'Completed', '2025-02-20 16:00:00'),
(7, 'Bank Transfer', 'Completed', '2025-02-20 17:15:00');



-- Select all users
SELECT * FROM Users;

-- Select all restaurants
SELECT * FROM Restaurants;

-- Select all dishes
SELECT * FROM Dishes;

-- Select all orders
SELECT * FROM Orders;

-- Select all order items
SELECT * FROM Order_Items;

-- Select all reviews
SELECT * FROM Reviews;

-- Select all payments
SELECT * FROM Payments;


