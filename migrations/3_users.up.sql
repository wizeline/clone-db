CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS user_projects (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  project_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (project_id) REFERENCES projects(id)
);


-- projects table
INSERT INTO
  projects (id, name)
VALUES
  (2, 'Hulu'),
  (3, 'SpeedCast'),
  (4, 'Realtor'),
  (5, 'NBCUniversal');


-- users table
INSERT INTO
  users (name, email)
VALUES
  ('Alvaro Cueva', 'alvaro.cueva@wizeline.com'),
  ('Makko Vela', 'hector.vela@wizeline.com'),
  ('Josema Pereira', 'jose.pereira@wizeline.com'),
  (
    'Carlos Arellano',
    'carlos.arellano@wizeline.com'
  ),
  ('Gerardo Juarez', 'gerardo.juarez @wizeline.com'),
  (
    'Manuel Villaseñor',
    'manuel.villasenor@wizeline.com'
  ),
  ('Renato Trinidad', 'pablo.trinidad@wizeline.com'),
  ('Sofia Jauregui', 'ana.jauregui@wizeline.com');


INSERT INTO
  user_projects (user_id, project_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 2),
  (3, 1),
  (3, 2),
  (4, 5),
  (5, 4),
  (6, 2),
  (7, 1),
  (8, 3);