EXPLAIN ANALYZE
SELECT o.order_id, u.full_name
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE u.email = 'example@example.com';