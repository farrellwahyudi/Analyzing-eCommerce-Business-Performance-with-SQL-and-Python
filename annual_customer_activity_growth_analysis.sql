-- Displaying the avg monthly active users for each year --
select 
	((count (distinct cd.customer_unique_id))::double precision/12) as avg_monthly_user,
	date_part('year', od.order_purchase_timestamp) as years
from customers_dataset as cd
right join orders_dataset as od on cd.customer_id = od.customer_id
group by years;
----------------------------------------------

-- Displaying the number of new customers each year --

-- cte to order customer_unique_id and its duplicates (if exist) by year 
with subq as
(
	select 
		cd.customer_unique_id as customer_unique_id, 
		date_part('year', od.order_purchase_timestamp) as years
	from customers_dataset as cd
	right join orders_dataset as od on cd.customer_id = od.customer_id
	order by customer_unique_id, years asc
)
-- counting the number of customer_unique_id (first time "orders") in each year
select 
	count(subq2.customer_unique_id) as number_of_new_customers, 
	subq2.years
from 
(
	-- removing duplicates of customer_unique_id by only selecting the first
	-- occurrence of each customer_unique_id so that only first time "orders" are present.
	select 
		distinct on (subq.customer_unique_id) 
		subq.customer_unique_id, 
		subq.years
	from subq
) as subq2
group by years
order by years asc;
----------------------------------------------

-- Displaying the number of customers that has repeat orders in each year --

-- cte to get the order frequency of each customer in each year 
with subq as
(
	select 
		cd.customer_unique_id as customer_unique_id, 
		date_part('year', od.order_purchase_timestamp) as years,
		count(cd.customer_unique_id) as frequency
	from customers_dataset as cd
	right join orders_dataset as od on cd.customer_id = od.customer_id
	group by years, customer_unique_id
)
-- counting the amount of repeat orders (order frequency > 1) in each year
select 
	count(subq.frequency) as number_of_customers_repeat_orders,
	subq.years as years
from subq
where subq.frequency > 1
group by years;
----------------------------------------------

-- Displaying the avg no. orders by each customer in each year --

-- cte to get the order frequency of each customer in each year 
with subq as
(
	select 
		cd.customer_unique_id as customer_unique_id, 
		date_part('year', od.order_purchase_timestamp) as years,
		count(cd.customer_unique_id) as frequency
	from customers_dataset as cd
	right join orders_dataset as od on cd.customer_id = od.customer_id
	group by years, customer_unique_id
)
-- calculating the average of the order frequency in each year
select
	avg(subq.frequency) as avg_order_by_customers,
	subq.years as years
from subq
group by years;
----------------------------------------------

-- Creating master table to display all of the information above --
create table if not exists annual_customer_activity_growth(
	avg_monthly_user double precision,
	number_of_new_customers bigint,
	number_of_customers_repeat_orders bigint,
	avg_order_by_customers numeric,
	years int
);
-- Inserting information into the new table
insert into annual_customer_activity_growth (
	years,
	avg_monthly_user,
	number_of_new_customers,
	number_of_customers_repeat_orders,
	avg_order_by_customers
)
select 
	q1.years,
	q1.avg_monthly_user as avg_monthly_user,
	q2.number_of_new_customers as number_of_new_customers,
	q3.number_of_customers_repeat_orders as number_of_customers_repeat_orders,
	q4.avg_order_by_customers as avg_order_by_customers
from (
	select 
		((count (distinct cd.customer_unique_id))::double precision/12) as avg_monthly_user,
		date_part('year', od.order_purchase_timestamp) as years
	from customers_dataset as cd
	right join orders_dataset as od on cd.customer_id = od.customer_id
	group by years
) as q1
join
(
	with subq as
	(
		select 
			cd.customer_unique_id as customer_unique_id, 
			date_part('year', od.order_purchase_timestamp) as years
		from customers_dataset as cd
		right join orders_dataset as od on cd.customer_id = od.customer_id
		order by customer_unique_id, years asc
	)
	select 
		count(subq2.customer_unique_id) as number_of_new_customers, 
		subq2.years
	from 
	(
		select 
			distinct on (subq.customer_unique_id) 
			subq.customer_unique_id, 
			subq.years
		from subq
	) as subq2
	group by years
	order by years asc
)as q2
on
	q1.years = q2.years
join
(
	with subq as
	(
		select 
			cd.customer_unique_id as customer_unique_id, 
			date_part('year', od.order_purchase_timestamp) as years,
			count(cd.customer_unique_id) as frequency
		from customers_dataset as cd
		right join orders_dataset as od on cd.customer_id = od.customer_id
		group by years, customer_unique_id
	)
	select 
		count(subq.frequency) as number_of_customers_repeat_orders,
		subq.years as years
	from subq
	where subq.frequency > 1
	group by years
)as q3
on
	q1.years = q3.years
join
(
	with subq as
	(
		select 
			cd.customer_unique_id as customer_unique_id, 
			date_part('year', od.order_purchase_timestamp) as years,
			count(cd.customer_unique_id) as frequency
		from customers_dataset as cd
		right join orders_dataset as od on cd.customer_id = od.customer_id
		group by years, customer_unique_id
	)
	select
		avg(subq.frequency) as avg_order_by_customers,
		subq.years as years
	from subq
	group by years
)as q4
on
	q1.years = q4.years;
	
-- Exporting master table
copy annual_customer_activity_growth
to 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\annual_customer_activity_growth.csv'
with csv header;
