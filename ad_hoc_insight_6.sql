-- ad_hoc_insights_6

-- Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct 
-- for the fiscal year 2021 and in the Indian market. 
-- The final output contains these fields, customer_code, customer, average_discount_percentage


SELECT 
    p.customer_code,
    GROUP_CONCAT(c.customer) AS customer,
    ROUND(AVG(pre_invoice_discount_pct), 2) AS average_discount_percentage
FROM
    fact_pre_invoice_deductions p
        JOIN
    dim_customer c USING (customer_code)
WHERE
    fiscal_year = 2021 AND market = 'India'
GROUP BY p.customer_code
ORDER BY average_discount_percentage DESC
LIMIT 5
;




