 create table product_category(
 category_id int primary key auto_increment,
 category varchar(30) not null unique);

insert into product_category(category) values ("computer");

-------------------
create table company(
 company_id int primary key auto_increment,
category varchar(30) not null,
 company_name varchar(30) not null unique);

 alter table company add constraint pro_category_fk foreign key(category) references product_category(category);

 alter table company drop foreign key category_id_fk;

insert into company(category, company_name)values ("NoteBook", "samsung");

SELECT constraint_name, constraint_type
    ->
    -> FROM information_schema.table_constraints
    ->
    -> where table_name='company';
------------------
CREATE TABLE PRODUCT (
product_id int primary key auto_increment,
product_name varchar(40) not null,
price int not null,
reg_date timestamp not null default now(),
category varchar(30) not null,
company_name varchar(30) not null,
explain1 varchar(1000),
explain2 varchar(5000),
thumnail varchar(300),
recommend int not null default 0
 constraint category_fk foreign key(category) references product_category(category));

alter table product add constraint company_name_fk foreign key(company_name)
 references company(company_name);

insert into product(product_name, price, category,company_name, explain1)
 values("sense2019",1200000,"computer","samsung","testing testing testing");