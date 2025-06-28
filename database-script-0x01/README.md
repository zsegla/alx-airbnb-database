# 🧱 Database Schema - Airbnb Clone

This folder contains the SQL definition for the Airbnb booking system.

## 📄 Files

- `schema.sql`: Defines the database structure with tables, constraints, foreign keys, and indexes.

## 💡 Tables

- `users`: Stores user credentials and roles (guest, host, admin).
- `properties`: Listings posted by hosts with details and pricing.
- `bookings`: Tracks user bookings, with date ranges and statuses.
- `payments`: Payment history per booking, with methods and amounts.
- `reviews`: User-submitted ratings and comments for properties.
- `messages`: Direct messages between users.

## 🛠️ Features

- Fully normalized schema (up to 3NF)
- Enforced relationships via foreign keys
- Constraints on emails, roles, and booking statuses
- Performance optimization through indexing

## 📌 Usage

You can run the script using any SQL environment:

```bash
psql -d airbnb_db -f schema.sql
