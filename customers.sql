select
  c.id as customer_id
  ,c.name
  ,c.email
  ,min(o.created_at) as first_order_at
  ,count(o.id) as number_of_orders
from
  analytics-engineers-club.coffee_shop.orders as o
  left join analytics-engineers-club.coffee_shop.customers as c on o.customer_id=c.id
group by
    c.id
  ,c.name
  ,c.email
order by
  min(o.created_at)
limit 5