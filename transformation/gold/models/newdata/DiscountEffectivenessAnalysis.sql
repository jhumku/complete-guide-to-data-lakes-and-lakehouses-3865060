{% set nessie_branch = var('nessie_branch', 'main') %}
SELECT 
    Total_Discounts,
    AVG(Premium_Amount) AS Avg_Premium_After_Discounts,
    COUNT(*) AS Policy_Count
FROM {{ source('silver', 'data') }} AT branch {{ nessie_branch }}
GROUP BY Total_Discounts;
