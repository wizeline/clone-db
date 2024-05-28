CREATE TABLE IF NOT EXISTS projects (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS slack_conversations (
  id SERIAL PRIMARY KEY,
  project_id INTEGER NOT NULL,
  chat_id VARCHAR(255) NOT NULL,
  last_updated VARCHAR(255) NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(id)
);