# My-SQL-Database-Project
The goal of this project was to create a fully working Oracle transaction database that allowed new orders, queries, shipping and warehouse updates, inventory updates, aging and sales report generation spanning six programs.
<br><br><br><br>

First we'll generate a sales order by running order.sql and<img align="right" src="https://github.com/ArnoAlford/My-SQL-Database-Project/blob/master/Order.png">
<br>
inputing the Customer's ID,the product they want to buy,
the quantity they want to buy and what warehouse they will order from. 
The output from order.sql:
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<img align="left" src="https://github.com/ArnoAlford/My-SQL-Database-Project/blob/master/Ship.png">Now that we have an open sales order the next thing naturally
to do is ship the order. This is where shipped.sql is used. The sales order number is entered along with ship date and ship quantity. The program stores these in the sales order while also adjusting the warehouse inventory to account for the shipped goods.<br> The output from shipped.sql:
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<img align="right" src="https://github.com/ArnoAlford/My-SQL-Database-Project/blob/master/Query.png">Next we have a query that shows an easy-to-read 
<br>view of the the selected sales order.
<br>The output from query.sql:
