-- 1. We will need a list of all Staff members, including their First_Name,Last_Name,Email Address and the Store identificaton number where they work.

Select first_name,
 last_name, 
 email, 
 store_id from staff;
 
 
 -- 2. We will need Separate count of inventory items held at each of your two stores
 
 Select Store_id,
 count(Inventory_id) Count_of_inventory_items from inventory
 group by Store_id;
 

 -- 3.We will need a count of active customers of each of your stores. Separately, Please.
 
 Select Store_id,active,
 count(customer_id) Active_customers_store1
 from customer
 where Store_id=1 and active=1
 Group by Store_id,active;
 
  Select Store_id,active,
 count(customer_id) Active_customers_store2
 from customer
 where Store_id=2 and active=1
 Group by Store_id,active;
 
 
 -- 4.In order to assess the liability of a data breach, we will need you to provide a count of all customers email addresses stored in the database.
  
  Select count(email) email_count from customer;
 
 -- 5.We are interested in how diverse your film  offering is a means of understanding how likely you are to keep customers engaged in the future. 
 -- please provide a count of unique film titles you have in inventory at each store and provide a count of the unique categories of films you provide.
 
 Select store_id,
 count(distinct film.title) Unique_film_titles,
 count(distinct category.name) Unique_categories
 from inventory
 Left Join category on inventory.inventory_id=category.category_id
 Left join film on inventory.film_id=film.film_id
 group by store_id;
 
 
 -- 6.We would like to understand the replacement of cost of your films. Please provide the replacement cost for the film that is least expensive to 
 -- replace, the most expensive to replace and the average of all films you carry.
 
 Select min(replacement_cost),
 max(replacement_cost),
 avg(replacement_cost)
 from film;
 
 -- 7.We are interested in having you put payment monitoring systems and maximum payment processing restrictions in place in order to minimize the 
 -- future risk of fraud by your staff. Please provide the average payment you process, as well as the maximum payment you have processed.
 
 Select avg(amount) average_payment,
 max(amount) maximum_payment from payment;
 
 -- 8.We would like to better understand what your customer base looks like. Please provide a list of all customer identification values, with a count 
 -- of rentals they have made all-time, with your highest volume customers at the top of the list.
 
 Select customer_id,
 count(rental_id) rent_count from rental
 group by customer_id
 order by rent_count desc;