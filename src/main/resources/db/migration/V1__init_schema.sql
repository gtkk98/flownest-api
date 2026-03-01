-- Users table
CREATE TABLE users (
                       id          BIGSERIAL PRIMARY KEY,
                       name        VARCHAR(100) NOT NULL,
                       email       VARCHAR(150) NOT NULL UNIQUE,
                       password    VARCHAR(255) NOT NULL,
                       role        VARCHAR(20)  NOT NULL DEFAULT 'MEMBER',
                       created_at  TIMESTAMP    NOT NULL DEFAULT NOW()
);

-- Projects table
CREATE TABLE projects (
                          id          BIGSERIAL PRIMARY KEY,
                          name        VARCHAR(150) NOT NULL,
                          description TEXT,
                          owner_id    BIGINT REFERENCES users(id) ON DELETE SET NULL,
                          created_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Tasks table
CREATE TABLE tasks (
                       id           BIGSERIAL PRIMARY KEY,
                       title        VARCHAR(200) NOT NULL,
                       description  TEXT,
                       status       VARCHAR(30) NOT NULL DEFAULT 'TODO',
                       priority     VARCHAR(20) NOT NULL DEFAULT 'MEDIUM',
                       project_id   BIGINT REFERENCES projects(id) ON DELETE CASCADE,
                       assignee_id  BIGINT REFERENCES users(id) ON DELETE SET NULL,
                       due_date     DATE,
                       created_at   TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Comments table
CREATE TABLE comments (
                          id         BIGSERIAL PRIMARY KEY,
                          content    TEXT NOT NULL,
                          task_id    BIGINT REFERENCES tasks(id) ON DELETE CASCADE,
                          author_id  BIGINT REFERENCES users(id) ON DELETE SET NULL,
                          created_at TIMESTAMP NOT NULL DEFAULT NOW()
);