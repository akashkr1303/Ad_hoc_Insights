-- ad_hoc_insights_4

-- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
-- The final output contains these fields, segment, product_count_2020, product_count_2021, difference

create temporary table t20 (
select 
	distinct(segment),
    count(distinct(s.product_code)) as product_count_2020
from fact_sales_monthly s
join dim_product p
using (product_code)
where fiscal_year = 2020
group by segment)
;

create temporary table t21 (
select 
	distinct(segment),
    count(distinct(s.product_code)) as product_count_2021
from fact_sales_monthly s
join dim_product p
using (product_code)
where fiscal_year = 2021
group by segment)
;

select * from t20;
select * from t21;

select 
	*,
    (product_count_2021 - product_count_2020) as difference
from t20 a
join t21 b
using (segment)



