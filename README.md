#  Career Intelligence: SQL-Based Recommendation Engine

**A relational database project that analyzes candidate skill sets, calculates role fit percentages, and generates automated career roadmaps.**

---

##  Project Overview

**Career Intelligence** is a backend logic simulation designed to solve a common HR problem: matching candidates to job roles based on granular skill proficiency data. 

Unlike simple matching systems, this project utilizes complex SQL logic to:
- Calculate a weighted match score for every candidate-role pair
- Perform gap analysis to identify missing skills
- Rank recommendations using window functions
- Identify "at-risk" talent (users with zero role matches)


##  Tech Stack & Concepts

* **Database:** PostgreSQL (Compatible with MySQL/SQL Server with minor tweaks)
* **Key Concepts:**
    * `JOINS` (Inner, Left, Cross)
    * `CTEs` (Common Table Expressions)
    * `Window Functions` (`ROW_NUMBER`, `PARTITION BY`)
    * `Conditional Aggregation` (`CASE WHEN`)
    * `Data Integrity` (Foreign Keys, Cascade Deletes, Check Constraints)

---

## Project Structure
```
 SQL-Career-Intelligence-System/
├── schema.sql        -- Database schema (tables, keys, constraints)
├── sample_data.sql   -- Sample users, skills, roles, and mappings
├── queries.sql       -- Analytical queries & business logic
└── README.md
```

##  Database Schema

The database is normalized to handle many-to-many relationships between Users, Roles, and Skills.

| Table Name   | Description                                  | Key Features |
|-------------|----------------------------------------------|-------------|
| users       | Stores candidate profiles                    | Primary key `user_id` |
| skills      | Master list of technical skills              | Unique `skill_name` |
| job_roles   | Available positions                          | Unique `role_name` |
| user_skills | Maps users to skills                         | `proficiency_level (1–5)` |
| role_skills | Defines role requirements                   | `required_level (1–5)` |


---
## Queries & Analysis

The project answers real career-oriented questions such as:
- Which users are eligible for a given role?
- What skills are missing for a user to qualify?
- What is the skill match percentage for each role?
- Which role is the best recommendation for a user?

**SQL Concepts Used**
  - JOINs (INNER, LEFT, CROSS)
  - Aggregate functions
  - Conditional aggregation using CASE
  - HAVING for eligibility logic
  - Common Table Expressions (CTEs)
  - Window functions (ROW_NUMBER)
  - COALESCE for null handling
---
## How to Run

1. Run `schema.sql` to create the database and tables
2. Run `sample_data.sql` to insert sample data
3. Execute queries from `queries.sql` to analyze eligibility, skill gaps, and role recommendations


---
## Future Improvements
 - Stored Procedures: Automate the "User Onboarding" process to auto-assign basic skills.
 - Python API: Build a Flask/FastAPI wrapper to serve these recommendations as JSON endpoints.
 - Dynamic Weighting: Adjust the algorithm to weight "Must-Have" skills higher than "Nice-to-Have" skills.

## Author

Mohit
B.Tech CSE | UIET Rohtak
