-- Total number of bookings made by each user
SELECT
    user_id,
    COUNT(*) AS total_bookings
FROM
    bookings
GROUP BY
    user_id;

-- Rank properties based on total number of bookings
WITH property_bookings AS (
    SELECT
        property_id,
        COUNT(*) AS booking_count
    FROM
        bookings
    GROUP BY
        property_id
)
SELECT
    property_id,
    booking_count,
    RANK() OVER (ORDER BY booking_count DESC) AS property_rank
FROM
    property_bookings;
