-- Test Case 1: Valid user + invalid order status
BEGIN;

-- Insert user 
INSERT INTO users (email, password_hash, full_name) 
VALUES ('validuser@example.com', 'pass', 'Valid User');

-- Insert order with invalid status (assuming user_id is auto-generated = 3)
INSERT INTO orders (user_id, status) 
VALUES (3, 'unknown_status');

COMMIT;

-- Validation
-- Should return 0 rows
SELECT * FROM users WHERE email = 'validuser@example.com';
SELECT * FROM orders WHERE user_id = 3;


-- Test Case 2: Invalid user + valid order status 
BEGIN;

-- Insert invalid user
INSERT INTO users (email, password_hash, full_name) 
VALUES ('failuser@example.com', 'badpass', 'Fail User');

-- Insert order with valid status
INSERT INTO orders (user_id, status) 
VALUES (3, 'pending');

COMMIT;

-- Validation
-- Should return 0 rows
SELECT * FROM users WHERE email = 'failuser@example.com';
SELECT * FROM orders WHERE user_id = 3;


-- Test Case 3: Test with Explicit ROLLBACK

BEGIN;

-- Insert user
INSERT INTO users (email, password_hash, full_name) 
VALUES ('tempuser@example.com', 'temp', 'Temp User');

-- Intentionally rollback
ROLLBACK;

-- Validation
-- Should return 0 rows
SELECT * FROM users WHERE email = 'tempuser@example.com';