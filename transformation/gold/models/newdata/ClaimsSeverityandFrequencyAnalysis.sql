{% set nessie_branch = var('nessie_branch', 'main') %}

SELECT 
    Policy_Type,
    AVG(Claims_Frequency) AS Avg_Claims_Frequency,
    AVG(Claims_Severity) AS Avg_Claims_Severity,
    AVG(Claims_Adjustment) AS Avg_Claims_Adjustment,
    COUNT(*) AS Policy_Count
FROM {{ source('silver', 'data') }} AT branch {{ nessie_branch }}
GROUP BY Policy_Type;