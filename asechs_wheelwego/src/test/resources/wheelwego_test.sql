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
select * from wishlist;


insert into wishlist values('customer01','80나0012');
insert into wishlist values('customer02','80나0014');
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
values ('80나0015', 'seller04', '스파르타쿡스', '전설의 불떡볶이와 바삭한 탕수육의 환상조화! 10년 조리경력의 주인장이 운영하는 스파르타쿡스입니다.', '스파르타쿡스_트럭1.PNG');


-- 게시판 상세보기
select freeboard_no, id, freeboard_title, freeboard_content, to_char(freeboard_timeposted,'YYYY.MM.DD HH:mm:ss')
freeboard_timeposted,
freeboard_hits, freeboard_filename1 from freeboard where freeboard_no=8
--게시물 삭제
delete freeboard where freeboard_no=1 
select * from 
<<<<<<< HEAD
create sequence freeboard_seq start with 52;
=======

select m.member_name as membername
from freeboard f, member m
where m.id=f.id and f.id='java9'
>>>>>>> branch 'master' of https://github.com/parkdahye/wheelwego.git
select * from File
select * from freeboardfile
insert into freeboardfile(freeboard_no, freeboard_filepath) values ('93','한입만모모.jpg');

select f.freeboard_no, f.id, f.freeboard_title, f.freeboard_content,
		 to_char(freeboard_timeposted,'YYYY.MM.DD HH:mm:ss') as f.freeboard_timeposted,
		 f.freeboard_hits, file.freeboard_no, file.freeboardfile_filepath 
from freeboard f, freeboardfile file 
where f.freeboard_no=file.freeboard_no and f.freeboard_no='112'

select b.freeboard_no, b.id, b.freeboard_title, b.freeboard_content, to_char(b.freeboard_timeposted,'YYYY.MM.DD HH:mm:ss') as freeboard_timeposted,
b.freeboard_hits, f.freeboard_no, f.freeboardfile_filepath 
from freeboard b, freeboardfile f where b.freeboard_no=f.freeboard_no and f.freeboard_no='112'

select f.freeboard_no, f.id, f.freeboard_title, f.freeboard_content,
       to_char(f.freeboard_timeposted,'YYYY.MM.DD HH:mm:ss') as freeboard_timeposted, f.freeboard_hits, fi.freeboard_no, fi.freeboard_filepath
from freeboard f, freeboardfile fi 
where f.freeboard_no=fi.freeboard_no and f.freeboard_no='112'

md
cm










