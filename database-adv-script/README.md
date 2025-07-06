# Airbnb Database – Join Queries

This file contains SQL scripts that demonstrate the use of different types of SQL joins in the context of an Airbnb-like database.

## Objectives

- Practice complex SQL queries using JOINs.
- Understand the difference between INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- Apply these concepts to real-world scenarios involving bookings, users, properties, and reviews.

## Queries

### 1. INNER JOIN – Bookings and Users

Retrieves all bookings along with the details of the users who made them.

```sql
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
