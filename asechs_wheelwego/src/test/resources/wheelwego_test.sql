----------dbTEST---------------------

insert into member values ('java01', 'java01', '김래발', '판교', '010-1111-1111', '일반회원');
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
select * from customer;
select * from seller;

delete from member;
delete from customer;
delete from seller;

select password from member where id ='java01';

select password from member where id = 'java01';

select * from member;