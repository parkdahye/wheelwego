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

insert into member values ('java01', 'java01', '김래발', '판교','코스타', '010-1111-1111', '일반회원','1234');
>>>>>>> branch 'master' of https://github.com/parkdahye/wheelwego.git
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


select * from seller;
select * from foodtruck;
select * from member;
select * from menu;

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

-- 게시판 상세보기
select freeboard_no, id, freeboard_title, freeboard_content, to_char(freeboard_timeposted,'YYYY.MM.DD HH:mm:ss')
freeboard_hits, freeboard_filename1 from freeboard where freeboard_no=2

--게시물 삭제
delete freeboard where freeboard_no=1 
