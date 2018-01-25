/* SalesReport.sql */


set feedback off
set echo off
set verify off

spool C:\PROJECT\SalesReport.txt

prompt
prompt ****** SALES REPORT ******
prompt
alter table SalesOrder add (OrderMonth varchar2 (20));
update SalesOrder set OrderMonth=(to_char(trunc(OrderDate), 'mm/yyyy'));

column ProdID heading 'Prod|No';
column PDesc heading 'Product|Name';
column OrderMonth heading 'Order|Month';
column No heading 'No of|Orders';
column Units heading 'Total|Units';
column total heading 'Total|Amount' format $999.99;

select s.ProdID, PDesc, OrderMonth, count(SONumber) No, sum(OrderQty) Units, (sum(OrderQty)*price) total
from SalesOrder s, Product p 
where s.ProdID=p.ProdID 
group by s.ProdID, OrderMonth, PDesc, Price
order by s.ProdID;



alter table SalesOrder drop column OrderMonth;
spool off

