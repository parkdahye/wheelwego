----------dbTEST---------------------

insert into member values ('java01', 'java01', '김래발', '판교', '010-1111-1111', '일반회원');
delete from member;
select * from member;
insert into customer values ('java01');
delete from customer;
select c.customer_id, m.password, m.member_name, m.address, m.phonenumber, m.member_type
from customer c, member m
where c.customer_id = m.id;
--로그인
select id,password,member_name,address,phonenumber,member_type from member where id='java01' and password='java01'

select * from member;