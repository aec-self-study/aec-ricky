with order_items as (
    select * from {{ ref('stg_coffee_shop__order_items') }}
),

orders as (
    select * from {{ ref('stg_coffee_shop__orders') }}
),

product_prices as (
    select * from {{ ref('stg_coffee_shop__product_prices') }}
),

products as (
    select * from {{ ref('stg_coffee_shop__products') }}
),

final as (
    select
        products.products_category,
        extract(year from orders.orders_created_at) as orders_year,
        extract(week from orders.orders_created_at) as orders_week,
        sum(product_prices.product_prices_price) as revenue
    from 
        order_items
        left join orders on order_items.orders_id = orders.orders_id
        left join product_prices on order_items.products_id = product_prices.products_id and orders.orders_created_at between product_prices.product_prices_created_at and product_prices.product_prices_ended_at
        left join products on order_items.products_id = products.products_id
    group by 1,2,3
)

select * from final