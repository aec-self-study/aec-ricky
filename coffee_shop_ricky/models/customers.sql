{{ config(
    materialized='table'
) }}

select
  customers.id as customer_id,
  customers.name,
  customers.email,
  min(orders.created_at) as first_order_at,
  count(orders.id) as number_of_orders
from {{ source('coffee_shop', 'orders') }} as orders
left join {{ source('coffee_shop', 'customers') }} as customers on orders.customer_id = customers.id
group by
  customers.id,
  customers.name,
  customers.email
order by
  first_order_at
limit 5