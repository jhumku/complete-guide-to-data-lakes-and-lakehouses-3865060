{% set nessie_branch = var('nessie_branch', 'main') %}

SELECT 
    Source_of_Lead,
    COUNT(*) AS Total_Leads,
    SUM(CASE WHEN Conversion_Status = 'Converted' THEN 1 ELSE 0 END) AS Converted_Leads,
    (SUM(CASE WHEN Conversion_Status = 'Converted' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Conversion_Rate
FROM {{ source('silver', 'data') }} AT branch {{ nessie_branch }}
GROUP BY Source_of_Lead;