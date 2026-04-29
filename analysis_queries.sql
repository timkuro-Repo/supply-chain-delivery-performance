SELECT COUNT(*) AS total_deliveries,
       SUM(late_delivery) AS late_deliveries,
       ROUND(100.0 * SUM(late_delivery) / COUNT(*), 2) AS late_delivery_rate,
       ROUND(AVG(delay_days), 2) AS avg_delay_days
FROM delivery_data;

SELECT carrier,
       COUNT(*) AS deliveries,
       ROUND(100.0 * SUM(late_delivery) / COUNT(*), 2) AS late_delivery_rate,
       ROUND(AVG(delay_days), 2) AS avg_delay_days
FROM delivery_data
GROUP BY carrier
ORDER BY late_delivery_rate DESC;

SELECT region,
       route_type,
       COUNT(*) AS deliveries,
       ROUND(100.0 * SUM(late_delivery) / COUNT(*), 2) AS late_delivery_rate
FROM delivery_data
GROUP BY region, route_type
ORDER BY late_delivery_rate DESC;
