/* First Deliverable */

set echo on

spool c:\PROJECT\setup.txt

drop table SalesOrder;
drop table Inventory;
drop Table Warehouse;
drop table Product;
drop table Customers;


create table Customers (
	CNum varchar2 (8),
	FirstName varchar2 (15),
	LastName varchar2 (15),
	City varchar2 (30),
	State varchar2 (30),
	Zip Number (5),
	Phone varchar2 (30),
	Address varchar2 (30),
	primary key (CNum));

create table Product (
	ProdID varchar2 (5),
	PDesc varchar2 (11),
	Price Number (8,2),
	primary key (ProdID));

create table Warehouse (
	Warehouse# Number (3),
	City varchar2 (30),
	State varchar2 (30),
	Zip varchar2 (30),
	Phone varchar2 (11),
	Address varchar2 (30),
	primary key (Warehouse#));

create table Inventory (
	Warehouse# Number (3),
	ProdID varchar2 (5),
	Inventory varchar2 (7),
	primary key (Warehouse#, ProdID),
	constraint fk12 foreign key (Warehouse#) references Warehouse(Warehouse#),
	constraint fk13 foreign key (ProdID) references Product(ProdID));


create table SalesOrder (
	SONumber Number (3),
	CNum varchar2 (8),
	ProdID varchar2 (5),
	Warehouse# Number (3),
	OrderStatus varchar2 (15),
	OrderDate date,
	OrderQty Number (3),
	UnitPrice Number (7,2),
	OrderAmount Number (8,2),
	ShipQty Number (7),
	ShipAmount Number (8,2),
	ShipDate date,
	primary key (SONumber),
	constraint fk14 foreign key (CNum) references Customers(CNum),
	constraint fk15 foreign key (ProdID) references Product(ProdID),
	constraint fk16 foreign key (Warehouse#) references Warehouse(Warehouse#));

insert into Customers values ('00001', 'John', 'Black', 'Anaheim', 'CA', '92804', '7143274848', '717 Westbridge Ave.');
insert into Customers values ('00002', 'Jane', 'Blue', 'Cypress', 'CA', '92805', '7143274018', '919 Nolabia blvd.');
insert into Customers values ('00003', 'Bill', 'Green', 'Long Beach', 'CA', '92383', '7143271111', '844 Verbose st.');
insert into Customers values ('00004', 'Arno', 'Yellow', 'Los Angeles', 'CA', '92812', '7143273235', '122 Takedown blvd.');
insert into Customers values ('00005', 'Dave', 'Red', 'Anaheim', 'CA', '92804', '7143279632', '655 Forgetful ave.');

insert into Product values ('01', 'Chair', '50.00');
insert into Product values ('02', 'Desk', '10.00');
insert into Product values ('03', 'Lamp', '20.00');
insert into Product values ('04', 'Stand', '05.00');
insert into Product values ('05', 'Bin', '25.00');

insert into Warehouse values ('101', 'Anaheim', 'CA', '92804', '7147675757', '7362 Woodrich Ave.');
insert into Warehouse values ('102', 'Austin', 'TX', '95282', '9107675723', '0182 Glodrich Ave.');
insert into Warehouse values ('103', 'Louiville', 'KN', '72453', '8273629191', '1800 Dabble Blvd.');

insert into Inventory values ('102', '01', '300');
insert into Inventory values ('101', '02', '50');
insert into Inventory values ('102', '03', '700');
insert into Inventory values ('103', '04', '20');
insert into Inventory values ('103', '05', '200');

commit;

spool off



