Q1. What is our overall conversion rate? NOTE: conversion rate is defined as the # of unique sessions with a purchase event / total number of unique sessions. 

<A. .624567 >

```sql
-- checkouts are defined as the count of all sessions that were event_type = 'checkout'
-- this seemed to tie to the creation of an order

Select sum(checkouts)/count(distinct session_id)
from dev_db.dbt_mjohnst4.fct_user_session;
```
Q2. What is our conversion rate by product?
	- Conversion rate by product is defined as the # of unique sessions with a purchase event of that product / total number of unique sessions that viewed that product

A. 
PRODUCT_NAME	PRODUCT_CONVERSION
String of pearls	0.609375
Arrow Head      	0.555556
Cactus	            0.545455 
ZZ Plant	        0.539683
Bamboo	            0.537313
Rubber Plant	    0.518519
Monstera	        0.510204
Calathea Makoyana	0.509434
Fiddle Leaf Fig	    0.5
Majesty Palm	    0.492537
Aloe Vera	        0.492308
Devil's Ivy	        0.488889
Philodendron	    0.483871
Jade Plant			0.478261
Pilea Peperomioides	0.474576
Spider Plant		0.474576
Dragon Tree			0.467742
Money Tree			0.464286
Orchid				0.453333
Bird of Paradise	0.45
Ficus				0.426471
Birds Nest Fern		0.423077
Pink Anthurium		0.418919
Boston Fern			0.412698
Alocasia Polly		0.411765
Peace Lily			0.409091
Ponytail Palm		0.4
Snake Plant			0.39726
Angel Wings Begonia	0.393443
Pothos				0.344262


```sql
Select product_name, product_conversion from dev_db.dbt_mjohnst4.fct_products;
```

Q3. Why might certain products be converting at higher/lower rates than others? 

<A. perhaps certain products are priced too high or certain products have long shipping dates or low inventory (ie out of stock)>


For the change in Snaphot
Seems all these Orders shipped.
('05202733-0e17-4726-97c2-0520c024ab85'
,'38c516e8-b23a-493a-8a5c-bf7b2b9ea995'
,'5741e351-3124-4de7-9dff-01a448e7dfd4'
,'8385cfcd-2b3f-443a-a676-9756f7eb5404'
,'914b8929-e04a-40f8-86ee-357f2be3a2a2'
,'939767ac-357a-4bec-91f8-a7b25edd46c9'
,'aafb9fbd-56e1-4dcc-b6b2-a3fd91381bb6'
,'d1020671-7cdf-493c-b008-c48535415611'
,'e24985f3-2fb3-456e-a1aa-aaf88f490d70')
