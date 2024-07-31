-- ad_hoc_insights_7

-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . 
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions. 
-- The final report contains these columns: Month, Year, Gross sales Amount

select 
    distinct(s.date) as month,
    year(s.date) as year,
    round(sum(sold_quantity*gross_price),2) as gross_sales_amount
from fact_sales_monthly s
join fact_gross_price g
using (product_code, fiscal_year)
join dim_customer c
using (customer_code)
where customer like "%Atliq Exclusive%"
group by s.date
order by year asc
;



















