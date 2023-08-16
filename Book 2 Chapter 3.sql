SELECT s.sale_id, s.sales_type_id, s.vehicle_id, s.employee_id, s.customer_id, s.dealership_id, s.price, s.deposit, s.purchase_date, s.pickup_date, s.invoice_number, s.payment_method, s.sale_returned, s2.sales_type_name
FROM sales s
JOIN salestypes s2 ON s.sales_type_id = s2.sales_type_id

SELECT s.sale_id, s.sales_type_id, s.vehicle_id, s.employee_id, s.customer_id, s.dealership_id, s.price, s.deposit, s.purchase_date, s.pickup_date, s.invoice_number, s.payment_method, s.sale_returned, c.first_name, c.last_name, e.first_name, e.last_name, d.business_name, d.city, d.state
FROM sales s
LEFT JOIN customers c ON s.customer_id = c.customer_id
LEFT JOIN employees e ON s.employee_id = e.employee_id
LEFT JOIN dealerships d ON s.dealership_id = d.dealership_id

SELECT d.dealership_id, d.business_name, d.phone, d.city, d.state, d.website, d.tax_id, e.employee_id, e.first_name, e.last_name, e.email_address, e.phone, e.employee_type_id
FROM dealerships d
LEFT JOIN dealershipemployees d2 ON d.dealership_id = d2.dealership_id
LEFT JOIN employees e ON d2.employee_id = e.employee_id

SELECT v.vehicle_id, v.exterior_color, v2.body_type, v2.make, v2.model
FROM vehicles v
LEFT JOIN vehicletypes v2 ON v.vehicle_type_id = v2.vehicle_type_id