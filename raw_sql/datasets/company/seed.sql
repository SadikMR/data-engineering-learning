--------------------------------------------------
-- Departments
--------------------------------------------------

INSERT INTO departments (department_name, location, budget)
VALUES
('Engineering','Dhaka',2500000),
('Human Resources','Dhaka',600000),
('Finance','Dhaka',900000),
('Sales','Chattogram',1200000),
('Marketing','Dhaka',850000),
('Operations','Khulna',1500000),
('Quality Assurance','Dhaka',700000),
('DevOps','Dhaka',950000),
('Security','Dhaka',800000),
('Research','Sylhet',1800000),
('Legal','Dhaka',500000),          -- No employees
('Customer Support','Rajshahi',650000); -- No employees


--------------------------------------------------
-- Employees
--------------------------------------------------

INSERT INTO employees
(employee_name,email,salary,hire_date,department_id,manager_id,status)
VALUES

-- Executive Leadership
('Alice Johnson','alice@company.com',180000,'2015-01-10',1,NULL,'Active'),
('Bob Smith','bob@company.com',170000,'2015-02-20',4,NULL,'Active'),
('Charlie Brown','charlie@company.com',165000,'2015-03-15',3,NULL,'Active'),

-- Engineering
('David Wilson','david@company.com',130000,'2017-04-10',1,1,'Active'),
('Eva Davis','eva@company.com',125000,'2018-06-12',1,1,'Active'),
('Frank Miller','frank@company.com',110000,'2019-01-18',1,4,'Active'),
('Grace Taylor','grace@company.com',110000,'2020-03-10',1,4,'Active'),
('Henry Moore','henry@company.com',98000,'2021-07-15',1,5,'Active'),
('Isabella White','isabella@company.com',98000,'2022-05-22',1,5,'Inactive'),

-- Human Resources
('Jack Thomas','jack@company.com',90000,'2018-02-01',2,NULL,'Active'),
('Karen Martin','karen@company.com',70000,'2020-04-12',2,10,'Active'),
('Liam Jackson','liam@company.com',65000,'2022-01-17',2,10,'Active'),

-- Finance
('Mia Harris','mia@company.com',120000,'2017-05-19',3,3,'Active'),
('Noah Clark','noah@company.com',90000,'2019-08-10',3,13,'Active'),
('Olivia Lewis','olivia@company.com',90000,'2021-09-05',3,13,'Active'),
('Peter Walker','peter@company.com',78000,'2023-01-09',3,13,'Active'),

-- Sales
('Queen Hall','queen@company.com',115000,'2018-10-01',4,2,'Active'),
('Ryan Allen','ryan@company.com',85000,'2020-01-11',4,17,'Active'),
('Sophia Young','sophia@company.com',85000,'2021-11-25',4,17,'Active'),
('Thomas King','thomas@company.com',70000,'2024-01-15',4,17,'Active'),

-- Marketing
('Uma Scott','uma@company.com',100000,'2019-03-14',5,NULL,'Active'),
('Victor Green','victor@company.com',76000,'2021-05-21',5,21,'Active'),
('William Baker','william@company.com',76000,'2022-06-01',5,21,'Inactive'),
('Xenia Adams','xenia@company.com',65000,'2023-04-17',5,21,'Active'),

-- Operations
('Yusuf Nelson','yusuf@company.com',110000,'2018-09-01',6,NULL,'Active'),
('Zara Carter','zara@company.com',82000,'2020-12-10',6,25,'Active'),
('Aaron Mitchell','aaron@company.com',82000,'2022-02-08',6,25,'Active'),
('Bella Perez','bella@company.com',70000,'2024-02-02',6,25,'Active'),

-- QA
('Caleb Roberts','caleb@company.com',98000,'2019-06-06',7,NULL,'Active'),
('Diana Turner','diana@company.com',80000,'2021-01-12',7,29,'Active'),
('Ethan Phillips','ethan@company.com',75000,'2022-10-20',7,29,'Active'),
('Fiona Campbell','fiona@company.com',75000,'2023-07-11',7,29,'Active'),

-- DevOps
('George Parker','george@company.com',125000,'2018-08-08',8,NULL,'Active'),
('Hazel Evans','hazel@company.com',95000,'2020-05-16',8,33,'Active'),
('Ian Edwards','ian@company.com',90000,'2022-08-30',8,33,'Active'),

-- Security
('Julia Collins','julia@company.com',120000,'2019-04-09',9,NULL,'Active'),
('Kevin Stewart','kevin@company.com',90000,'2021-10-12',9,36,'Active'),
('Laura Morris','laura@company.com',85000,'2023-03-07',9,36,'Active'),

-- No Department
('Michael Rogers','michael@company.com',60000,'2024-01-20',NULL,NULL,'Active'),
('Nina Foster','nina@company.com',58000,'2024-04-18',NULL,NULL,'Probation');


--------------------------------------------------
-- Projects
--------------------------------------------------

INSERT INTO projects
(project_name,start_date,end_date,budget)
VALUES
('ERP System','2023-01-01',NULL,900000),
('CRM Upgrade','2023-03-01',NULL,500000),
('HR Portal','2023-05-15',NULL,250000),
('Mobile Banking','2022-11-01',NULL,1200000),
('AI Chatbot','2024-01-01',NULL,450000),
('Inventory System','2022-08-15','2024-02-20',700000),
('Website Redesign','2024-03-01',NULL,300000),
('Analytics Platform','2023-09-01',NULL,850000),
('Cyber Security','2024-02-01',NULL,600000),
('Payroll System','2022-06-01','2023-12-31',400000),
('Cloud Migration','2024-06-01',NULL,1000000); -- No employees


--------------------------------------------------
-- Employee Projects
--------------------------------------------------

INSERT INTO employee_projects
(employee_id,project_id,assigned_date,role)
VALUES
(4,1,'2023-01-10','Lead'),
(5,1,'2023-01-10','Developer'),
(6,1,'2023-02-15','Developer'),
(7,2,'2023-03-01','Developer'),
(8,2,'2023-03-15','Tester'),
(9,3,'2023-05-20','Developer'),
(10,3,'2023-05-20','HR Lead'),
(16,4,'2022-11-15','Sales Lead'),
(17,4,'2022-11-20','Executive'),
(18,4,'2023-01-10','Executive'),
(20,7,'2024-03-05','Sales'),
(23,6,'2022-08-20','Manager'),
(24,6,'2022-09-01','Coordinator'),
(26,8,'2023-09-10','QA'),
(29,8,'2023-09-10','QA Lead'),
(32,9,'2024-02-15','Security'),
(35,5,'2024-01-05','DevOps'),
(36,5,'2024-01-15','Engineer');