-- Day 08: Date Functions — MySQL schema and sample data
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    delivery_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_name, order_date, delivery_date, amount)
VALUES
(1, 'Siri',  '2026-01-10', '2026-01-15', 5000.00),
(2, 'Rahul', '2026-02-05', '2026-02-12', 3000.00),
(3, 'Priya', '2026-03-15', '2026-03-20', 7000.00),
(4, 'Anu',   '2025-12-20', '2025-12-28', 2500.00),
(5, 'Neha',  '2026-04-01', '2026-04-10', 4500.00),
(6, 'Kiran', '2025-11-11', '2025-11-16', 6000.00),
(7, 'Ravi',  '2026-05-25', '2026-06-02', 8000.00),
(8, 'Meera', '2026-06-10', '2026-06-15', 3500.00);

SELECT * FROM orders;
