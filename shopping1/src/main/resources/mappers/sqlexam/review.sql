create table reviews(
review_id int primary key auto_increment,
content varchar(2000) not null,
 product_id int not null,
user_id char(100) not null,
reg_date timestamp default now(),
header varchar(100) not null,
constraint review_product_fk foreign key(product_id) references product(product_id),
constraint review_user_fk foreign key(user_id) references user(user_id));

--
insert into reviews(content,product_id,user_id,header)
 values("ababab<br>afasdfas",419,'admin',"header1");