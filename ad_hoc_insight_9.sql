-- ad_hoc_insights_9

-- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
-- The final output contains these fields, channel, gross_sales_mln, percentage

with cte1 as (
select
	channel,
    round(sum((sold_quantity*gross_price)/1000000),0) as gross_sales_mln
from fact_sales_monthly s
join fact_gross_price g
using (product_code, fiscal_year)
join dim_customer c
using (customer_code)
where fiscal_year = 2021
group by channel)

select 
	*,
	gross_sales_mln*100/sum(gross_sales_mln) over() as pct_share
from cte1









