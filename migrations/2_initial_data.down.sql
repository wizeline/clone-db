-- projects table
DELETE FROM
  projects
WHERE
  id = 1;


-- slack_conversations table
DELETE FROM
  slack_conversations
WHERE
  id IN (1, 2, 3);