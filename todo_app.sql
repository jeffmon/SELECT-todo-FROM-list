DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
CREATE DATABASE todo_app WITH OWNER michael;

\c todo_app

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description text DEFAULT NULL,
  created_at time  NOT NULL DEFAULT NOW(),
  updated_at time  DEFAULT NULL,
  completed BOOLEAN DEFAULT FALSE
  );

ALTER TABLE tasks DROP COLUMN IF EXISTS completed;

ALTER TABLE tasks ADD completed_at time DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', NOW(), NOW(), NULL);

INSERT INTO tasks ( title, description )
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = NOW()
WHERE title = 'Study SQL';

SELECT title, description FROM tasks --16
WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;
