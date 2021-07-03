--
-- File generated with SQLiteStudio v3.3.3 on Sat Jul 3 14:39:04 2021
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Countries
CREATE TABLE Countries (country_id INTEGER PRIMARY KEY, country_name STRING);
INSERT INTO Countries (country_id, country_name) VALUES (1, 'Australia');
INSERT INTO Countries (country_id, country_name) VALUES (2, 'Vietnam');
INSERT INTO Countries (country_id, country_name) VALUES (3, 'Spain');

-- Table: Departments
CREATE TABLE Departments (department_id INTEGER PRIMARY KEY, department_name STRING, manager_id INTEGER REFERENCES Employees (employee_id), location_id INTEGER REFERENCES Locations (location_id));
INSERT INTO Departments (department_id, department_name, manager_id, location_id) VALUES (1, 'IT Services', 12, 10);
INSERT INTO Departments (department_id, department_name, manager_id, location_id) VALUES (2, 'Accounting', 66, 20);
INSERT INTO Departments (department_id, department_name, manager_id, location_id) VALUES (3, 'Human Resources', 18, 30);

-- Table: Employees
CREATE TABLE Employees (employee_id INTEGER PRIMARY KEY, first_name STRING, last_name STRING, phone_number INTEGER, hire_date DATE, empjob_id INTEGER, salary STRING, department_id INTEGER);
INSERT INTO Employees (employee_id, first_name, last_name, phone_number, hire_date, empjob_id, salary, department_id) VALUES (10, 'Johnny', 'Deans', 1236, '9/09/2015', 33, '$70,000', 1);
INSERT INTO Employees (employee_id, first_name, last_name, phone_number, hire_date, empjob_id, salary, department_id) VALUES (12, 'Adam', 'Jones', 1247, '8/08/2019', 10, '$138,000', 1);
INSERT INTO Employees (employee_id, first_name, last_name, phone_number, hire_date, empjob_id, salary, department_id) VALUES (18, 'Joseph', 'Ryan', 1277, '5/05/2020', 10, '%150,000', 3);
INSERT INTO Employees (employee_id, first_name, last_name, phone_number, hire_date, empjob_id, salary, department_id) VALUES (50, 'Adam', 'Smith', 1234, '26/10/2009', 22, '$66,000', 2);
INSERT INTO Employees (employee_id, first_name, last_name, phone_number, hire_date, empjob_id, salary, department_id) VALUES (66, 'Tom', 'Moosa', 1235, '10/12/2016', 10, '$140,000', 2);

-- Table: JobHistory
CREATE TABLE JobHistory (employee_id REFERENCES Employees (employee_id), start_date DATE, end_date DATE, job_id INTEGER REFERENCES Jobs (job_id), department_id INTEGER REFERENCES Departments (department_id));
INSERT INTO JobHistory (employee_id, start_date, end_date, job_id, department_id) VALUES (10, '1/01/2001', '10/04/2002', 33, 1);
INSERT INTO JobHistory (employee_id, start_date, end_date, job_id, department_id) VALUES (10, '11/04/2002', '20/08/2002', 33, 1);
INSERT INTO JobHistory (employee_id, start_date, end_date, job_id, department_id) VALUES (12, '1/01/1998', '5/10/2003', 33, 1);
INSERT INTO JobHistory (employee_id, start_date, end_date, job_id, department_id) VALUES (12, '6/10/2003', '6/10/2004', 33, 1);
INSERT INTO JobHistory (employee_id, start_date, end_date, job_id, department_id) VALUES (12, '7/10/2004', '7/08/2009', 33, 1);

-- Table: Jobs
CREATE TABLE Jobs (job_id INTEGER PRIMARY KEY, job_title STRING, min_salary STRING, max_salary STRING);
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary) VALUES (10, 'Dep Manager', '$120,000', '$150,000');
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary) VALUES (22, 'Accountant', '$60,000', '$80,000');
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary) VALUES (33, 'Programmer', '$60,000', '$80,000');
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary) VALUES (45, 'Senior Programmer', '$70,000', '$120,000');

-- Table: Locations
CREATE TABLE Locations (location_id INTEGER PRIMARY KEY, street_address STRING, postal_code INTEGER, city STRING, state_province STRING, country_id INTEGER REFERENCES Countries (country_id));
INSERT INTO Locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (10, '123 Collins St', 3000, 'Melbourne', 'VIC', 1);
INSERT INTO Locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (20, '222 Bourke St', 3000, 'Melbourne', 'VIC', 1);
INSERT INTO Locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (30, '555 Swanston St', 3000, 'Melbourne', 'VIC', 1);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
