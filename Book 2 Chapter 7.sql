WITH vehicles_needing_service AS
(
	SELECT v.vehicle_id, v.year_of_car, v.miles_count, to_char(o.date_occured, 'YYYY-MM-DD') date_of_last_change
	FROM vehicles v
	JOIN oilchangelogs o USING(vehicle_id)
	WHERE o.date_occured < '2022-01-01'
)

SELECT vs.vehicle_id, vs.miles_count, s.purchase_date, e.first_name || ' ' || e.last_name seller, c.first_name || ' ' || c.last_name purchaser, c.email
FROM vehicles_needing_service vs
JOIN sales s USING(vehicle_id)
JOIN employees e using(employee_id)
JOIN customers c using(customer_id)
ORDER BY vs.vehicle_id, s.purchase_date DESC

WITH vehicles_needing_service AS
(
	SELECT v.vehicle_id, v.year_of_car, v.miles_count, to_char(o.date_occured, 'YYYY-MM-DD') date_of_last_change
	FROM vehicles v
	JOIN oilchangelogs o using(vehicle_id)
	WHERE o.date_occured < '2022-01-01'
),
last_purchase AS (
	SELECT s.vehicle_id, max(s.purchase_date) purchased
	FROM sales s
	GROUP BY s.vehicle_id
)

SELECT vs.vehicle_id, vs.miles_count, lp.purchased, e.first_name || ' ' || e.last_name seller, c.first_name || ' ' || c.last_name purchaser, c.email
FROM vehicles_needing_service vs
JOIN last_purchase lp using(vehicle_id)
JOIN sales s ON lp.vehicle_id = s.vehicle_id
	AND lp.purchased = s.purchase_date
JOIN employees e using(employee_id)
JOIN customers c USING(customer_id)

WITH top_dealerships AS
(
	SELECT d.dealership_id, d.business_name, count(s.dealership_id) AS total_sales_per_dealership
	FROM sales s
	JOIN dealerships d using(dealership_id)
	GROUP BY d.dealership_id, d.business_name
	ORDER BY total_sales_per_dealership DESC LIMIT 5
),
all_sales_per_employee AS
(
	SELECT s.employee_id, s.dealership_id, count(s.employee_id) AS total
	FROM sales s
	GROUP BY s.employee_id, s.dealership_id
	ORDER BY total DESC
)

SELECT td.dealership_id, td.business_name, aspe.employee_id
FROM top_dealerships td
LEFT JOIN all_sales_per_employee aspe ON td.dealership_id = aspe.dealership_id


