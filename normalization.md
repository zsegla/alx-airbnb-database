# 📊 Normalization Process (Up to 3NF)

This document explains how the Airbnb-like database schema was designed to adhere to database normalization rules up to the **Third Normal Form (3NF)**. The goal is to minimize redundancy, improve data integrity, and ensure efficiency.

---

## 🧱 First Normal Form (1NF)
**Rule:**  
- Each table has a primary key.
- Each column contains atomic (indivisible) values.
- There are no repeating groups.

**✔ Applied Fixes:**  
- Contact info (email, phone number) stored in individual fields.
- Dates (start_date, end_date) are separated.
- No lists, arrays, or nested data types used.

✅ All tables satisfy 1NF.

---

## 🔁 Second Normal Form (2NF)
**Rule:**  
- Must satisfy 1NF.
- All non-key attributes must be fully functionally dependent on the entire primary key (no partial dependency).

**✔ Applied Fixes:**  
- All primary keys are single-column UUIDs.
- Attributes such as `first_name`, `location`, and `price_per_night` depend entirely on their table's primary key.

✅ All tables satisfy 2NF.

---

## 🔗 Third Normal Form (3NF)
**Rule:**  
- Must satisfy 2NF.
- No transitive dependencies (i.e., non-key attributes must not depend on other non-key attributes).

**✔ Applied Fixes:**  
- No non-key attributes depend on other non-key attributes.
- All fields depend directly on the primary key (e.g., `role`, `description`, `payment_method`).

✅ All tables satisfy 3NF.

---

## ✅ Summary

| Table      | 1NF | 2NF | 3NF |
|------------|-----|-----|-----|
| Users      | ✅  | ✅  | ✅  |
| Properties | ✅  | ✅  | ✅  |
| Bookings   | ✅  | ✅  | ✅  |
| Payments   | ✅  | ✅  | ✅  |
| Reviews    | ✅  | ✅  | ✅  |
| Messages   | ✅  | ✅  | ✅  |

All entities in the system are fully normalized up to **Third Normal Form (3NF)**.
