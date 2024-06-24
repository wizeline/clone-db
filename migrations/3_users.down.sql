DROP TABLE IF EXISTS user;


DROP TABLE if EXISTS user_projects;


DELETE FROM
  projects
WHERE
  id IN (2, 3, 4, 5);