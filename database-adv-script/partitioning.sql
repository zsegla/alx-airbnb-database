-- 1. Create partitioned table structure
CREATE TABLE bookings_partitioned (
    id SERIAL,
    user_id INTEGER NOT NULL,
    property_id INTEGER NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id, check_in_date)
) PARTITION BY RANGE (check_in_date);

-- 2. Create partitions by year
CREATE TABLE bookings_y2020 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');

CREATE TABLE bookings_y2021 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');

CREATE TABLE bookings_y2022 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_y2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_y2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_future PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);

-- 3. Migrate data from original table
INSERT INTO bookings_partitioned
SELECT * FROM bookings;

-- 4. Create indexes on partitioned table
CREATE INDEX idx_partitioned_user_id ON bookings_partitioned(user_id);
CREATE INDEX idx_partitioned_property_id ON bookings_partitioned(property_id);
CREATE INDEX idx_partitioned_status ON bookings_partitioned(status);

-- 5. Test query performance on partitioned table
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE check_in_date BETWEEN '2023-06-01' AND '2023-12-31'
AND status = 'confirmed';

-- Compare with original table
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE check_in_date BETWEEN '2023-06-01' AND '2023-12-31'
AND status = 'confirmed';
