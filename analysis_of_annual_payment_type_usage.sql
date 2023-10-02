-- Creating all time payment type usage table --
create table if not exists all_time_payment_type_usage as
	select
		count(case
				when payment_type = 'credit_card' then order_id 
				when payment_type = 'boleto' then order_id
				when payment_type = 'voucher' then order_id
				when payment_type = 'debit_card' then order_id
				when payment_type = 'not_defined' then order_id
				end) as no_usage,
		payment_type
	from order_payments_dataset
	group by payment_type
	order by no_usage desc;

-- Creating payment type usage by year table --
create table if not exists payment_type_usage_by_year as
	select
		count(case when op.payment_type = 'credit_card' then op.order_id end) as credit_card,
		count(case when op.payment_type = 'boleto' then op.order_id end) as boleto,
		count(case when op.payment_type = 'voucher' then op.order_id end) as voucher,
		count(case when op.payment_type = 'debit_card' then op.order_id end) as debit_card,
		count(case when op.payment_type = 'not_defined' then op.order_id end) as not_defined,
		date_part('year', od.order_purchase_timestamp) as years
	from order_payments_dataset as op
	join orders_dataset as od on od.order_id = op.order_id
	group by years;

-- Exporting tables --
copy all_time_payment_type_usage
to 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\all_time_payment_type_usage.csv'
with csv header;
copy payment_type_usage_by_year
to 'C:\Farrell\Rakamin\Mini Projects\eCommerce Business Performance with SQL\payment_type_usage_by_year.csv'
with csv header;