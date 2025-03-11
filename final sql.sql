CREATE DATABASE qm_ictprg431;
CREATE USER 'user_1'@'localhost' IDENTIFIED BY '123456'; 
USE qm_ictprg431;

CREATE TABLE employees (
	id bigint unsigned auto_increment primary key, 
    given_name varchar(64) null, 
    family_name varchar(64) not null,
    date_of_birth date not null,
    gender_identity char null,
	gross_salary bigint default 0,
    supervisor_id bigint default 0, 
    branch_id bigint,
    created_at timestamp default '2022-07-01', 
    updated_at timestamp
);

INSERT INTO employees 
(id, given_name, family_name, date_of_birth, gender_identity, gross_salary, supervisor_id, branch_id) 
VALUES 
(102, 'Michael', 'Scott', '1964-03-15', 'O', 75000, 2, 100),
(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 2, 102),
(104, 'Kelly', 'Kapoor', '1980-02-05', 'O', 55000, 2, 102), 
(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 2, 102),
(106, 'Josh', 'Perter', '1969-09-05', 'M', 78000, 3, 100),
(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 3, 106), 
(108, 'Jen', 'Helbert', '1978-10-01', 'F', 71000, 3, 106); 
    
CREATE TABLE branches ( 
	id bigint unsigned auto_increment primary key, 
    branch_name varchar(64) not null default 'error', 
    manager_id bigint unsigned default 0, 
    manager_started_at date not null default '1970-01-01', 
    created_at timestamp not null default current_timestamp, 
    updated_at timestamp null on update current_timestamp 
);
INSERT INTO branches 
(id, branch_name, manager_id, manager_start_at)
VALUES 
(1, 'Corporate', 100, '2006-02-09'), 
(2, 'Scranton', 102, '1992-04-06'), 
(3, 'Stamford', 106, '1998-02-13');

CREATE TABLE clients (
	client_id bigint unsigned auto_increment primary key,
    client_name varchar(64),
    branch_id int, 
    created_at timestamp not null default current_timestamp,
    updated_at timestamp null on update current_timestamp
); 

INSERT INTO clients 
(client_id, client_name, branch_id) 
VALUES 
(400, 'Dunmore Hoghschool', 2),
(401, 'Lackawana Country', 2),
(402, 'FedEx', 3),
(403, 'John Daly law, LLC', 3),
(404, 'Scranton Whitepages', 2),
(405, 'Times Newspaper', 3),
(406, 'FedEx', 2); 

CREATE TABLE working_with (
	employee_id bigint unsigned not null,
    client_id bigint unsigned not null,
    total_sales bigint unsigned default 0,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp null on update current_timestamp,
    PRIMARY KEY (employee_id, client_id), 
    FOREIGN KEY (employee_id) REFERENCES employees(id),
	FOREIGN KEY (client_id) REFERENCES clients(client_id)
); 

INSERT INTO working_with 
(employee_id, client_id, total_sales) 
VALUES 
(105, 400, 55000), 
(102, 401, 267000), 
(108, 402, 22500), 
(107, 403, 5000),
(108, 403, 33000),
(105, 404, 26000);

CREATE TABLE branch_supplier ( 
	branch_id bigint unsigned not null primary key,
    supplier_name varchar(64),
    product_supplied varchar(64),
    created_at timestamp not null default current_timestamp,
    updated_at timestamp on update current_timestamp
); 

INSERT INTO branch_supplier 
(branch_id, supplier_name, product_supplied) 
VALUES 
(2, 'Hammer Mill', 'Paper'), 
(3, 'Uni-ba;ll', 'Writting instruments'),
(4, 'Patriot Paper', 'Paper'), 
(5, 'Stamford Labels', 'Custom Forms');

CREATE TABLE dummy ( 
	employee_id int,
    employee_name varchar(20) 
); 

ALTER TABLE working_with ADD COLUMN profit int;
RENAME TABLE dummy TO almost_dummy; 
ALTER TABLE working_with DROP COLUMN profit; 
DESCRIBE branch_supplier; 
    
