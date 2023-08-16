SELECT d.dealership_id, d.business_name, count(s2.sales_type_id) AS total_sales, count(s2.sales_type_id) FILTER (WHERE s2.sales_type_name ILIKE 'lease') AS total_leased, count(s2.sales_type_id) FILTER (WHERE s2.sales_type_name ILIKE 'purchase') AS total_purchased
FROM dealerships d
LEFT JOIN sales s USING(dealership_id)
LEFT JOIN salestypes s2 USING(sales_type_id)
GROUP BY d.dealership_id

SELECT v.model, count(s.vehicle_id) AS total_leased
FROM vehicletypes v
LEFT JOIN vehicles v2 USING(vehicle_type_id)
LEFT JOIN sales s USING(vehicle_id)
LEFT JOIN salestypes s2 USING(sales_type_id)
WHERE s2.sales_type_name ILIKE 'lease' AND s.sale_returned IS NOT TRUE
GROUP BY v.model
ORDER BY total_leased DESC LIMIT 1

SELECT v.make, e2.employee_type_name, count(s.vehicle_id) AS total_sales
FROM vehicletypes v
LEFT JOIN vehicles v2 USING(vehicle_type_id)
LEFT JOIN sales s USING(vehicle_id)
LEFT JOIN employees e USING(employee_id)
LEFT JOIN employeetypes e2 USING(employee_type_id)
WHERE s.sale_returned IS NOT TRUE
GROUP BY e2.employee_type_name, v.make
ORDER BY total_sales DESC LIMIT 1
