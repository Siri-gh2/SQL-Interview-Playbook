-- Day 12: ROWS BETWEEN practice schema (MySQL)
-- This script drops and recreates sales.
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    amount DECIMAL(10,2)
);
INSERT INTO sales (sale_id, sale_date, amount) VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 150),
(4, '2026-01-04', 300),
(5, '2026-01-05', 250),
(6, '2026-01-06', 400),
(7, '2026-01-07', 180);

-- Optional Q7 setup: add a region column and assign regions. Run once only.
ALTER TABLE sales ADD COLUMN region VARCHAR(30);
UPDATE sales SET region = CASE
    WHEN sale_id IN (1, 2, 3) THEN 'North'
    WHEN sale_id IN (4, 5) THEN 'South'
    ELSE 'West'
END;
