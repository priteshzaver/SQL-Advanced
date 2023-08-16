SELECT last_name, first_name, city, state
FROM customers c
WHERE state = 'TX'

SELECT c.last_name, c.first_name, c.city, c.state
FROM customers c
WHERE c.city = 'Houston' AND state = 'TX'

SELECT c.last_name, c.first_name, c.city, c.state
FROM customers c
WHERE c.state = 'TX' OR c.state = 'TN'

SELECT c.last_name, c.first_name, c.city, c.state
FROM customers c
WHERE c.state IN ('TX', 'TN', 'CA')

SELECT c.last_name, c.first_name, c.city, c.state
FROM customers c
WHERE c.state LIKE 'C%'

SELECT c.last_name, c.first_name
FROM customers c
WHERE LENGTH(c.last_name) > 5 AND LENGTH(c.first_name) <= 7

SELECT c.last_name, c.first_name, c.company_name
FROM customers c
WHERE LENGTH(c.company_name) BETWEEN 10 AND 20

SELECT c.last_name, c.first_name, c.company_name
FROM customers c
WHERE c.company_name IS NULL

//practice
SELECT s.sale_id, s.sales_type_id, s.vehicle_id, s.employee_id, s.customer_id, s.dealership_id, s.price, s.deposit, s.purchase_date, s.pickup_date, s.invoice_number, s.payment_method, s.sale_returned
FROM sales s
LEFT JOIN salestypes s2 ON s2.sales_type_id = s.sales_type_id
WHERE s2.sales_type_name = 'Lease'

SELECT s.sale_id, s.sales_type_id, s.vehicle_id, s.employee_id, s.customer_id, s.dealership_id, s.price, s.deposit, s.purchase_date, s.pickup_date, s.invoice_number, s.payment_method, s.sale_returned
FROM sales s
WHERE s.purchase_date >= '2018-08-08'

SELECT s.sale_id, s.sales_type_id, s.vehicle_id, s.employee_id, s.customer_id, s.dealership_id, s.price, s.deposit, s.purchase_date, s.pickup_date, s.invoice_number, s.payment_method, s.sale_returned
FROM sales s
WHERE s.deposit > 5000 OR s.payment_method ILIKE 'americanexpress'

SELECT e.employee_id, e.first_name, e.last_name, e.email_address, e.phone, e.employee_type_id
FROM employees e
WHERE e.first_name LIKE 'M%' OR e.first_name LIKE '%d'

SELECT e.employee_id, e.first_name, e.last_name, e.email_address, e.phone, e.employee_type_id
FROM employees e
WHERE phone LIKE '604%'







