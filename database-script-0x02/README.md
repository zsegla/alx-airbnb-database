# 🌱 Seed Data - Airbnb Clone

This directory contains the SQL seed script for populating the Airbnb database with example data.

## 📄 Files

- `seed.sql`: Inserts realistic test data into all relevant tables:
  - `users`
  - `properties`
  - `bookings`
  - `payments`
  - `reviews`
  - `messages`

## 🧪 Sample Scenarios Included

- Guest booking two different properties
- Payment through credit card and PayPal
- User-submitted property reviews
- Messaging between guest and host

## 🚀 Usage

After creating the database using `schema.sql`, run:

```bash
psql -d airbnb_db -f seed.sql
