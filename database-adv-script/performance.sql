-- Initial complex query (before optimization)
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    u.email,
    p.title AS property_title,
    p.location,
    p.price_per_night,
    pay.amount,
    pay.payment_method,
    pay.status AS payment_status,
    b.check_in_date,
    b.check_out_date,
    b.status AS booking_status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    b.status = 'confirmed'
ORDER BY 
    b.check_in_date DESC;

-- Optimized query (after refactoring)
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    u.email,
    p.title AS property_title,
    p.location,
    p.price_per_night,
    pay.amount,
    pay.payment_method,
    pay.status AS payment_status,
    b.check_in_date,
    b.check_out_date,
    b.status AS booking_status
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.id
INNER JOIN 
    properties p ON b.property_id = p.id
LEFT JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    b.status = 'confirmed'
    AND b.check_in_date >= CURRENT_DATE - INTERVAL '6 months'
ORDER BY 
    b.check_in_date DESC
LIMIT 1000;
