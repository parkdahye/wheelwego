-------------------------------------------------------------------------------
create sequence survey_seq;
create sequence customerpoint_seq;
create sequence booking_seq;
create sequence review_seq;
create sequence menu_seq;

create sequence information_seq;
create sequence informationcomment_seq;
create sequence qna_seq;
create sequence qnacomment_seq;
create sequence freeboard_seq;
create sequence freeboardcomment_seq;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
create table member(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   member_name varchar2(100) not null,
   address varchar2(100) not null,
   phonenumber varchar2(100) not null,
   member_type varchar2(100) not null
);
-------------------------------------------------------------------------------
drop table member;
-------------------------------------------------------------------------------
create table customer(
	customer_id varchar2(100) primary key,
	constraint customer_id_fk foreign key(customer_id) references member(id)
);
-- ���� ���������� �̸��� ���Ҷ� [���̺��]_[Į����]_[������������] �̷��� �־����� �� ����.kos
-- ���� customer ���� ��쿡�� 
-- ���̺� �� : customer / �÷��� : customer_id / ������������ : fk
-- customer_customer_id_fk�� ������ ��� ȥ���� ���� ������ �� ���
-- ���̺� �� : customer / �÷Ÿ� : id / ������������ : fk
-- customer_id_fk�� �Ѵ�.
-------------------------------------------------------------------------------
drop table customer;
-------------------------------------------------------------------------------
create table seller(
	seller_id varchar2(100) primary key,
	businessnumber varchar2(100) not null,
	constraint seller_id_fk foreign key(seller_id) references member(id)
);
-------------------------------------------------------------------------------
drop table seller;
-------------------------------------------------------------------------------
create table foodtruck(
    foodtruck_number varchar2(100) primary key,
    seller_id varchar2(100) not null,
    foodtruck_name varchar2(100) not null,
    introduction clob not null,
    foodtruck_filename1 varchar2(100) not null,
    foodtruck_filename2 varchar2(100) not null,
    foodtruck_filename3 varchar2(100) not null,
    latitude BINARY_DOUBLE,
    longitude BINARY_DOUBLE,
    constraint foodtruck_id_fk foreign key(seller_id) references seller(seller_id)
);
-------------------------------------------------------------------------------
drop table foodtruck;
-------------------------------------------------------------------------------
create table review(
    review_no varchar2(100) not null,
    foodtruck_number varchar2(100) not null,
    customer_id varchar2(100) not null,
    review_content clob not null,
    review_timeposted date not null,
    grade number not null,
    constraint review_trucknumber_fk foreign key(foodtruck_number) references foodtruck(foodtruck_number),
    constraint review_id_fk foreign key(customer_id) references customer(customer_id),
    CONSTRAINT review_PK PRIMARY KEY(review_no, foodtruck_number)
);
-------------------------------------------------------------------------------
drop table review;
-------------------------------------------------------------------------------
create table menu(
    menu_id varchar2(100) primary key,
    foodtruck_number varchar2(100) not null,
    menu_name varchar2(100) not null,
    menu_price number not null,
    menu_filename varchar2(100) not null,
    constraint menu_trucknumber_fk foreign key(foodtruck_number) references foodtruck(foodtruck_number)
);
-------------------------------------------------------------------------------
drop table menu;
-------------------------------------------------------------------------------
create table booking(
    booking_number varchar2(100) not null,
    customer_id varchar2(100) not null,
    menu_id varchar2(100) not null,
    booking_quantity number not null,
    booking_date date not null,
    booking_state varchar2(100) not null,
    constraint booking_id_fk foreign key(customer_id) references customer(customer_id),
    constraint booking_menu_fk foreign key(menu_id) references menu(menu_id),
    CONSTRAINT booking_PK PRIMARY KEY(booking_number, customer_id, menu_id)
);
-------------------------------------------------------------------------------
drop table booking;
-------------------------------------------------------------------------------
create table customerpoint(
    point_id varchar2(100) primary key,
    booking_number varchar2(100) not null,
    customer_id varchar2(100) not null,
    menu_id varchar2(100) not null,
    point number not null,
    constraint customerpoint_booking_fk foreign key (booking_number, customer_id, menu_id) references booking(booking_number, customer_id, menu_id)
);
-------------------------------------------------------------------------------
drop table customerpoint;
-------------------------------------------------------------------------------
create table survey(
    survey_no varchar2(100) not null,
    customer_id varchar2(100) not null,
    suervey_date date not null,
    constraint survey_id_fk foreign key(customer_id) references customer(customer_id),
    CONSTRAINT survey_PK PRIMARY KEY(survey_no, customer_id)
);
-------------------------------------------------------------------------------
drop table survey;
-------------------------------------------------------------------------------
create table wishlist(
    customer_id varchar2(100) not null,
    foodtruck_number varchar2(100) not null,
    constraint wishlist_id_fk foreign key(customer_id) references customer(customer_id),
    constraint wishlist_trucknumber_fk foreign key(foodtruck_number) references foodtruck(foodtruck_number),
    CONSTRAINT wishlist_PK PRIMARY KEY(customer_id, foodtruck_number)
);
-------------------------------------------------------------------------------
drop table wishlist;
-------------------------------------------------------------------------------
create table qna(
   qna_no varchar2(100) primary key,
   id varchar2(100) not null,
   qna_title varchar2(100) not null,
   qna_content clob not null,
   qna_timeposted date not null,
   qna_hits number default(0),
   qna_filename1 varchar2(100),
   qna_filename2 varchar2(100),
   qna_filename3 varchar2(100),
   constraint qna_id_fk foreign key(id) references member(id)
)
-------------------------------------------------------------------------------
drop table qna;
-------------------------------------------------------------------------------
create table qnacomment(
   qnacomment_no varchar2(100) primary key,
   id varchar2(100) not null,
   qna_no varchar2(100) not null,
   qnacomment_content varchar2(300) not null,
   qnacomment_timeposted date not null,
   qnacomment_parent varchar2(100) not null,
   constraint qnacomment_id_fk foreign key(id) references member(id),
   constraint qnacomment_qnano_fk foreign key(qna_no) references qna(qna_no) ON DELETE CASCADE
);
-------------------------------------------------------------------------------
drop table qnacomment;
-------------------------------------------------------------------------------
create table freeboard(
   freeboard_no varchar2(100) primary key,
   id varchar2(100) not null,
   freeboard_title varchar2(100) not null,
   freeboard_content clob not null,
   freeboard_timeposted date not null,
   freeboard_hits number default(0),
   freeboard_filename1 varchar2(100),
   freeboard_filename2 varchar2(100),
   freeboard_filename3 varchar2(100),
   constraint freeboard_id_fk foreign key(id) references member(id)
);
-------------------------------------------------------------------------------
drop table freeboard;
-------------------------------------------------------------------------------
create table freeboardcomment(
   freeboardcomment_no varchar2(100) primary key,
   id varchar2(100) not null,
   freeboard_no varchar2(100) not null,
   freeboardcomment_content varchar2(300) not null,
   freeboardcomment_timeposted date not null,
   freeboardcomment_parent varchar2(100) not null,
   constraint freeboardcomment_id_fk foreign key(id) references member(id),
   constraint freeboardcomment_boardno_fk foreign key(freeboard_no) references freeboard(freeboard_no) ON DELETE CASCADE
);
-------------------------------------------------------------------------------
drop table freeboardcomment;
-------------------------------------------------------------------------------
create table information(
   information_no varchar2(100) primary key,
   id varchar2(100) not null,
   information_title varchar2(100) not null,
   information_content clob not null,
   information_timeposted date not null,
   information_hits number default(0),
   information_filename1 varchar2(100),
   information_filename2 varchar2(100),
   information_filename3 varchar2(100),
   constraint information_id_fk foreign key(id) references member(id)
)
-------------------------------------------------------------------------------
drop table information;
-------------------------------------------------------------------------------
create table informationcomment(
   informationcomment_no varchar2(100) primary key,
   id varchar2(100) not null,
   information_no varchar2(100) not null,
   informationcomment_content varchar2(300) not null,
   informationcomment_timeposted date not null,
   informationcomment_parent varchar2(100) not null,
   constraint infocomm_id_fk foreign key(id) references member(id),
   constraint infocomm_no_fk foreign key(information_no) references information(information_no) ON DELETE CASCADE
);
-------------------------------------------------------------------------------
drop table informationcomment;
-------------------------------------------------------------------------------