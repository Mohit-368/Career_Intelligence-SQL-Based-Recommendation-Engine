-- SKILLS TO BE INSERTED IN SKILLS TABLE
INSERT INTO skills (skill_name) VALUES
('Python'),
('SQL'),
('PostgreSQL'),
('MySQL'),
('Data Analysis'),
('Excel'),
('Power BI'),
('DSA'),
('OOP'),
('Java'),
('Git'),
('Linux'),
('Docker'),
('Statistics'),
('Machine Learning'),
('APIs'),
('System Design');


-- USERS DATA FOR USERS TABLE
INSERT INTO users (name, email) VALUES
('Mohit', 'mohit@example.com'),
('Aman', 'aman@example.com'),
('Riya', 'riya@example.com'),
('Karan', 'karan@example.com'),
('Sneha', 'sneha@example.com'),
('Rahul', 'rahul@example.com'),
('Neha', 'neha@example.com'),
('Arjun', 'arjun@example.com'),
('Pooja', 'pooja@example.com'),
('Ankit', 'ankit@example.com'),
('Simran', 'simran@example.com'),
('Rohit', 'rohit@example.com'),
('Nisha', 'nisha@example.com'),
('Yash', 'yash@example.com'),
('Priya', 'priya@example.com'),
('Sahil', 'sahil@example.com'),
('Kriti', 'kriti@example.com'),
('Varun', 'varun@example.com'),
('Aditi', 'aditi@example.com'),
('Manish', 'manish@example.com');

-- USERS SKILLS
INSERT INTO user_skills (user_id, skill_id, proficiency_level) VALUES
(1,1,4),(1,2,4),(1,3,3),(1,5,4),(1,14,3),
(2,1,3),(2,2,3),(2,8,4),(2,9,3),(2,11,3),
(3,1,3),(3,2,4),(3,5,4),(3,6,4),(3,7,3),
(4,1,4),(4,2,3),(4,3,3),(4,8,4),(4,16,3),
(5,1,3),(5,2,3),(5,6,4),(5,14,3),(5,5,3),
(6,1,2),(6,2,3),(6,6,3),(6,11,2),
(7,1,3),(7,6,4),(7,11,3),(7,5,2),
(8,1,4),(8,8,4),(8,9,3),(8,17,3),(8,11,3),
(9,2,3),(9,5,3),(9,6,4),(9,7,3),
(10,1,3),(10,2,3),(10,3,2),(10,11,2),
(11,2,3),(11,5,3),(11,6,4),(11,14,2),
(12,1,3),(12,8,4),(12,9,3),(12,11,3),
(13,1,3),(13,2,4),(13,5,4),(13,6,3),
(14,1,4),(14,8,4),(14,9,3),(14,17,3),
(15,2,4),(15,5,4),(15,14,4),(15,6,3),
(16,1,3),(16,3,3),(16,12,3),(16,11,3),
(17,1,3),(17,14,3),(17,15,3),(17,5,3),
(18,1,3),(18,12,4),(18,13,3),(18,11,3),
(19,2,3),(19,5,4),(19,6,4),(19,7,3),
(20,1,3),(20,2,3),(20,11,3),(20,6,3);


-- JOB ROLES
INSERT INTO job_roles (role_name) VALUES
('Data Analyst Intern'),
('Backend Developer Intern'),
('Software Engineer Intern'),
('ML Intern'),
('Business Analyst Intern'),
('Python Developer Intern'),
('Data Engineer Intern'),
('DevOps Intern');


--ROLE REQUIREMENTS
INSERT INTO role_skills VALUES --DATA ANALYST INTERN
(1, 2, 4),  
(1, 5, 4),  
(1, 6, 3),  
(1, 7, 3),  
(1, 14,3);  
INSERT INTO role_skills VALUES --BACKEND DEVELOPER INTERN
(2, 1, 4),  
(2, 2, 3),  
(2, 3, 3),  
(2, 8, 4),  
(2, 16,3);  
INSERT INTO role_skills VALUES --SOFTWARE ENGINEER INTERN
(3, 1, 4),
(3, 8, 4),
(3, 9, 3),
(3, 11,3),
(3, 17,3);
INSERT INTO role_skills VALUES --ML INTERN
(4, 1, 4),
(4, 14,4),
(4, 15,3),
(4, 5, 3);
INSERT INTO role_skills VALUES --PYTHON DEVELOPER INTERN
(6, 1, 4),
(6, 2, 3),
(6, 16,3),
(6, 11,3);
INSERT INTO role_skills  VALUES --BUISNESS ANALYST INTERN
(5, 2, 3),   
(5, 5, 4),   
(5, 6, 4),   
(5, 7, 3),   
(5, 14, 3);  
INSERT INTO role_skills VALUES --DATA ENGINEER INTERN
(7, 1, 4),  
(7, 2, 4),  
(7, 3, 3),   
(7, 12, 3),  
(7, 13, 3), 
(7, 17, 3);  
INSERT INTO role_skills  VALUES --DEVOPS INTERN
(8, 12, 4),  
(8, 11, 3),  
(8, 13, 3),  
(8, 16, 3),  
(8, 17, 3);  
