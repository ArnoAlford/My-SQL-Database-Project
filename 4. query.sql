/* Query.sql */

set heading off
set feedback off
set echo off
set verify off

spool C:\PROJECT\Query.txt

prompt
prompt ****** SHOW ORDER DETAILS ******
prompt
accept vSONUMBER prompt 'Please enter the order number: ';
select 'Order Number: ', SONumber from SalesOrder where SONumber='&vSONUMBER';
select 'Order Status: ', OrderStatus from SalesOrder where SONumber='&vSONUMBER';
prompt
select 'Customer Number: ', CNum from SalesOrder where SONumber='&vSONUMBER';
select '	 ' ||initcap(LastName)||', '||initcap(FirstName)||' ' from Customers c, SalesOrder s where c.CNum=s.CNum;
select '	 ', Address from Customers c, SalesOrder s where c.CNum=s.CNum;
select '	 ' ||initcap(City)||', '||upper(State)||' '|| zip from Customers c, SalesOrder s where c.CNum=s.CNum;
select '	 (' ||substr(PHONE,1,3)||') '||substr(PHONE,4,3)||'-'||substr(PHONE,7) from Customers c, SalesOrder s where c.CNum=s.CNum;
prompt
select 'Item Number: ', ProdID from SalesOrder where SONumber='&vSONUMBER';
select '	Item Description: ', PDesc from Product p, SalesOrder s where p.ProdID=s.ProdID;
select '	Price: $', Price from Product p, SalesOrder s where p.ProdID=s.ProdID;
select 'Order Date: ', OrderDate from SalesOrder where SONumber='&vSONUMBER';
select 'Shipping Date: ', ShipDate from SalesOrder where SONumber='&vSONUMBER';
prompt
select 'Quantity Ordered: ', OrderQty from SalesOrder where SONumber='&vSONUMBER';
select 'Amount Ordered: $', OrderAmount from SalesOrder where SONumber='&vSONUMBER';
select 'Quantity Shipped: ', ShipQty from SalesOrder where SONumber='&vSONUMBER';
select 'Ammount Shipped: $', ShipAmount from SalesOrder where SONumber='&vSONUMBER';
select 'Shipping Warehouse: ', Warehouse# from SalesOrder where SONumber='&vSONUMBER';
select '	 ', Address from Warehouse w, SalesOrder s where w.Warehouse#=s.Warehouse#;
select '	 ' ||initcap(City)||', '||upper(State)||' '|| zip from Warehouse w, SalesOrder s where w.Warehouse#=s.Warehouse#;
prompt
select '	 (' ||substr(PHONE,1,3)||') '||substr(PHONE,4,3)||'-'||substr(PHONE,7) from Warehouse w, SalesOrder s where w.Warehouse#=s.Warehouse#;
commit;
spool off
