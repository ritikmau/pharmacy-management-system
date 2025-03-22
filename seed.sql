-- seed.sql
-- here are the inputs for the db 


USE pharmacy_db;

-- Inserting sample categories
INSERT INTO categories (name) VALUES ('Antibiotics'), ('Pain Relievers'), ('Vitamins');

-- Inserting sample suppliers
INSERT INTO suppliers (name, contact, address) VALUES 
('HealthSuppliers Inc.', '123-456-7890', '123 Supplier St, CityA'),
('PharmaPlus', '987-654-3210', '456 Distributor Ave, CityB');

-- Inserting sample users
INSERT INTO users (email, password, full_name, role, phone, address, region)
VALUES 
('john.doe@gmail.com', 'hashedpassword1', 'John Doe', 'customer', '1112223333', '123 Main St, North City', 'North'),
('jane.smith@hotmail.com', 'hashedpassword2', 'Jane Smith', 'customer', '4445556666', '456 Side St, South City', 'South'),
('pharma.user@yahoo.com', 'hashedpassword3', 'Pharma User', 'pharmacist', '7778889999', '789 Pharma Rd, East City', 'East');

-- Inserting sample medicines
INSERT INTO medicines (name, category_id, price, stock, supplier_id, expiry_date)
VALUES 
('Amoxicillin', 1, 12.99, 100, 1, '2026-12-31'),
('Ibuprofen', 2, 8.99, 200, 2, '2025-06-30'),
('Vitamin C', 3, 5.49, 150, 1, '2024-11-30');

-- Inserting sample orders
INSERT INTO orders (customer_id, status, total_amount)
VALUES 
(1, 'delivered', 25.98), 
(2, 'delivered', 17.98),
(1, 'pending', 5.49);

-- Inserting sample order items
INSERT INTO order_items (order_id, medicine_id, quantity, price)
VALUES 
(1, 1, 2, 12.99),   -- John Doe ordered 2 Amoxicillin
(2, 2, 2, 8.99),    -- Jane Smith ordered 2 Ibuprofen
(3, 3, 1, 5.49);    -- John Doe ordered 1 Vitamin C

-- Inserting sample payments
INSERT INTO payments (order_id, payment_method, amount, status)
VALUES 
(1, 'credit_card', 25.98, 'completed'),
(2, 'paypal', 17.98, 'completed'),
(3, 'cash', 5.49, 'pending');
