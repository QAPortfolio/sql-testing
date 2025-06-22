-- Expect UNIQUE violation
INSERT INTO users (email, password_hash) 
VALUES ('testuser@example.com', 'another_hash');