
Q1. What's our repeat user rate?
Repeat Rate  = User who purchased 2 or more times/users who purchased
<A. .798>

```sql
--- What is our Repeat user rate?
WITH order_count AS (
    SELECT 
        user_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM dev_db.dbt_mjohnst4.stg_orders
    GROUP BY user_id
    ORDER BY order_count DESC
)
SELECT
    SUM(CASE WHEN order_count >= 0 THEN 1 ELSE 0 END) AS purchase_any,
    SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) AS purchase_2,
    1- SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) / SUM(CASE WHEN order_count >= 1 THEN 1 ELSE 0 END)::INT as user_rate
FROM order_count;
```

Q2. What are good indicators of a user who will likely purchase again? 
<<To understand the signals that indicate if a customer is likely to buy again we would look at the pages they visit. the size of their order. the OS they are using. The billing and shipping country.>>

Q3.
What about indicators of users who are likely NOT to purchase again? 
<<They only visit certain web pages, probably never visit products page. Perhaps the Billing address is not the same as shipping indicating it is a one time gift.>>

Q4.
If you had more data, what features would you want to look into to answer this question?
<<I'd like to look at where the person came from: organic search, referral, google add. If the person added items to their cart. If they added a credit card to their checkout >>

Q5. Explain the marts models you added. 

<<To answer the question What is our user repeat rate? It makes sense to create an intermediate table Int_user_orders which joins users and orders to create the aggregate measure (Repeat Rate = Users who purchased 2 or more times / users who purchased). >>

Q6. Why did you organize the models in the way you did? 
<All Staging tables are 1:1 with sources and where we perform light transformation go into the Staging Folder. >

<Then in the Marts folder we create an intermediate Folder for all tables that need heavy transformation. This is were we aggregate data points for fact tables like user_order_facts to answer key questions. >

<Finally we put all the Fact/Dimension table in department subdirectories of the Marts Folder for business users to access so that they have access to key facts/measure and dimensions to explore against those facts.>

Testing
Q1. What assumptions are you making about each model? (i.e. why are you adding each test?) Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?

<I am making the assumption that all ID's are unique and not null for all source tables and that all order_totals are positive. I did not run into any errors with these tests. >

Q2. Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.

<we can schedule jobs to run wit tests on a daily basis to ensure that the test we setup alert us of any data>

Base on the Snapshot Table
The following orders where delivered:
('914b8929-e04a-40f8-86ee-357f2be3a2a2','05202733-0e17-4726-97c2-0520c024ab85','939767ac-357a-4bec-91f8-a7b25edd46c9')
