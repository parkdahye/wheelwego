
----------dbTEST---------------------
select * from member
delete from foodtruck where foodtruck_name='현지네트럭'
select * from seller
select * from menu
select * from FOODTRUCK where foodtruck_name='꼬부랑아이스크림'
select * from FOODTRUCKFILE where foodtruck_number='80나0004'
select * from FOODTRUCKFILE
select * from customer
select * from FOODTRUCK
select * from REVIEW
select * from FOODTRUCKFILE where foodtruck_number='80나0036'
select * from FOODTRUCKFILE
select * from menu
select * from menu where foodtruck_number='80나0001'
insert into MEMBER values('customer01','1234','정현지','위례','경기도 하남시 학암동','01022552716','customer','12345');
select t.*, f.foodtruck_filepath, m.menu_filename
		from(select * from foodtruck)t, foodtruckfile f, menu m
		where t.foodtruck_number=f.foodtruck_number and t.foodtruck_number=m.foodtruck_number and t.foodtruck_number='80나0001'
select * from menu where foodtruck_number='80나0001'
		--foodtruck detail test
select t.*, f.foodtruck_filepath, m.menu_filename
		from(select * from foodtruck)t, foodtruckfile f, menu m
		where t.foodtruck_number=f.foodtruck_number and t.foodtruck_number=m.foodtruck_number and t.foodtruck_number='80나0001'
select t.*, f.foodtruck_filepath
		from(select * from foodtruck)t, foodtruckfile f
		where t.foodtruck_number=f.foodtruck_number
-- pagingbean 적용 푸드트럭 리스트
select t.*, f.foodtruck_filepath
		from(select * from foodtruck)t, foodtruckfile f
		where t.foodtruck_number=f.foodtruck_number and t.foodtruck_name like '%' || '트럭' || '%'
--
	select f.foodtruck_filepath, t.foodtruck_name FROM foodtruck t, foodtruckfile f
	where t.foodtruck_number=f.foodtruck_number
-- 검색 결과 푸드트럭 리스트
SELECT f.foodtruck_filepath, t.foodtruck_name FROM(
		SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_filename1, foodtruck_name from foodtruck)
		f where rnum between #{startRowNumber} and #{endRowNumber}

----------dbTEST---------------------
insert into member values ('seller01', '1234', '김래발', '판교','코스타', '010-1111-1111', 'seller','1234');
>>>>>>> branch 'master' of https://github.com/parkdahye/wheelwego.git
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
	SELECT f.foodtruck_filename1, f.foodtruck_name FROM(
		SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_filename1, foodtruck_name from foodtruck
		)f where rnum between 1 and 5

insert into member values ('java01', 'java01', '김래발', '판교','코스타', '010-1111-1111', '일반회원','1234');
insert into member values ('seller02', '1234', '김래발', '판교','코스타', '010-1111-1111', 'seller','1234');
update member set member_type='0' where id='java01';
delete from member;
select * from foodtruck;
delete from member where id = 'seller02';
select * from member;
select * from seller;
delete member where id='java'
delete seller where seller_id='java'
insert into customer values ('java01');
insert into seller values ('seller01','1231');
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
select * from wishlist ;
select * from wishlist where id = 'customer01';
-- 푸드트럭 위시리스트 sql문
select * from foodtruck where foodtruck_number in (select w.foodtruck_number
from customer c, wishlist w
where c.customer_id = w.customer_id and c.customer_id = 'customer01' );

select * from wishlist where customer_id = 'customer01';
insert into wishlist values('customer01','80나0001');
insert into wishlist values('customer01','80나0002');
insert into wishlist values('customer01','80나0003');
insert into wishlist values('customer01','80나0015');

select * from foodtruck;

delete from wishlist;

select * from seller;

update member set password='1234' where id='java01' and member_name='김래발' and phonenumber='01000000000';

select * from member;

delete member where id = 'java01';
update member set password=#{password}, address=#{address}, addressdetail = #{addressDetail}, phonenumber=#{phoneNumber}, postcode=#{postCode} where id=#{id}


insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction, foodtruck_filename1)
values ('80나0014', 'seller01', '스파르타쿡스', '전설의 불떡볶이와 바삭한 탕수육의 환상조화! 10년 조리경력의 주인장이 운영하는 스파르타쿡스입니다.', '스파르타쿡스_트럭1.PNG');

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
freeboard_hits  from freeboard where freeboard_no=8
--게시물 삭제
delete freeboard where freeboard_no=1 
select foodtruck_name, foodtruck_filename1 from foodtruck where foodtruck_name like '%' || '트럭' || '%' 
select row_number() over(order by foodtruck_number desc)as rnum, foodtruck_name, foodtruck_filename1 from foodtruck where foodtruck_name like '%' || '트럭' || '%' 
SELECT f.foodtruck_filename1, f.foodtruck_name FROM(
		SELECT row_number() over(order by foodtruck_number desc) as rnum, foodtruck_filename1, foodtruck_name from foodtruck 
		where foodtruck_name like '%' || '트럭' || '%'
		)f  where rnum between 1 and 5
 

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
select * from 
create sequence freeboard_seq;


select m.member_name as membername
from freeboard f, member m
where m.id=f.id and f.id='java9'


select * from customer;

 select t.*, f.foodtruck_filepath   
 from(select * from foodtruck)t, foodtruckfile f    
 where t.foodtruck_number=f.foodtruck_number


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
from freeboard f, freeboardfile fi 
where f.freeboard_no=fi.freeboard_no and f.freeboard_no='112'

    
insert into review values (review_seq.nextval, '2523','customer1','맛있어요',sysdate, 4);
select review_no,foodtruck_number,customer_id,review_content, to_char(review_timeposted,'YYYY.MM.DD'), grade from review


select freeboard_no, id, freeboard_title, freeboard_content, to_char(freeboard_timeposted,'YYYY.MM.DD HH:mm:ss') as freeboard_timeposted,
		freeboard_hits from freeboard where freeboard_no='118'
		
select freeboard_no, id, freeboard_title, freeboard_content, to_char(freeboard_timeposted,'YYYY.MM.DD HH:mm:ss') as freeboard_timeposted,
		freeboard_hits from freeboard where freeboard_no='118'

select m.member_name as memberName from freeboard f, member m where m.id=f.id and f.id='java101' and f.freeboard_no='118'


	SELECT f.freeboard_no, f.id, f.freeboard_title, f.freeboard_content, f.freeboard_timePosted, f.freeboard_hits, m.id FROM(
		SELECT row_number() over(order by freeboard_no desc) as rnum, freeboard_no, id, freeboard_title, freeboard_content,
		to_char(freeboard_timePosted,'YYYY.MM.DD') as freeboard_timePosted , freeboard_hits from freeboard
		)f, member m where f.id=m.id and rnum between startRowNumber and endRowNumber
		order by freeboard_no desc


	SELECT f.freeboard_no, f.id, f.freeboard_title, f.freeboard_content, f.freeboard_timePosted, f.freeboard_hits, m.id FROM(
		SELECT row_number() over(order by freeboard_no desc) as rnum, freeboard_no, id, freeboard_title, freeboard_content,
		to_char(freeboard_timePosted,'YYYY.MM.DD') as freeboard_timePosted , freeboard_hits from freeboard
		)f, member m where f.id=m.id and rnum between 1 and 30
		order by freeboard_no desc


select * from foodtruck;

commit

insert into foodtruck ()

delete from seller;

delete from foodtruck;
delete from foodtruckfile;

insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction) values('80나0001', 'seller01', '봉군타코', '도시위에 멕시칸! 바로 봉군타코에서 느낄 수 있습니다.');
insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction) values('80나0002', 'seller02', '깡스푸드', '도시위에 멕시칸! 바로 봉군타코에서 느낄 수 있습니다.');
insert into foodtruck (foodtruck_number, seller_id, foodtruck_name, introduction) values('80나0003', 'seller03', '래발푸드', '도시위에 멕시칸! 바로 봉군타코에서 느낄 수 있습니다.');

insert into foodtruckfile(foodtruck_number,foodtruck_filepath) values ('80나0001', 'Friend_트럭1.jpg');
insert into foodtruckfile(foodtruck_number,foodtruck_filepath) values ('80나0002', '그남자의소시지_트럭1.PNG');
insert into foodtruckfile(foodtruck_number,foodtruck_filepath) values ('80나0003', '깡스푸드_트럭1.JPG');



select foodtruck_number from wishlist where customer_id = 'customer01';

select t.*, f.FOODTRUCK_FILEPATH 
from foodtruck t, foodtruckfile f
where t.foodtruck_number = f.foodtruck_number;

	select * from foodtruck where foodtruck_number in (select
	w.foodtruck_number
	from customer c, wishlist w
	where c.customer_id = w.customer_id and c.customer_id = 'cusomter01');
	
	select * from foodtruckfile;
	
select t.*, f.foodtruck_filepath
from(select * from foodtruck where foodtruck_number=#{value})t, foodtruckfile f
where t.foodtruck_number=f.foodtruck_number	

		
		
select * from foodtruck where foodtruck_number in 

select foodtruck_number from wishlist where customer_id=  'customer01';
		
select menu_id,foodtruck_number,menu_name,menu_price,menu_filename from menu where foodtruck_number='80나0001' order by menu_id asc

select t.*, f.foodtruck_filepath from foodtruck t, foodtruckfile f 
where f.foodtruck_number in 
(select foodtruck_number from wishlist where customer_id = 'customer01')
and t.foodtruck_number = f.foodtruck_number;

select * from foodtruck
where foodtruck_number in (
select w.foodtruck_number from customer c, wishlist w
where c.customer_id = 'cusomter01' and c.customer_id = w.customer_id);

SELECT A.MBR_ID, B.MBR_ID
FROM MEMBER A
INNER JOIN MEMBER B ON A.MBR_ID = B.MBR_ID


select * from wishlist where customer_id = 'customer01'

select * from foodtruckfile;
select * from wishlist;

insert into review(review_no,foodtruck_number,customer_id,review_content,review_timeposted,grade) 
values(review_seq.nextval,'1234','customer2','굿~~',sysdate,4);
insert into review(review_no,foodtruck_number,customer_id,review_content,review_timeposted,grade) 
values(review_seq.nextval,'1234','customer1','맛있음~~',sysdate,4);

SELECT * FROM FOODTRUCK
select *
from
(select row_number() over(order by review_no desc) as rnum ,review_no,foodtruck_number,customer_id,
review_content,to_char(review_timeposted,'YYYY.MM.DD') as review_timeposted, grade from review
where foodtruck_number='1234')
where rnum between 1 and 5;

	insert into freeboardfile(freeboard_no, freeboardfile_filepath)values(#{fileVO.no},#{fileVO.filepath})

	update freeboardfile set freeboardfile_filepath=#{value} where freeboard_no=#{fileVO.no} and freeboardfile_filepath=#{fileVO.filepath}
	update freeboardfile set freeboardfile_filepath='c.jpg' where freeboardfile_filepath='b.jpg' and freeboard_no=77


select * from freeboardfile










