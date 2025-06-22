SELECT 
    o.order_id,
    u.full_name AS customer_name,
    p.name AS product_name,
    oi.quantity,
    oi.price_at_purchase,
    (oi.quantity * oi.price_at_purchase) AS total_price,
    o.status,
    o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_id = 1;