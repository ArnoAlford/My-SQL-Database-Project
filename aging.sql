/* Aging.sql */
set heading on
set feedback off
set echo off
set verify off

spool C:\PROJECT\Aging.txt

prompt
prompt ****** AGING REPORT ******
prompt
prompt Today's Date:
select sysdate from dual;
accept vDAYS char prompt 'Please enter number of days to query: ';
alter table SalesOrder add (DaysOpen number (7));
update SalesOrder set DaysOpen=(trunc(sysdate)-trunc(OrderDate)+1);

column SONumber heading 'Order|Number';
column OrderDate heading 'Order|Date';
column OrderStatus heading 'Order|Status';
column ProdID heading 'Prod|Num';
column PDesc heading 'Product|Description';
column OrderQty heading 'Order|Qty';
column UnitPrice heading 'Unit|Price';
column OrderAmount heading 'Order|Amount';
column DaysOpen heading 'Days|Open';

Select SONumber, OrderDate, OrderStatus, s.ProdID, PDesc, OrderQty, UnitPrice, OrderAmount, DaysOpen
from SalesOrder s, Product p
where DaysOpen>'&vDAYS' and OrderStatus='OPEN' and s.ProdID=p.ProdID
order by DaysOpen;

alter table SalesOrder drop column DaysOpen;

spool off





