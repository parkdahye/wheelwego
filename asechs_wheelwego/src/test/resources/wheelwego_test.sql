----------dbTEST---------------------

insert into member values ('java01', 'java01', '김래발', '판교','코스타', '010-1111-1111', '일반회원','1234');
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

--단골트럭 등록
insert into wishlist values('java01','80나0011');
insert into wishlist values('java01','80나0012');
insert into wishlist values('java01','80나0013');
insert into wishlist values('java01','80나0014');
insert into wishlist values('java01','80나0015');
insert into wishlist values('java01','80나0016');
insert into wishlist values('java01','80나0017');
insert into wishlist values('java01','80나0018');
insert into wishlist values('java01','80나0019');
insert into wishlist values('java01','80나0020');

