with source as (
    select * from {{ source('coffee_shop','order_items') }}
),

renamed as (
    select
        id as order_items_id,
        order_id as orders_id,
        product_id as products_id
    from source
)

select * from renamed