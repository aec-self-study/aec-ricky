with source as (
    select * from {{ source('coffee_shop','product_prices') }}
),

renamed as (
    select
        id as product_prices_id,
        product_id as products_id,
        price as product_prices_price,
        created_at as product_prices_created_at,
        ended_at as product_prices_ended_at 
    from source
)

select * from renamed