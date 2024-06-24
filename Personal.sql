--создание таблицы отделов, в которой хранится ID отдела и его название
create table if not exists department (
	department_id SERIAL primary key,
	department_name varchar (10) not null	
);

--таблица руководителей отделов, в которй хранится 
--ID менеджера, ID отдела, которым он руководит и имя менеджера
--теоритически менеджер может возглавлять несколько отделов
create table if not exists manager (
	manager_id SERIAL primary key,
	department_id integer not null references department(department_id),
	manager_name varchar (30) not null
);

--таблица сотрудников отделов, в которй хранится 
--ID сотрудника, ID отдела и имя сотрудника. Сотрудник работает в одном отделе
--и имеет одного руководителя что определяется составным ключом.
create table if not exists employee (
	manager_id integer not null references manager(manager_id),
	department_id integer not null references department(department_id),
	employee_name varchar (30) not null,
	constraint mngr_dpr primary key (manager_id, department_id) 
);
