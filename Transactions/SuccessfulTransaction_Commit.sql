BEGIN;

-- 1. Insert user
INSERT INTO users (email, password_hash, full_name) 
VALUES ('bob@example.com', 'hash123', 'Bob Builder');

-- 2. Insert order for new user (assuming user_id is auto-generated = 2)
INSERT INTO orders (user_id, status) 
VALUES (2, 'pending');

-- 3. Insert product to order
-- Assume product_id 1 exists
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase)
VALUES (2, 1, 1, 45.00);

COMMIT;

-- Validation
SELECT * FROM users WHERE email = 'bob@example.com';
SELECT * FROM orders WHERE user_id = 2;