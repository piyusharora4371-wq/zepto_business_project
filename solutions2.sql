drop table if exists zepto;

create table zepto(
category varchar(120),
name varchar(150) not null,
mrp numeri

select * from zepto;

select count(*) from zepto;

select * from zepto
limit 10

select distinct category
from zepto
order by category;

select outofstock, count()
from zepto

select * from zepto
where mrp=0
--to remove the row having mrp=0;
delete from zepto
where mrp=0;

--covert paise into money
update zepto
set mrp=mrp/100.0;

select mrp from zepto;

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