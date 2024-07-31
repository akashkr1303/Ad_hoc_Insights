-- ad_hoc_insights_8

-- In which quarter of 2020, got the maximum total_sold_quantity? 
-- The final output contains these fields sorted by the total_sold_quantity, Quarter, total_sold_quantity

with cte1 as (
select
	*, 
	month(date_add(date, interval 4 month)) as fiscal_month
from fact_sales_monthly
where fiscal_year = 2020)
,

cte2 as (
select 
	*,
    case
		when fiscal_month in (1,2,3) then "Q1"
        when fiscal_month in (4,5,6) then "Q2"
        when fiscal_month in (7,8,9) then "Q3"
        else "Q4"
        end as qtr 
from cte1)
select 
	qtr,
    sum(sold_quantity) as total_sold_quantity
from cte2
group by qtr 
order by total_sold_quantity desc
;


















