Q1. How many users do we have?
>Select count(*) from dev_db.dbt_mjohnst4.stg_users
A: 130

```sql
Select count(*) from dev_db.dbt_mjohnst4.stg_users
```

Q2. On average, how many orders do we receive per hour?
A2: 7.5

```sql
with average_orders as 
                (Select count(*) as total_per_hour, extract('day',created_at) , extract('hour',created_at) 
from dev_db.dbt_mjohnst4.stg_orders
group by extract('day',created_at), extract('hour',created_at)
order By extract('day',created_at)ASC, extract('hour',created_at) ASC
                )
select avg(total_per_hour)
from average_orders
```

Q3. On average, how long does an order take from being placed to being delivered?

A3. 3.8 days

```sql
Select avg(datediff(day,created_at,delivered_at)) as avg_days_between 
from dev_db.dbt_mjohnst4.stg_orders
Where status = 'delivered'
```

Q4. How many users have only made one purchase? Two purchases? Three+ purchases?
A4.
1 purchase: 25
2 purchase: 28
3+ purchaes: 71

```sql
Select count(order_id) 
from dev_db.dbt_mjohnst4.stg_users as u
left join dev_db.dbt_mjohnst4.stg_orders as o
on o.user_id = u.user_id
group by u.user_id
Having count(order_id) = 1
Order by count(order_id) Desc
```

Q5. On average, how many unique sessions do we have per hour?
A5. 16.3

```sql
with sessions_hour as(
        Select count(distinct session_id) Sessions_per_hour ,extract(day,created_at),extract(hour,created_at) 
from dev_db.dbt_mjohnst4.stg_events
Group by extract(day,created_at),extract(hour,created_at)
Order by extract(day,created_at),extract(hour,created_at)
        )
Select avg(Sessions_per_hour)
from sessions_hour
```