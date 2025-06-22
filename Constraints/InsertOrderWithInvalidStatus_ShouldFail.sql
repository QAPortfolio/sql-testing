-- Expect CHECK constraint failure
INSERT INTO orders (user_id, status) 
VALUES (1, 'unknown_status');