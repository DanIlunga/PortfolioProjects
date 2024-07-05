/*1. Exploring menu table*/  
SELECT 
    *
FROM
    menu_items;
/* How many items are on the menu?
select 
count(menu_item_id)
from menu_items*/
SELECT 
    COUNT(menu_item_id)
FROM
    menu_items;
/* Least and most expensive item on the menu?
select 
min(price),
max(price)
from menu_items;*/
SELECT 
    MIN(price), MAX(price)
FROM
    menu_items;
/* How many dishes per category
select 
category,
count(category)
from menu_items
group by category;*/
SELECT 
    category, COUNT(category)
FROM
    menu_items
GROUP BY category;
/* Average price per dish by category
select
category,
avg(price)
from menu_items
group by category; */
SELECT 
    category, AVG(price)
FROM
    menu_items
GROUP BY category;
/* Least and most expensive italian dishes
select
min(price),
max(price)
from menu_items
where category = 'italian';*/
SELECT 
    MIN(price), MAX(price)
FROM
    menu_items
WHERE
    category = 'italian';
/* 2. Exploring order details
  select *
 from order_details;
 select
 min(order_date),
 max(order_date)
 from order_details;*/
SELECT 
    *
FROM
    order_details;
SELECT 
    MIN(order_date), MAX(order_date)
FROM
    order_details;
 /* How many orders were made
 select
 count(distinct order_id)
 from order_details;*/
SELECT 
    COUNT(DISTINCT order_id)
FROM
    order_details;
 /* How many items were ordered
select count(*)
 from order_details;*/
SELECT 
    COUNT(*)
FROM
    order_details;
 /* which orders had the most  items
  select order_id,count(item_id) as ItemCount
 from order_details
 group by order_id
 order by Itemcount desc;*/
SELECT 
    order_id, COUNT(item_id) AS ItemCount
FROM
    order_details
GROUP BY order_id
ORDER BY Itemcount DESC;
 /*how many orders had more than 12 items
  select count(*)
 from 
 (select order_id,count(item_id) as ItemCount
 from order_details
 group by order_id
 Having ItemCount > 12) as num_orders;*/
SELECT 
    COUNT(*)
FROM
    (SELECT 
        order_id, COUNT(item_id) AS ItemCount
    FROM
        order_details
    GROUP BY order_id
    HAVING ItemCount > 12) AS num_orders;
/*3. Analyzing customer behavior */
/*Combining the menu_items and order_details 
select *
from order_details od join menu_items mi
    on od.item_id= mi.item_id ;*/
SELECT 
    *
FROM
    order_details od
        JOIN
    menu_items mi ON od.item_id = mi.item_id;
/* Least and most ordered items? what category were they in?
select item_name ,category,count(order_details_id) as num_purcharses
from order_details od join menu_items mi
    on od.item_id= mi.item_id
    group by item_name,category
    order by num_purcharses desc;*/
SELECT 
    item_name,
    category,
    COUNT(order_details_id) AS num_purcharses
FROM
    order_details od
        JOIN
    menu_items mi ON od.item_id = mi.item_id
GROUP BY item_name , category
ORDER BY num_purcharses DESC;
/* Top 5 orders that spent the most money?
SELECT 
    order_id, SUM(price) AS total_spend
FROM
    order_details od
        JOIN
    menu_items mi ON od.item_id = mi.item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;*/
SELECT 
    order_id, SUM(price) AS total_spend
FROM
    order_details od
        JOIN
    menu_items mi ON od.item_id = mi.item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
