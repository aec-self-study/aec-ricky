with source as (
    select * from {{ source('coffee_shop','customers') }}
),

renamed as (
    select
        id as customers_id,
        name as customers_name,
        email as customers_email
    from source
)

select * from renamed

