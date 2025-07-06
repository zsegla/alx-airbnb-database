-- Indexes for Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Indexes for Properties table
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);
CREATE INDEX idx_properties_created_at ON properties(created_at);

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Composite indexes for common query patterns
CREATE INDEX idx_bookings_user_property ON bookings(user_id, property_id);
CREATE INDEX idx_properties_location_price ON properties(location, price);

-- Performance measurement examples
-- Example 1: Property search query
EXPLAIN ANALYZE
SELECT p.* FROM properties p
WHERE p.location = 'Paris' AND p.price < 200;

-- Example 2: User booking history
EXPLAIN ANALYZE
SELECT b.* FROM bookings b
WHERE b.user_id = 123 AND b.status = 'confirmed';

-- Example 3: Host property performance
EXPLAIN ANALYZE
SELECT p.id, p.title, COUNT(b.id) as booking_count
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
WHERE p.host_id = 456
GROUP BY p.id;
