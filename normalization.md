# Airbnb Database Normalization

## 1. Unnormalized Form (UNF)
At this stage, all data is stored in a single flat table with redundant and repeating groups.

### Example:
| user_id | name | email | property_name | booking_start | booking_end | payment_method |
|---------|------|-------|----------------|----------------|--------------|----------------|

Issues:
- Redundant user, property, and booking data
- Multiple payment methods in one row

---

## 2. First Normal Form (1NF)
- Eliminate repeating groups
- Ensure atomic columns (no multivalued attributes)

### Transformation:
Split into individual tables:
- `user(user_id, name, email)`
- `property(property_id, name, host_id)`
- `booking(booking_id, property_id, user_id, start_date, end_date)`
- `payment(payment_id, booking_id, method)`

---

## 3. Second Normal Form (2NF)
- Ensure full functional dependency on primary keys
- Remove partial dependencies

### Example Issue:
In a table like:
`booking_detail(booking_id, property_id, user_id, property_location)`

- `property_location` depends only on `property_id` (partial dependency)

### Fix:
Move `property_location` to a separate `property` table

---

## 4. Third Normal Form (3NF)
- Remove transitive dependencies

### Example Issue:
If `user` table contains:
`user(user_id, name, email, city, city_zipcode)`

- `city_zipcode` depends on `city` not directly on `user_id`

### Fix:
Create a `city(city_name, zipcode)` table

---

## ✅ Final Normalized Tables
- `user(user_id, name, email, ...)`
- `property(property_id, host_id, name, location, ...)`
- `booking(booking_id, property_id, user_id, start_date, end_date)`
- `payment(payment_id, booking_id, amount, method)`
- `review(review_id, booking_id, property_id, user_id, rating, comment)`
- `message(message_id, sender_id, recipient_id, body)`

Each table is in **3NF** — no redundancy, no partial or transitive dependencies.
