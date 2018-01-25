/* Shipped.sql */

set heading off
set feedback off
set echo off
set verify off

spool C:\PROJECT\Shipped.txt

prompt
prompt ****** UPDATE SHIPPING ******
prompt

accept vSONUMBER prompt 'Please enter the order number: ';
select 'Order Number: ', SONumber from SalesOrder where SONumber='&vSONUMBER';
select 'Order Date: ', OrderDate from SalesOrder where SONumber='&vSONUMBER';
select 'Customer Number: ', CNum from SalesOrder where SONumber='&vSONUMBER';
select '	 ', Address from Customers c, SalesOrder s where c.CNum=s.CNum and SONumber='&vSONUMBER';
select '	 ' ||initcap(City)||', '||upper(State)||' '|| zip from Customers c, SalesOrder s where c.CNum=s.CNum and SONumber='&vSONUMBER';
select '	 (' ||substr(PHONE,1,3)||') '||substr(PHONE,4,3)||'-'||substr(PHONE,7) from Customers c, SalesOrder s where c.CNum=s.CNum and SONumber='&vSONUMBER';
select 'Item Number: ', ProdID from SalesOrder where SONumber='&vSONUMBER';
select '	Item Description: ', PDesc from Product p, SalesOrder s where p.ProdID=s.ProdID and SONumber='&vSONUMBER';
select '	Price: $', Price from Product p, SalesOrder s where p.ProdID=s.ProdID and SONumber='&vSONUMBER';
select 'Quantity Ordered: ', OrderQty from SalesOrder where SONumber='&vSONUMBER';
select 'Amount Ordered: $', OrderAmount from SalesOrder where SONumber='&vSONUMBER';
prompt
select 'Shipping Warehouse: ', Warehouse# from SalesOrder where SONumber='&vSONUMBER';
select '	 ', Address from Warehouse w, SalesOrder s where w.Warehouse#=s.Warehouse# and SONumber='&vSONUMBER';
select '	 ' ||initcap(City)||', '||upper(State)||' '|| zip from Warehouse w, SalesOrder s where w.Warehouse#=s.Warehouse# and SONumber='&vSONUMBER';
select '	 (' ||substr(PHONE,1,3)||') '||substr(PHONE,4,3)||'-'||substr(PHONE,7) from Warehouse w, SalesOrder s where w.Warehouse#=s.Warehouse# and SONumber='&vSONUMBER';
prompt
accept vSHIPDATE prompt 'Please enter the shipping date (mm/dd/yyyy): ';
update SalesOrder set ShipDate=to_date('&vSHIPDATE', 'mm/dd/yyyy') where SONumber='&vSONUMBER';
accept vSHIPQTY prompt 'Please enter the shipping quantity: ';
update SalesOrder set ShipQty=('&vSHIPQTY') where SONumber='&vSONUMBER';
prompt ********************************
prompt Order is now ---> SHIPPED
update SalesOrder set OrderStatus='SHIPPED' where SONumber='&vSONUMBER';
select 'Date Shipped: ', ShipDate from SalesOrder where SONumber='&vSONUMBER';
select 'Quantity Shipped: ', ShipQty from SalesOrder where SONumber='&vSONUMBER';
update SalesOrder set ShipAmount=(UnitPrice*ShipQty) where SONumber='&vSONUMBER';
select 'Ammount Shipped: $', ShipAmount from SalesOrder where SONumber='&vSONUMBER';
commit;
update Inventory set Inventory=Inventory-'&vSHIPQTY' where ProdID=(select ProdID from SalesOrder where SONumber='&vSONUMBER');
commit;


spool off