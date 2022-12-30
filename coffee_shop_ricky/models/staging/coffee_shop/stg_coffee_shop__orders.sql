with source as (
    select * from {{ source('coffee_shop','orders') }}
),

renamed as (
    select
        id as orders_id,
        customer_id as customers_id,
        address as orders_address,
        state as orders_state,
        zip as orders_zip,
        total as orders_total,
        created_at as orders_created_at
    from source
)

select * from renamed