select * from seller;

select * from foodtruck;

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1000', 'seller100', '그남자의소시지1000', '그남자의소시지1000');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1001', 'seller101', '그남자의소시지1001', '그남자의소시지1001');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1002', 'seller102', '그남자의소시지1002', '그남자의소시지1002');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1003', 'seller103', '그남자의소시지1003', '그남자의소시지1003');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1004', 'seller104', '그남자의소시지1004', '그남자의소시지1004');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1005', 'seller105', '그남자의소시지1005', '그남자의소시지1005');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1006', 'seller106', '그남자의소시지1006', '그남자의소시지1006');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1007', 'seller107', '그남자의소시지1007', '그남자의소시지1007');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1008', 'seller108', '그남자의소시지1008', '그남자의소시지1008');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1009', 'seller109', '그남자의소시지1009', '그남자의소시지1001');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1010', 'seller110', '그남자의소시지1010', '그남자의소시지1010');

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction)
values ('80나1011', 'seller111', '그남자의소시지1011', '그남자의소시지1011');

insert into foodtruckfile values ('80나1000', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1001', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1002', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1003', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1004', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1005', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1006', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1007', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1008', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1009', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1010', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile values ('80나1011', '그남자의소시지_트럭1.PNG');

select * from foodtruckfile;

select t.*, f.foodtruck_filepath
		from(select * from foodtruck)t, foodtruckfile f
		where t.foodtruck_number=f.foodtruck_number and t.foodtruck_name like '%' || '소시지' || '%'
		
		commit
		
select f.foodtruck_filepath, t.foodtruck_name, t.foodtruck_number FROM
(SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_name, foodtruck_number from foodtruck)t, foodtruckfile f
where t.foodtruck_number=f.foodtruck_number and rnum between 1 and 5


select * from foodtruck where foodtruck_name like '%' || '소시지' || '%'
select * from foodtruck;

select f.foodtruck_filepath, t.foodtruck_name, t.foodtruck_number FROM(
SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_name, foodtruck_number from foodtruck)t, foodtruckfile f
where t.foodtruck_number=f.foodtruck_number and rnum between 1 and 8 and foodtruck_name like '%' || '소시지' || '%' 

select * from foodtruck;
select * from foodtruckfile;


	select f.foodtruck_filepath, t.foodtruck_name, t.foodtruck_number FROM(
	SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_name, foodtruck_number from foodtruck)t, foodtruckfile f
	where t.foodtruck_number=f.foodtruck_number

	select f.foodtruck_filepath, t.foodtruck_name, t.foodtruck_number FROM(
	SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_name, foodtruck_number from foodtruck)t, foodtruckfile f
	where t.foodtruck_number=f.foodtruck_number and foodtruck_name like '%' || '소시지' || '%'
	
select * from foodtruck;	

select f.foodtruck_filepath, t.foodtruck_name, t.foodtruck_number FROM(
SELECT row_number() over(order by foodtruck_number asc) as rnum, foodtruck_name, foodtruck_number from foodtruck)t, foodtruckfile f
where t.foodtruck_number=f.foodtruck_number and rnum between 1 and 8

	SELECT f.foodtruck_filepath, t.foodtruck_name, t.foodtruck_number FROM
	(SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_name, foodtruck_number from foodtruck where foodtruck_name like '%' || '소시지' || '%')t, foodtruckfile f  
	where t.foodtruck_number=f.foodtruck_number and rnum between 9 and 13
	order by foodtruck_number desc
	
SELECT f.foodtruck_filepath, t.foodtruck_name, t.foodtruck_number FROM
(SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_name, foodtruck_number from foodtruck where foodtruck_name like '%' || '소시지' || '%' and latitude is not null and longitude is not null)t, foodtruckfile f  
where t.foodtruck_number=f.foodtruck_number and rnum between 1 and 8
order by foodtruck_number desc	



update foodtruck set latitude=37.497904, longitude = 127.027657 where foodtruck_number = '80나1011'


select * from foodtruck;
	
select t.*, f.foodtruck_filepath
from(select * from foodtruck)t, foodtruckfile f
where t.foodtruck_number=f.foodtruck_number and t.foodtruck_name like '%' || '소시지' || '%' and latitude is not null and longitude is not null;

SELECT f.foodtruck_filepath, t.* FROM
(SELECT fo.*, row_number() over(order by foodtruck_number desc) as rnum 
from foodtruck fo where foodtruck_name like '%' || '소시지' || '%' and latitude is not null and longitude is not null)t, foodtruckfile f  
where t.foodtruck_number=f.foodtruck_number and rnum between 1 and 8
order by t.foodtruck_number desc

SELECT fo.*, row_number() over(order by foodtruck_number desc) as rnum from foodtruck fo 
where foodtruck_name like '%' || '소시지' || '%' and latitude is not null and longitude is not null)t, foodtruckfile f 

SELECT f.foodtruck_filepath, t.* FROM
(SELECT fo.*, row_number() over(order by foodtruck_number desc) as rnum 
from foodtruck fo where foodtruck_name like '%' || '소시지' || '%' and latitude is not null and longitude is not null)t, foodtruckfile f  
where t.foodtruck_number=f.foodtruck_number and rnum between 1 and 8
order by t.foodtruck_number desc

select count(*) from foodtruck where foodtruck_name like '%' || '소시지'|| '%' and latitude is not null and longitude is not null

select * from foodtruck;
select * from foodtruckfile;

select * from foodtruckfile 



SELECT f.foodtruck_filepath, t.* FROM
(SELECT fo.*, row_number() over(order by foodtruck_number desc) as rnum 
from foodtruck fo where foodtruck_name like '%' || '소시지' || '%' and latitude is not null and longitude is not null)t, foodtruckfile f  
where t.foodtruck_number=f.foodtruck_number and rnum between 9 and 17
order by t.foodtruck_number desc

SELECT fo.*, row_number() over(order by foodtruck_number desc) as rnum 
from foodtruck fo 
where rnum between 1 and 8

select * from seller;
select latitude, longitude from foodtruck where seller_id = 'seller01';

update foodtruck set latitude=null, longitude = null where seller_id = 'seller01';
update foodtruck set latitude=37.497904, longitude = 127.027657 where seller_id = 'seller01'

commit