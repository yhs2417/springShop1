create table orders(
order_id int primary key auto_increment,
user_id char(100) not null,
product_id int not null,
count int not null,
order_date timestamp not null default now(),
constraint order_product_fk foreign key(product_id) references product(product_id),
constraint order_user_fk foreign key(user_id) references user(user_id));

--