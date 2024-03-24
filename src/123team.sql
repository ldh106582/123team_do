create database 123team_db default character set  utf8 collate utf8_general_ci;
use 123team_db;
drop database 123team_db;
create table if not exists Person
(
    PersonId varchar(20) not null primary key,
    PersonPw varchar(20) not null,
    PersonEmail varchar(20) null,
    PersonAddress varchar(30) not null,
    PersonName varchar(10) not null,
    PersonBirth date not null,
    PersonSex varchar(2) not null,
    PersonPhone varchar(15) not null,
   Type varchar(3) not null,
       Image varchar(100)
    
)default charset=utf8 ;

insert into person values("ehgus190", "1234", "ehgus190@naver.com", "김해시", "이도현", "1993-08-26", "남", "010", "c");
insert into person values("ehgus191", "1234", "ehgus190@naver.com", "김해시", "이도현", "1993-08-26", "남", "010", "p", "dog.jpg");
insert into person values("hanui", "1234", "hanui@naver.com", "김해시", "김한의사", "2007-02-22", "남", "010", "h");
select * from Person;
delete from person where personId="ehgus19";
update Person set Type="c" where PersonId="ehgus193";
alter table Person modify column PersonAddress varchar(100);
alter table person modify column PersonEmail varchar(50) not null;
alter table person add column image varchar(100);

create table if not exists Pet
(
   PetId varchar(20) not null primary key,
    PetName varchar(10) not null,
    PetType varchar(20) not null,
    PetVarity varchar(20) null,
    PetSex varchar(2),
    PetBirth date not null,
    petimage varchar(100),
    PersonId varchar(20) not null,
    
    foreign key(PersonId) references Person(PersonId)
    
)default charset=utf8;

insert into Pet values("forme", "포미", "강아지", "포메라니안", "여자", "2022-12-24", "이미지","ehgus190");
insert into Pet values("forme2", "포미", "강아지", "포메라니안", "여자", "2022-12-24", "이미지","ehgus191");
insert into Pet values("forme1", "포미1", "강아지", "포메라니안", "여자", "2022-12-24", "이미지","ehgus191");
select * from Pet;
drop table pet;
delete from pet where petId="forme";
select * from pet;

create table if not exists PetWeight(
   PetWeightNum int auto_increment primary key,
   PetWeightDate date null,
    PetWeight varchar(3),
    
    PetId varchar(100),
    
    foreign key (PetId) references Pet(PetId)
)default charset=utf8;

insert into PetWeight value("1","2022-02-11","5", "forme");
select * from PetWeight;

create table if not exists petchart(
   petChartNum int AUTO_INCREMENT primary key,
    petChartDate date not null,
    petChart varchar(100) null,
    petChartContent text null,
    
    PetId varchar(100) not null
    
)default charset=utf8;

insert into petchart value("1","2024-02-28","진료확인","예방접종완료","ehgus190");

create table if not exists petVaccination(
   petVaccinationNum int AUTO_INCREMENT primary key,
    petVaccinationDate date not null,
    petVaccination varchar(100) null,
    petVaccinationCotent text null,
    
    PetId varchar(100) not null
    
)default charset=utf8;
insert into petVaccination value("1","2022-02-22", "심장사사충", "접종완료", "forme");
select * from petVaccination;

create table if not exists PetSurgery(
   PetSurgeryNum int primary key auto_increment,
   PetSurgeryDate date null,
    PetSurgeryName varchar(100) null,
    PetSurgeryContent text null,
   
    PetId varchar(100) not null
)default charset=utf8;
insert into PetSurgery values ("1","2022-02-22", "성전환수술", "이제 성이 없음", "forme");
select * from PetSurgery;

create table if not exists PetSurgeryAfter(
   PetSurgeryAfterNum int primary key auto_increment,
    PetSurgeryAfterDate date null,
    PetSurgeryAfterContent text null,
     
   PetId varchar(100) not null
)default charset=utf8;
insert into PetSurgeryAfter values("1","2022-02-22", "문제없음", "forme");
select * from PetSurgeryAfter;

drop table pet;
drop table person;
drop table PetWeight;
drop table PetChart;
drop table petVaccination;
drop table PetSurgery;
drop table PetSurgeryAfter;

create table if not exists ProductMember(
   PersonId varchar(20) primary key not null,
    PersonPw varchar(30) not null,
    PersonEmail varchar(30) not null,
   PersonAddress varchar(100) not null,
    PersonName varchar(10) not null,
   PersonBirth date not null,
    PersonSex  varchar(2) not null,
    PersonPhone varchar(20) not null,
    CompanyName varchar(100) not null,
    CompanyAddress varchar(100) not null,
    CompanyPhone varchar(20) null,
    s_image varchar(100) not null, -- 사업자등록증
    type varchar(3) not null

)default charset=utf8;
insert into ProductMember VALUES("ehgus191", "1234", "ehgus190@naver.com", "김해시","이도현", "1993-08-26", "남","010", "네번째기차", "창원시", "055", "registration", "P");
select * from ProductMember;
delete from ProductMember where PersonId ="ehgus19";
drop table ProductMember;

create table if not exists ShoppingCart(
   
    shoppingCartId int not null primary key auto_increment,
    ProductId  varchar(100) not null,
    ProductName varchar(100),
    ProductPrice int,
    ProductCategory varchar(10) not null, 
    ProductImage varchar(100),
    amount int,
    personId varchar(100)
    
)default charset=utf8;

select * from ShoppingCart;
drop table ShoppingCart;

-- 주문 db
CREATE TABLE IF NOT EXISTS Ordertable (
    orderNum INT AUTO_INCREMENT PRIMARY KEY, --
    productId VARCHAR(100) NOT NULL, --
    productName VARCHAR(100) NOT NULL, --
    amount INT NOT NULL, --
    price INT NOT NULL, --
    orderDate DATE NOT NULL, --
    totalPrice INT NOT NULL, --
    personId VARCHAR(100) NOT NULL,
    managerId VARCHAR(100) NOT NULL,
    state varchar(10) NOT null,
    addr varchar(100) not null
    
) DEFAULT CHARSET=utf8;

select * from Ordertable;
insert into Ordertable value("1","prodcut01","강아지 배변패드","1","15000","2024-02-29","15000","ehgus191");
alter table ordertable add column managerId  VARCHAR(100) NOT NULL;
alter table ordertable add column   state varchar(10) NOT NULL;
alter table ordertable modify column productId varchar(100); 
drop table Ordertable;

create table if not exists HospitalMember(
    PersonId varchar(20) primary key not null,
    PersonPw varchar(30) not null,
    PersonEmail varchar(30) not null,
    PersonAddress varchar(100) not null,
    PersonName varchar(100) not null,
    personPhone varchar(20) not null,
    PersonBirth date not null,
    PersonSex  varchar(10) not null,
    hospitalName varchar(100) not null,
    hospitalAddress varchar(100) not null,
    hospitalPhone varchar(20) null,
    s_image varchar(100) not null, -- 사업자등록증
    h_image varchar(100) not null, -- 의사면허증
    type varchar(10) not null

)default charset=utf8;

insert into HospitalMember value("ehgus198", "1234", "fadsf@adsf",  "Yeorae-ri, Jinyoung-eup, Gimhae-si, Gyeongnam.", "doyheon", "010" ,"2024-02-28","남자", "ㅁㅇㄹ", "Yeorae-ri, Jinyoung-eup, Gimhae-si, Gyeongnam.","01093341065", "img1", "img2", "h");
select * from HospitalMember;
drop table HospitalMember;
update HospitalMember set personPhone="010" where personId="ehgus198";
delete from HospitalMember where personId ="ehgus19";

-- 체험단 manager
create table if not exists Ex_Manager(
	PersonId varchar(20) primary key not null,
    personPw varchar(20),
    s_image varchar(100),
    ex_name varchar(100) not null,
    ex_phone varchar(20),
    ex_Address varchar(100) not null,
    type varchar(10) not null
    
)default charset=utf8;

insert into Ex_Manager value("ehgus194","1234","image","행복한체험단","010","김해시", "e");
select * from Ex_Manager;
drop table Ex_Manager;

-- productReview
create table if not exists ProductReview(
   ReviewId int auto_increment primary key,
    context text,
    ReviewScore int,
    Reviewimage varchar(100),
    purchaseTime DATE,
    title varchar(50),
    
    productId varchar(100),
   personId varchar(100)

)default charset=utf8;

insert into ProductReview values("1", "정말 좋아요", "5", "img01", "2024-02-29", "구매후기","product01","ehgus191");
insert into ProductReview values("2", "정말 좋아요", "5", "img01", "2024-02-29", "구매후기","product01","ehgus190");
insert into ProductReview values("3", "정말 좋아요", "5", "img01", "2024-02-29", "구매후기","product01","ehgus192");
insert into ProductReview values("4", "정말 좋아요", "5", "img01", "2024-02-29", "구매후기","product01","ehgus193");
drop table ProductReview;
select * from ProductReview;

-- 한의 db 취합 2024-02-22 FBoard / BoardComment / NBoard / Nboard (체험단신청) / EApllication / ENBoard / Product

create table FBoard(
    PersonId varchar(20) not null,
    Context text not null,
    Title varchar(30) not null,
    Hit int,
    RegistDay date not null,
    BoardId varchar(50) primary key
)default charset=utf8;


drop table BoardComment;
create table BoardComment(
   BoardId varchar(50) not null,
    comment text not null,
    RegistDay date not null,
    PersonId varchar(20) not null,
    commentId varchar(50) primary key
)default charset=utf8;


 create table NBoard(
    PersonId varchar(20) not null,
    Context text not null,
    Title varchar(30) not null,
    Hit int,
    RegistDay date not null,
    BoardId varchar(50) primary key
)default charset=utf8;

select * from Nboard;
-- 체험단 신청 
create table EApllication(
   Experience varchar(20) not null, -- 놀이,사진찍기,알러지
    Animal varchar(10) not null, -- 강아지 고양이  
    RegistDay date not null, -- 예약일
    state varchar(10) default "처리중", -- 상태 (처리중,예약취소,예약완료)
    
    Title varchar(20) not null,
    PersonId varchar(20) not null,
    Eid varchar(20) primary key,
    Mid varchar(20) not null
)default charset=utf8;

select * from EApllication where PersonId='ehgus190';
insert into EApllication value("사진찍기", "강아지", "2024-02-02", "처리중", "사진찍기", "ehgus190", "01", "ehgus197");

drop table EApllication;
select * from EApllication;

-- 체험 공고 등록
create table ENBoard(
    Context text not null,
    Title varchar(30) not null,
    Hit int,
    RegistDay date not null, -- 공고 등록일
    Experience varchar(20) not null,
    Animal varchar(10) not null,
    BoardId varchar(50) primary key,
    PersonId varchar(20) not null
)default charset=utf8; 

drop table ENboard;

select * from ENBoard;

insert into NBoard values("id1","내용1","제목1","1","2000-01-01","1");
insert into NBoard values("id2","내용2","제목2","2","2000-02-02","2");
insert into NBoard values("id3","내용3","제목3","3","2000-03-03","3");
insert into NBoard values("id4","내용4","제목4","4","2000-04-04","4");

delete from FBoard where num=1;
select * from FBoard;
select * from NBoard;
drop table NBoard;
select * from BoardComment;
select BoardId from BoardComment;
select * from BoardComment where commentId="1707876727279";

drop table Product;
create table if not exists Product(
    ProductId varchar(100) primary key not null,
    ProductName varchar(50) not null,
    ProductPrice int not null,
    ProductCategory varchar(10) not null, -- 껌 간식 등
    ProductDscription text null,
    ReleaseDate date not null,
    ProductUnitStock int not null,
    ProductImage varchar(100) null,
    
    PersonId varchar(10),
    AnimalCategory varchar(10) not null -- 강아지, 고양이, 파충류 등
)default charset=utf8;
insert into Product values("product01", "강아지 배변패드" , "15000",  "강아지", "강아지 용품", "2022-02-19", "10", "Productdog1", "ehgus191", "강아지") ;
insert into Product values("product02", "강아지 배변패드" , "15000",  "강아지", "강아지 용품", "2022-02-19", "10", "Productdog1", "ehgus191", "고양이");
select * from Product;
delete from Product where personId="cat";
drop table product;

create table hospital(
   name varchar(30) not null,
    addr varchar(30) not null,
    number varchar(30) not null,
    runtime text not null,
    
    hid varchar(30) not null primary key,
    parking text not null,
    description text not null,
    personId varchar(30) not null,
    
    image text null,
    x varchar(20) not null,
    y varchar(20) not null,
    reviewScore float,
    reviewCount int
)default charset=utf8;
insert into hospital values("개병원","창
원시어딘가","010-1001-1011","매주 주말 휴무,평일 아침9시 ~ 밤10시","병원아이디1","시장에주차 ㄱㄱ","잡병원","hanui","id1","x","y","0","0");
insert into hospital values("개병원","창
원시어딘가","010-1001-1011","매주 주말 휴무,평일 아침9시 ~ 밤10시","병원아이디2","시장에주차 ㄱㄱ","잡병원","hanui","id1","x","y","0","0");
insert into hospital values("개병원","창
원시어딘가","010-1001-1011","매주 주말 휴무,평일 아침9시 ~ 밤10시","병원아이디3","시장에주차 ㄱㄱ","잡병원","hanui","id1","x","y","0","0");
select * from hospital;
drop table hospital;


create table HApllication(
    registDay datetime not null, -- 예약일
    personId varchar(20) not null,  -- 예약자ID 
    bid varchar(20) primary key, -- 예약 고유번호 
    mid varchar(20) not null, -- 예약관리자 ID
    
    hospitalName varchar(20) not null,
    hid varchar(20) not null, -- 예약하는 병원 ID
    petId varchar(50) not null, -- 동물 이름
    context varchar(20) null,
    state varchar(10) not null,
    alarm varchar(20)
    
)default charset=utf8;
select * from HApllication;
drop  table HApllication;
insert into HApllication value("2024-03-06", "ehgus190", "01", "ehgus199", "개병원", "병원아이디1", "forme", "dadfadsfasdf", "ddddddasdf","");

drop  table HospitalReview;
create table HospitalReview(
   hid varchar(20) not null,
    PersonId varchar(20) not null,
    title varchar(20) not null,
    context text not null,
    reviewScore int,
    reviewImage varchar(100),
    
    RegistDay date not null,
    ReviewId varchar(50) primary key
)default charset=utf8;

insert into HospitalReview values("병원아이디1","리뷰작성자아이디","제목1","내용1","5","사진","2000-01-01","리뷰고유아이디1");
insert into HospitalReview values("병원아이디1","리뷰작성자아이디","제목1","내용1","5","사진","2000-01-01","리뷰고유아이디2");
insert into HospitalReview values("병원아이디1","리뷰작성자아이디","제목1","내용1","5","사진","2000-01-01","리뷰고유아이디3");
insert into HospitalReview values("병원아이디1","리뷰작성자아이디","제목1","내용1","5","사진","2000-01-01","리뷰고유아이디4");
insert into HospitalReview values("병원아이디1","리뷰작성자아이디","제목1","내용1","7","사진","2000-01-01","리뷰고유아이디13");

insert into HospitalReview values("병원아이디2","리뷰작성자아이디","제목1","내용1","4","사진","2000-01-01","리뷰고유아이디5");
insert into HospitalReview values("병원아이디2","리뷰작성자아이디","제목1","내용1","4","사진","2000-01-01","리뷰고유아이디6");
insert into HospitalReview values("병원아이디2","리뷰작성자아이디","제목1","내용1","4","사진","2000-01-01","리뷰고유아이디7");
insert into HospitalReview values("병원아이디2","리뷰작성자아이디","제목1","내용1","4","사진","2000-01-01","리뷰고유아이디8");

insert into HospitalReview values("병원아이디3","리뷰작성자아이디","제목1","내용1","3","사진","2000-01-01","리뷰고유아이디9");
insert into HospitalReview values("병원아이디3","리뷰작성자아이디","제목1","내용1","3","사진","2000-01-01","리뷰고유아이디10");
insert into HospitalReview values("병원아이디3","리뷰작성자아이디","제목1","내용1","3","사진","2000-01-01","리뷰고유아이디11");
insert into HospitalReview values("병원아이디3","리뷰작성자아이디","제목1","내용1","3","사진","2000-01-01","리뷰고유아이디12");
select * from HospitalReview; 
drop table HospitalReview;

create table QnA
(
   personId varchar(20) not null,
    productId varchar(20) not null,
    Title varchar(30) not null,
    Context text not null,
    Hit int,
    RegistDay date not null,
    image text default null,
    QnAId varchar(50) not null primary key
)default charset=utf8;