-- Expect CHECK constraint failure
INSERT INTO products (name, price, stock) 
VALUES ('Faulty Product', -10.00, 10);