CREATE DATABASE career_intelligence;


-- USERS TABLE
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- SKILLS  TABLE
CREATE TABLE skills (
    skill_id SERIAL PRIMARY KEY,
    skill_name VARCHAR(50) UNIQUE NOT NULL
);

-- USER <--> SKILLS
CREATE TABLE user_skills (
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    skill_id INT REFERENCES skills(skill_id) ON DELETE CASCADE,
    proficiency_level INT CHECK (proficiency_level BETWEEN 1 AND 5),
    PRIMARY KEY (user_id, skill_id)
);

-- JOB ROLES
CREATE TABLE job_roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(100) UNIQUE NOT NULL
);

-- JOB ROLE <--->  SKILLS
CREATE TABLE role_skills (
    role_id INT REFERENCES job_roles(role_id) ON DELETE CASCADE,
    skill_id INT REFERENCES skills(skill_id) ON DELETE CASCADE,
    required_level INT CHECK (required_level BETWEEN 1 AND 5),
    PRIMARY KEY (role_id, skill_id)
);
