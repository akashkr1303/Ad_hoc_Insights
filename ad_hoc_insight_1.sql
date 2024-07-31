-- ad_hoc_insights_1
--  Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

SELECT 
    *
FROM
    dim_customer
WHERE
    customer LIKE 'Atliq Exclusive'
        AND region = 'APAC'
;
