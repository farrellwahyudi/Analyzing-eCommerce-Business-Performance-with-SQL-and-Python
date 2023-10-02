-- Creating table of total revenue in each year --
create table if not exists total_revenue_per_year as
	select 
		sum(oi.price + oi.freight_value) as total_revenue, 
		date_part('year', od.order_purchase_timestamp) as years
	from order_items_dataset as oi
	right join orders_dataset as od on oi.order_id = od.order_id
	where od.order_status = 'delivered'
	group by years;

-- Creating table of no. canceled orders in each year --
create table if not exists total_canceled_orders_per_year as
	select 
		count(order_id) as total_canceled_orders,
		date_part('year', order_purchase_timestamp) as years
	from orders_dataset
	where order_status = 'canceled'
	group by years;

-- Creating table of highest revenue product categories --
create table if not exists highest_revenue_product_category_per_year as
	select 
		highest_revenue_category, 
		product_cat_revenue, 
		years
	from
	(
		select 
			highest_revenue_category, 
			product_cat_revenue, 
			years, rank() over (partition by years order by product_cat_revenue desc) as pos
		from
		(
			select 
				pd.product_category_name as highest_revenue_category,
				sum(oi.price + oi.freight_value) as product_cat_revenue,
				date_part('year', od.order_purchase_timestamp) as years
			from orders_dataset as od
			right join order_items_dataset as oi on oi.order_id = od.order_id
			right join product_dataset as pd on oi.product_id = pd.product_id
			where od.order_status = 'delivered'
			group by years, product_category_name
		)as subq
	) as subq2
	where pos < 2;

-- Creating table of product category with the highest number canceled orders in each year--
create table if not exists most_canceled_product_category_per_year as
	select 
		most_canceled_product_cat,
		product_cat_canceled_orders,
		years
	from
	(
		select 
			most_canceled_product_cat, 
			product_cat_canceled_orders, 
			years, rank() over (partition by years order by product_cat_canceled_orders desc) as pos
		from
		(
			select 
				pd.product_category_name as most_canceled_product_cat,
				count(od.order_id) as product_cat_canceled_orders,
				date_part('year', od.order_purchase_timestamp) as years
			from orders_dataset as od
			right join order_items_dataset as oi on oi.order_id = od.order_id
			right join product_dataset as pd on oi.product_id = pd.product_id
			where od.order_status = 'canceled'
			group by years, product_category_name
		)as subq
	) as subq2
	where pos < 2;

-- Creating master table for the above tables --
create table if not exists annual_product_category_quality as
	select 
		tr.years,
		tr.total_revenue,
		tc.total_canceled_orders,
		hr.highest_revenue_category, 
		hr.product_cat_revenue,
		mc.most_canceled_product_cat,
		mc.product_cat_canceled_orders
	from total_revenue_per_year as tr
	join total_canceled_orders_per_year as tc on tr.years = tc.years
	join highest_revenue_product_category_per_year as hr on tr.years = hr.years
	join most_canceled_product_category_per_year as mc on tr.years = mc.years;

-- Exporting master table --
copy annual_product_category_quality
to 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\annual_product_category_quality.csv'
with csv header;