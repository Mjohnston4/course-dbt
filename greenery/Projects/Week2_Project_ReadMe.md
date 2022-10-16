Q1. Explain the marts models you added. 

<<To answer the question What is our user repeat rate? It makes sense to create an intermediate table Int_user_orders which joins users and orders to create the aggregate measure (Repeat Rate = Users who purchased 2 or more times / users who purchased). >>

Q2. What are good indicators of a user who will likely purchase again? 
<<To understand the signals that indicate if a customer is likely to buy again we would look at the pages they visit. the size of their order. the OS they are using. The billing and shipping country.>>

Q3.
What about indicators of users who are likely NOT to purchase again? 
<<They only visit certain web pages, probably never visit products page. Perhaps the Billing address is not the same as shipping indicating it is a one time gift.>>

Q4.
If you had more data, what features would you want to look into to answer this question?
<<I'd like to look at where the person came from: organic search, referral, google add. If the person added items to their cart. If they added a credit card to their checkout >>

Why did you organize the models in the way you did? 
All Staging tables are 1:1 with sources and where we perform light transformation go into the Staging Folder. 

Then in the Marts folder we create an intermediate Folder for all tables that need heavy transformation. 

Finally we put all the Fact/Dimension table in department subdirectories of the Marts Folder

Model Organization
Models
 - Marts
   - Intermediate
        -int_user_facts
   - Core
        -dim_products
        -fact_orders
   - Marketing
        -user_order_facts
   - Product
        -fact_page_views
- Staging
   - Postgres
        -stg_models
