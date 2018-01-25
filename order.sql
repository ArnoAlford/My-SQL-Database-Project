/* Order.sql */

set heading off
set feedback off
set echo off
set verify off

spool C:\PROJECT\Order.txt

prompt
prompt ****** PLACE AN ORDER ******
prompt
prompt Today's Date:
select sysdate from dual;
prompt
accept vCNUM char prompt 'Enter the Customer Number: ';
select '	Customer Name: ' ||initcap(LastName)||', '||initcap(FirstName)||' ' from Customers where CNum='&vCNUM';
select '	Shippiing Address: ', Address from Customers where CNum='&vCNum';
select '	City, State Zip: ' ||initcap(City)||', '||upper(State)||' '|| zip from Customers where CNum='&vCNum';
select '	Phone: (' ||substr(PHONE,1,3)||') '||substr(PHONE,4,3)||'-'||substr(PHONE,7) from Customers where CNum='&vCNum';
commit;
accept vPRODID char prompt 'Enter the Item Number: ';
select '	Item Number: ', ProdID from Product where ProdID='&vPRODID';
select '	Item Description: ', PDesc from Product where ProdID='&vPRODID';
select '	Unit Price: $', Price from Product where ProdID='&vPRODID';
commit;
accept vORDERQTY char prompt 'Enter the quantity ordered: ';

commit;
select '	Amount Ordered: $', (price*'&vORDERQTY') OrderAmt from product where ProdID='&vPRODID';
prompt Please choose from the following warehouses:
prompt
prompt 	    Warehouse  City,State  InventoryLevel
select '', i.Warehouse#||'          '||initcap(City)||', '||upper(State)||'   '||Inventory from Warehouse w, Inventory i where w.Warehouse#=i.Warehouse# and ProdID='&vPRODID';  
accept vWAREHOUSE char prompt 'Enter the warehouse code: ';
commit;

create table pricetable1 as select ProdID, Price from Product;

insert into SalesOrder (SONumber, CNum, ProdID, OrderDate, OrderQty, Warehouse#, OrderStatus, UnitPrice, OrderAmount) 
select maxnum, '&vCNUM', '&vPRODID', sysdate, '&vORDERQTY', '&vWAREHOUSE', 'OPEN', Price, Price*'&vORDERQTY'  from Counter, pricetable1 where pricetable1.ProdID='&vPRODID';

prompt ***** Order Status:	OPEN
select '***** Order Number is ------>', maxnum from Counter;
update Counter set maxnum=maxnum+1;
drop table pricetable1;
commit;



spool off


