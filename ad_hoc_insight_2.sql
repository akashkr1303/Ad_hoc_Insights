-- ad_hoc_insights_2
-- What is the percentage of unique product increase in 2021 vs. 2020? 
-- The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg

create temporary table p20(
select 
	count(distinct(product_code)) as unique_products_2020
from fact_sales_monthly
where fiscal_year = 2020);


create temporary table p21(
select 
	count(distinct(product_code)) as unique_products_2021
from fact_sales_monthly
where fiscal_year = 2021);

select 
	*,
    round((unique_products_2021 - unique_products_2020)*100/unique_products_2020,2) as percentage_chg
from p20
join p21
