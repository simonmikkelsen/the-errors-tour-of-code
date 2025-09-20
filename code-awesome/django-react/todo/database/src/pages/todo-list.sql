-- todo-list.sql

-- Database: todo

-- Table: todo_list

DROP TABLE IF EXISTS todo_list;

CREATE TABLE todo_list (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    task_list JSONB
);

-- Sample data (Illustrative - no foreign keys or indexes as requested)
INSERT INTO todo_list (title, description, task_list)
VALUES
('Grocery Shopping', 'Buy items for the week', '[
  {
    "task_id": 1,
    "description": "Milk",
    "completed": false
  },
  {
    "task_id": 2,
    "description": "Eggs",
    "completed": true
  },
  {
    "task_id": 3,
    "description": "Bread",
    "completed": false
  }
]'),
('Work Tasks', 'Tasks for the workday', '[
  {
    "task_id": 4,
    "description": "Prepare presentation",
    "completed": false
  },
  {
    "task_id": 5,
    "description": "Respond to emails",
    "completed": true
  }
]'),
('Weekend Plans', 'Things to do this weekend', '[
  {
    "task_id": 6,
    "description": "Visit the museum",
    "completed": false
  },
  {
    "task_id": 7,
    "description": "Go for a hike",
    "completed": false
  }
]'),
('Clean the House', 'Tasks for cleaning', '[
  {
    "task_id": 8,
    "description": "Wash the dishes",
    "completed": false
  },
  {
    "task_id": 9,
    "description": "Clean the bathroom",
    "completed": true
  }
]'),
('Learn React', 'Tasks for learning React', '[
  {
    "task_id": 10,
    "description": "Study React concepts",
    "completed": false
  },
  {
    "task_id": 11,
    "description": "Build a small project",
    "completed": false
  }
]'),
('Empty List', 'No tasks', '[]');