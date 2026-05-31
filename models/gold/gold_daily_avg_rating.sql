SELECT 
    DATE(date_format(R.created_at, "yyyy-MM-dd")) AS review_date, 
    R.product_id,
    P.product_name, 
    AVG(R.rating) AS avg_rating 
FROM {{ ref("bronze_reviews") }} R 
LEFT JOIN {{ ref("silver_products") }} P 
ON R.product_id = P.id 
GROUP BY ALL