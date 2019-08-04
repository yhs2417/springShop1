create table user
(
	user_id char(100) primary key,
	user_num int not null unique auto_increment,
	user_pwd char(120) not null,
	user_name char(120) not null,
	regdate timestamp default now()
);
<<<<<<< HEAD
	
alter table user add column session_id char(50) not null default 'none';
alter table user add column session_limit date;

 alter table user add addr2 varchar(300);
alter table user add addr1 varchar(300); 
alter table user add addr_num varchar(20);
=======
--
>>>>>>> branch 'Develop' of https://github.com/yhs2417/springShop1.git
