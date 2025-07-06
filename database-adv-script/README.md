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
```
---
# Airbnb Database – Subqueries

This file contains examples of both non-correlated and correlated subqueries used to analyze Airbnb data.

## 1. Non-Correlated Subquery – Properties with Avg Rating > 4.0

The following query retrieves all properties where the average review rating is greater than 4.0.

```sql
SELECT
    id,
    name
FROM
    properties
WHERE
    id IN (
        SELECT
            property_id
        FROM
            reviews
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );
```
---
# Aggregations and Window Functions

## Objective

This script demonstrates how to analyze Airbnb booking data using SQL aggregation functions and window functions. It includes:

- Counting total bookings per user.
- Ranking properties by the number of bookings they have received.

## File

- **aggregations_and_window_functions.sql**: Contains the SQL queries for aggregation and ranking.

## SQL Concepts Used

### 1. Aggregation with `GROUP BY` and `COUNT`

We calculate how many bookings each user has made by grouping data based on `user_id`.

```sql
SELECT
    user_id,
    COUNT(*) AS total_bookings
FROM
    bookings
GROUP BY
    user_id;
```
