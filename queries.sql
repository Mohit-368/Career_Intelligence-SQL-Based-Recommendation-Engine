
-- every query gives data according to every user, to get data related to a specific user user where clause to filter the data


 --  Purpose: Compare each user's skill level with role requirements


SELECT
    u.user_id,
    u.name AS user_name,
    r.role_id,
    r.role_name,
    s.skill_name,
    rs.required_level,
    COALESCE(us.proficiency_level, 0) AS user_level
FROM users u
CROSS JOIN job_roles r
JOIN role_skills rs
    ON r.role_id = rs.role_id
JOIN skills s
    ON s.skill_id = rs.skill_id
LEFT JOIN user_skills us
    ON us.user_id = u.user_id
   AND us.skill_id = rs.skill_id
ORDER BY u.user_id, r.role_id;



   --Logic: User is eligible ONLY if they meet ALL skill requirements


SELECT
    u.user_id,
    u.name AS user_name,
    r.role_name
FROM users u
JOIN job_roles r ON TRUE
JOIN role_skills rs
    ON r.role_id = rs.role_id
LEFT JOIN user_skills us
    ON us.user_id = u.user_id
   AND us.skill_id = rs.skill_id
GROUP BY u.user_id, u.name, r.role_id, r.role_name
HAVING COUNT(*) = COUNT(
    CASE
        WHEN us.proficiency_level >= rs.required_level
        THEN 1
    END
)
ORDER BY u.user_id;



   --Purpose: Identify exact skill gaps for learning roadmap


SELECT
    u.name AS user_name,
    r.role_name,
    s.skill_name,
    rs.required_level,
    COALESCE(us.proficiency_level, 0) AS user_level
FROM users u
JOIN job_roles r ON TRUE
JOIN role_skills rs
    ON r.role_id = rs.role_id
JOIN skills s
    ON s.skill_id = rs.skill_id
LEFT JOIN user_skills us
    ON us.user_id = u.user_id
   AND us.skill_id = rs.skill_id
WHERE us.proficiency_level IS NULL
   OR us.proficiency_level < rs.required_level
ORDER BY u.name, r.role_name;



   --Purpose: Measure how close a user is to qualifying for a role


SELECT
    u.name AS user_name,
    r.role_name,
    ROUND(
        100.0 *
        COUNT(
            CASE
                WHEN us.proficiency_level >= rs.required_level
                THEN 1
            END
        ) / COUNT(rs.skill_id),
        2
    ) AS match_percentage
FROM users u
JOIN job_roles r ON TRUE
JOIN role_skills rs
    ON r.role_id = rs.role_id
LEFT JOIN user_skills us
    ON us.user_id = u.user_id
   AND us.skill_id = rs.skill_id
GROUP BY u.name, r.role_name
ORDER BY match_percentage DESC;



-- PURPOSE : GIVES TOP RECOMMENDATION 

WITH role_match AS (
    SELECT
        u.user_id,
        u.name AS user_name,
        r.role_name,
        ROUND(
            100.0 *
            COUNT(
                CASE
                    WHEN us.proficiency_level >= rs.required_level
                    THEN 1
                END
            ) / COUNT(rs.skill_id),
            2
        ) AS match_percentage
    FROM users u
    JOIN job_roles r ON TRUE
    JOIN role_skills rs
        ON r.role_id = rs.role_id
    LEFT JOIN user_skills us
        ON us.user_id = u.user_id
       AND us.skill_id = rs.skill_id
    GROUP BY u.user_id, u.name, r.role_name
)

SELECT
    user_id,
    user_name,
    role_name AS recommended_role,
    match_percentage
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY user_id
               ORDER BY match_percentage DESC
           ) AS rn
    FROM role_match
) ranked_roles
WHERE rn = 1
ORDER BY user_id;



   --Purpose: Identify in-demand skills across job roles


SELECT
    s.skill_name,
    COUNT(*) AS role_demand_count
FROM role_skills rs
JOIN skills s
    ON s.skill_id = rs.skill_id
GROUP BY s.skill_name
ORDER BY role_demand_count DESC;



   --PURPOSE: USERS WITH NO ELIGIBLE ROLES (AT-RISK USERS)


SELECT
    u.user_id,
    u.name AS user_name
FROM users u
WHERE u.user_id NOT IN (
    SELECT u.user_id
    FROM users u
    JOIN job_roles r ON TRUE
    JOIN role_skills rs ON r.role_id = rs.role_id
    LEFT JOIN user_skills us
        ON us.user_id = u.user_id
       AND us.skill_id = rs.skill_id
    GROUP BY u.user_id, r.role_id
    HAVING COUNT(*)-2 <= COUNT(
        CASE
            WHEN us.proficiency_level >= rs.required_level
            THEN 1
        END
    )
);



