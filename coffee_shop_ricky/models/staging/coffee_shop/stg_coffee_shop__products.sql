with source as (
    select * from {{ source('coffee_shop','products') }}
),

renamed as (
    select
        id as products_id,
        name as products_name,
        category as products_category,
        created_at as products_created_at
    from source
)

select * from renamed