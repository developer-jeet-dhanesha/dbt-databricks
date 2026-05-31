SELECT
    O.order_date,
    P.product_name, 
    P.category,
    P.vendor,
    U.city,
    U.state, 
    U.sales_channel, 
    SUM(O.order_amount) AS total_revenue
FROM {{ ref("silver_orders") }} O 
LEFT JOIN {{ ref("silver_products") }} P 
ON O.product_id = P.id 
LEFT JOIN {{ ref("silver_users") }} U 
ON O.user_id = U.id
GROUP BY ALL