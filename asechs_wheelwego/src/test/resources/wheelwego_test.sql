----------dbTEST---------------------

create table member(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   member_name varchar2(100) not null,
   address varchar2(100) not null,
   addressdetail varchar2(100) not null,
   phonenumber varchar2(100) not null,
   member_type varchar2(100) not null,
   postcode varchar2(100) not null
); 
update member set member_type='0' where id='java01';
delete from member;
select * from member;
delete member where id='java'
delete seller where seller_id='java'
insert into customer values ('java01');
delete from customer;
select c.customer_id, m.password, m.member_name, m.address, m.phonenumber, m.member_type
from customer c, member m
where c.customer_id = m.id;
--로그인
select id,password,member_name,address,phonenumber,member_type from member where id='java01' and password='java01'
select * from member;

-- seller 생성
-- seller 1
insert into member values ('java01', '1234', '정현지', '판교', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java01','1010101');
-- seller 2
insert into member values ('java02', '1234', '김래현', '야탑', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java02','1010101');
-- seller 3
insert into member values ('java03', '1234', '김호겸', '서울', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java03','1010101');
-- seller 4
insert into member values ('java04', '1234', '강정호', '경기', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java04','1010101');
-- seller 5
insert into member values ('java05', '1234', '박다혜', '남한산성', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java05','1010101');
-- seller 6
insert into member values ('java06', '1234', '황윤상', '뉴욕', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java06','1010101');
-- seller 7
insert into member values ('java07', '1234', '배서경', '샌프란시스코', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java07','1010101');
-- seller 8
insert into member values ('java08', '1234', '윤다혜', '답십리', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java08','1010101');
-- seller 9
insert into member values ('java09', '1234', '임소영', '수원', '경기도 성남시 분당구', '01022552716','seller','12345');
insert into seller values('java09','1010101');

select * from seller;
select * from foodtruck;
select * from member;
select * from menu;
--푸드트럭 생성
select * from foodtruck where foodtruck_name like '%' || '트럭' || '%' 
select * from foodtruck where foodtruck_name like '%'|| '트럭' || '%' 
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010101', 'java01', '현지트럭', '어서오세용','${pageContext.request.contextPath}/resources/img/truck7.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010102', 'java02', '트럭2', '어서오세용','${pageContext.request.contextPath}/resources/img/truck2.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010103', 'java03', '트럭3', '어서오세용','${pageContext.request.contextPath}/resources/img/truck3.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010104', 'java04', '트럭4', '어서오세용','${pageContext.request.contextPath}/resources/img/truck4.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010105', 'java05', '트럭5', '어서오세용','${pageContext.request.contextPath}/resources/img/truck5.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010106', 'java06', '트럭6', '어서오세용','${pageContext.request.contextPath}/resources/img/truck6.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010107', 'java07', '트럭7', '어서오세용','${pageContext.request.contextPath}/resources/img/truck7.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010108', 'java08', '트럭8', '어서오세용','${pageContext.request.contextPath}/resources/img/truck1.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('1010109', 'java09', '트럭9', '어서오세용','${pageContext.request.contextPath}/resources/img/truck2.jpg');
insert into foodtruck(foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1) values ('10101010', 'java10', '트럭10', '어서오세용','${pageContext.request.contextPath}/resources/img/truck3.jpg');
select * from foodtruck;
UPDATE foodtruck
set foodtruck_filename1='resources/img/truck7.jpg'
WHERE foodtruck_number='1010106';
update member set password='4321' where id='java09' and member_name='임소영' and phonenumber='01022552716'
select * from member
UPDATE foodtruck
set foodtruck_filename1='resources/img/truck6.jpg'
WHERE foodtruck_number='1010107';
UPDATE foodtruck
set foodtruck_filename1='resources/img/truck7.jpg'
WHERE foodtruck_number='1010108';
alter table foodtruck set foodtruck_filename1='/resources/img/truck7.jpg' where 