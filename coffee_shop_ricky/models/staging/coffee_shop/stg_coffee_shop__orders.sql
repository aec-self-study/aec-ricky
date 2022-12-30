with source as (
    select * from {{ source('coffee_shop','orders') }}
),

renamed as (
    select
        id as orders_id,
        created_at as orders_created_at,
        customer_id as customers_id,
        total as orders_total,
        address as orders_address,
        state as orders_state,
        zip as orders_zip
    from source
)

select * from renamed