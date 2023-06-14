-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
create table student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);

select * from student

-- 2. Добавить в таблицу student колонку middle_name varchar
alter table student add column middle_name varchar

select * from student

-- 3. Удалить колонку middle_name
alter table student drop column middle_name

select * from student

-- 4. Переименовать колонку birthday в birth_date
alter table student rename birthday to birth_date

select * from student

-- 5. Изменить тип данных колонки phone на varchar(32)
alter table student alter column phone set data type varchar(32)

select * from student

-- 6. Вставить три любых записи с автогенерацией идентификатора
insert into student (first_name, last_name, birth_date, phone) values ('petrov', 'anton', '1995-11-25', '7548');
insert into student (first_name, last_name, birth_date, phone) values ('babyrin', 'slava', '1993-05-12', '8950-782-75-81');
insert into student (first_name, last_name, birth_date, phone) values ('pyatifan', 'roman', '1996-04-15', '8960-753-77-31')

select * from student

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
truncate table student restart identity

select * from student