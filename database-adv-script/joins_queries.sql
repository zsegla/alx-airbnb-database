-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email
FROM
    bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT
    properties.id,
    properties.name,
    reviews.id,
    reviews.rating,
    reviews.comment
FROM
    properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- FULL OUTER JOIN (simulated with UNION): Retrieve all users and all bookings, even if not linked
SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM
    users u
LEFT JOIN bookings b ON u.id = b.user_id

UNION

SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM
    users u
RIGHT JOIN bookings b ON u.id = b.user_id;
