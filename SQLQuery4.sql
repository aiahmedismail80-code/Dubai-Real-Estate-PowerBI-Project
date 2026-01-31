SELECT 
    p.location,
    COUNT(s.sale_id) AS total_sales,
    SUM(p.price) AS total_revenue
FROM sales s
JOIN properties p ON s.property_id = p.property_id
GROUP BY p.location
ORDER BY total_revenue DESC;

SELECT 
    YEAR(s.sale_date) AS sale_year,
    MONTH(s.sale_date) AS sale_month,
    SUM(p.price) AS monthly_revenue
FROM sales s
JOIN properties p ON s.property_id = p.property_id
GROUP BY YEAR(s.sale_date), MONTH(s.sale_date)
ORDER BY sale_year, sale_month;

SELECT 
    a.agent_name,
    COUNT(s.sale_id) AS total_deals,
    SUM(p.price) AS total_revenue
FROM sales s
JOIN agents a ON s.agent_id = a.agent_id
JOIN properties p ON s.property_id = p.property_id
GROUP BY a.agent_name
ORDER BY total_revenue DESC;


SELECT 
    property_type,
    AVG(price) AS avg_price
FROM properties
GROUP BY property_type;


SELECT 
    c.nationality,
    COUNT(s.sale_id) AS deals,
    SUM(p.price) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN properties p ON s.property_id = p.property_id
GROUP BY c.nationality
ORDER BY revenue DESC;

SELECT 
    p.location,
    SUM(p.price) AS revenue,
    RANK() OVER (ORDER BY SUM(p.price) DESC) AS location_rank
FROM sales s
JOIN properties p ON s.property_id = p.property_id
GROUP BY p.location;