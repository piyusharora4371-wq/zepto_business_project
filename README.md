# Zepto business queries solved using sql.

![Zepto logo](https://github.com/piyusharora4371-wq/zepto_business_project/blob/main/zepto.png)


OVERVIEW

Data Analytics Portfolio Project using SQL on a real e-commerce dataset from Zepto — one of India’s fastest-growing quick-commerce startups. This isn’t just SQL practice.
PostgreSQL to performing data cleaning, exploratory data analysis (EDA), and solving business problems using SQL.

Some screenshots of PostgreSQL while running the business queries.
![SS](https://github.com/piyusharora4371-wq/zepto_business_project/blob/main/2026-04-27%20(1).png)

![ss](https://github.com/piyusharora4371-wq/zepto_business_project/blob/main/2026-04-27.png)

SCHEMA
-- 5 business queries solved using SQL.

--1. Find the top 10 best-value products based on the discount percentage.

select name,discountpercent,mrp from zepto
order by discountpercent desc
limit 10;

--2. what are the products with high mrp but outofstock.
select distinct name, mrp from zepto
where mrp>300 and outofstock='true'
order by mrp desc;

--3. Calculate estimated revenue from each category.

select category,
sum(discountedsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue;

--4. Find all products where mrp is greater than 500 and discount is less than 10%.


select name,mrp,discountpercent
from zepto
where mrp>500 and discountpercent<10.0
order by 2,3 desc;

--5. Identify the top 5 categories offering the highest average discount percentage.
select category,

round(avg(discountpercent),2) as average_discount_percentage
from zepto
group by category
order by average_discount_percentage desc
limit 5;
