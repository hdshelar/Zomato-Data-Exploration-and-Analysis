create database zomato;
use zomato;

select * from z_data;

-- Check all the details of table such column name, data types and constraints -- 
describe z_data;

-- Check for duplicate values in [RestaurantId] column -- 
select RestaurantId, count(RestaurantId) as Duplicate_values from z_data group by RestaurantId;

-- Removed unwanted columns from table--  
alter table z_data drop column Switch_to_order_menu;

-- Identify and correct the mis-spelled city names -- 
Select city, count(city) from z_data group by city;
update z_data set City = "Brasilia" where City = "Bras?lia";
update z_data set City = "Sao Paulo" where City = "S?o Paulo";
update z_data set City = "Istanbul" where City = "?stanbul";

-- Count the no of Restaurants --  
select count(RestaurantName) as No_of_Restaurants from z_data;

-- Check min,max,avg data for votes, rating & currency column -- 
select min(votes) from z_data;
select max(votes) from z_data;
select avg(votes) from z_data;

select min(Rating) from z_data;
select max(Rating) from z_data;
select avg(Rating) from z_data;

select min(Currency) from z_data;
select max(Currency) from z_data;
select avg(Currency) from z_data;

-- Creat new category column for rating -- 
Alter table z_data add New_category varchar(20);

-- Merge 2 differnt tables and added the new column of Country_Name with the help of primary key as [CountryCode] column -- 
create table y_data (
Country_Name varchar(20),
Country_Code int primary key
);

select * from y_data;

insert into y_data values ("Christmas Island",162);
insert into y_data values ("Tunisia",216);
insert into y_data values ("East Germany",37);
insert into y_data values ("Brunei",184);
insert into y_data values ("Dominican Republic",214);
insert into y_data values ("USA",1);
insert into y_data values ("Idaho",208);
insert into y_data values ("Croatia",191);
insert into y_data values ("China",189);
insert into y_data values ("Christmas Island",166);

select Country_name, Country_Code, z_data.CountryCode from y_data inner join z_data on y_data.Country_code = z_data.CountryCode group by Country_Name,Country_Code,z_data.CountryCode;
