
USE `alx_airbnb`;

-- Insert Users
INSERT INTO user (first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('James', 'Kariuki', 'james@example.com', 'hashed_pass1', '0712345678', 'guest'),
('Alice', 'Wanjiku', 'alice@example.com', 'hashed_pass2', '0723456789', 'host'),
('Admin', 'User', 'admin@example.com', 'hashed_admin', '0700000000', 'admin');

-- Insert Properties
INSERT INTO property (host_id, name, description, location, pricepernight)
VALUES 
(2, 'Cozy Studio in Nairobi', 'A quiet and fully furnished studio apartment.', 'Nairobi, Kenya', 35.00),
(2, 'Beach House Mombasa', 'Spacious beach house with ocean view.', 'Mombasa, Kenya', 120.00);

-- Insert Bookings
INSERT INTO booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES 
(1, 1, '2025-08-01', '2025-08-05', 140.00, 'confirmed'),
(2, 1, '2025-12-20', '2025-12-25', 600.00, 'pending');

-- Insert Payments
INSERT INTO payment (booking_id, amount, payment_method)
VALUES 
(1, 140.00, 'credit_card'),
(2, 600.00, 'paypal');

-- Insert Reviews
INSERT INTO review (booking_id, user_id, property_id, rating, comment)
VALUES 
(1, 1, 1, 5, 'Amazing experience! Very clean and cozy.'),
(2, 1, 2, 4, 'Great location but noisy at night.');

-- Insert Messages
INSERT INTO message (sender_id, recipient_id, message_body)
VALUES 
(1, 2, 'Hi Alice, I have a question about the beach house.'),
(2, 1, 'Sure, feel free to ask anything!');
