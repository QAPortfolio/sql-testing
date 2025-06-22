-- Insert user
INSERT INTO users (email, password_hash, full_name) 
VALUES ('alice@example.com', 'hash', 'Alice Smith') RETURNING user_id;

-- Insert product
INSERT INTO products (name, price, stock) 
VALUES ('Keyboard', 45.00, 10) RETURNING product_id;

-- Create order for user_id = 1
INSERT INTO orders (user_id, status) 
VALUES (1, 'pending') RETURNING order_id;

-- Add order item for order_id = 1, product_id = 1
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) 
VALUES (1, 1, 2, 45.00);