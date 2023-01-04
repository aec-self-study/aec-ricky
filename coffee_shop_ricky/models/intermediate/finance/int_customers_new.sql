with customers as (
    select * from {{ref('stg_coffee_shop__customers') }}
),

orders as (
    select * from {{ ref('stg_coffee_shop__orders') }}
)

select
    customers.customers_id,
    customers.customers_name,
    customers.customers_email,
    min(orders.orders_created_at) as first_order_at,
    count(orders.orders_id) as number_of_orders
from
    orders
    left join customers on orders.customers_id=customers.customers_id
group by 1,2,3