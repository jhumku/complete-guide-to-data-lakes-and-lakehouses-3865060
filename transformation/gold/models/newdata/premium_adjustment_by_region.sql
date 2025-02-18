
{% set nessie_branch = var('nessie_branch', 'main') %}

SELECT
    v.Region, 
    AVG(v.Premium_Adjustment_Region) AS Avg_Premium_Adjustment,
    AVG(v.Premium_Adjustment_Credit) AS Avg_Credit_Adjustment,
    COUNT(*) AS Policy_Count
FROM {{ source('silver', 'data') }} AT branch {{ nessie_branch }} v
GROUP BY v.Region
