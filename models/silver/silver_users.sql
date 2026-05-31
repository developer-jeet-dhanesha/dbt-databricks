SELECT 
    id, 
    created_at,
    city,
    state,
    year(birth_date) AS birth_year,
    source AS sales_channel 
FROM {{ ref("bronze_users") }}