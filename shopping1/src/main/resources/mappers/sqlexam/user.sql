create table user
(
	user_id char(100) primary key,
	user_num int not null unique auto_increment,
	user_pwd char(120) not null,
	user_name char(120) not null,
	regdate timestamp default now()
	session_id char(50) not null default 'none',
	session_limit date,
	addr2 varchar(300),
	addr1 varchar(300),
	addr_num varchar(20)
);
--