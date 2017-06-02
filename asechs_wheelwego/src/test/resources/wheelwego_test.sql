----------dbTEST---------------------

insert into member values ('seller02', '1234', '김래발', '판교','코스타', '010-1111-1111', 'seller','1234');
update member set member_type='0' where id='java01';
delete from member;
delete from member where id = 'seller02';
select * from member;
select * from seller;
delete member where id='java'
delete seller where seller_id='java'
insert into customer values ('java01');
insert into seller values ('seller02');
delete from customer;
select c.customer_id, m.password, m.member_name, m.address, m.phonenumber, m.member_type
from customer c, member m
where c.customer_id = m.id;
--로그인
select id,password,member_name,address,phonenumber,member_type from member where id='java01' and password='java01'
select * from member;

select * from seller;

delete from member;
delete from customer;
delete from seller;
delete from foodtruck;
delete from wishlist;

select password from member where id ='java01';

select password from member where id = 'java01';

select * from member;

select * from seller;
select * from foodtruck;
select * from wishlist ;
select * from wishlist where id = 'customer01';
-- 푸드트럭 위시리스트 sql문
select * from foodtruck where foodtruck_number in (select w.foodtruck_number
from customer c, wishlist w
where c.customer_id = w.customer_id and c.customer_id = 'customer01' );

insert into wishlist values('customer01','80나0015');
insert into wishlist values('customer01','80나0014');
insert into wishlist values('customer03','80나0013');
insert into wishlist values('customer01','80나0015');

update member set password='1234' where id='java01' and member_name='김래발' and phonenumber='01000000000';

select * from member;

delete member where id = 'java01';
update member set password=#{password}, address=#{address}, addressdetail = #{addressDetail}, phonenumber=#{phoneNumber}, postcode=#{postCode} where id=#{id}


insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1)
values ('80나0014', 'seller02', '스파르타쿡스', '전설의 불떡볶이와 바삭한 탕수육의 환상조화! 10년 조리경력의 주인장이 운영하는 스파르타쿡스입니다.', '스파르타쿡스_트럭1.PNG');

select * from customer;
select * from seller;
select * from foodtruck;

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1)
values ('80나0014', 'seller02', '스파르타쿡스', '전설의 불떡볶이와 바삭한 탕수육의 환상조화! 10년 조리경력의 주인장이 운영하는 스파르타쿡스입니다.', '스파르타쿡스_트럭1.PNG');

select * from foodtruck where foodtruck_number in (select w.foodtruck_number
from customer c, wishlist w
where c.customer_id = w.customer_id and c.customer_id = 'customer01' );

-- 게시판 상세보기
select freeboard_no, id, freeboard_title, freeboard_content, to_char(freeboard_timeposted,'YYYY.MM.DD HH:mm:ss')
freeboard_timeposted,
freeboard_hits, freeboard_filename1 from freeboard where freeboard_no=8
--게시물 삭제
delete freeboard where freeboard_no=1 

select * from 

select * from foodtruck where foodtruck_number in (select w.foodtruck_number
from customer c, wishlist w
where c.customer_id = w.customer_id and c.customer_id = 'customer01' );


select * from wishlist where customer_id = 'customer01';

select * from foodtruck where foodtruck_number in (select w.foodtruck_number
from customer c, wishlist w
where c.customer_id = w.customer_id and c.customer_id = 'customer01');

select * from wishList where customer_id = 'customer01';
select * from customer;
select * from foodtruck;

insert into wishList (customer_id, foodtruck_number) values ('customer01', '80나0011');

delete from wishlist where customer_id = 'java01' and foodtruck_number = '80나0011';