create table cart(
cart_id int primary key auto_increment,
user_id char(100) not null,
product_id int not null,
count int not null,
constraint cart_product_fk foreign key(product_id) references product(product_id),
constraint cart_user_fk foreign key(user_id) references user(user_id));

insert into cart(user_id,product_id,count) values('admin',419,3);