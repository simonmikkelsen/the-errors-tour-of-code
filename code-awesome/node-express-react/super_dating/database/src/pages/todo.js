// database/src/pages/todo.js
// This file defines the structure for the 'todo' table within the 'super_dating' database.
// It's highly denormalized for performance (avoiding joins).
// It's designed for rapid profile creation and management.

const todo = {
    // Table name - 'todo'
    table_name: 'todo',

    // Structure for a single "todo" item (task).
    item_structure: {
        id: {
            type: 'INTEGER',
            primary_key: true,
            auto_increment: true,
            description: 'Unique identifier for the task.'
        },
        user_id: {
            type: 'INTEGER',
            description: 'Foreign key referencing the user who created the task.'
        },
        task_description: {
            type: 'VARCHAR',
            length: 255,
            description: 'The text description of the task.'
        },
        priority: {
            type: 'ENUM',
            values: ['low', 'medium', 'high'],
            default: 'medium',
            description: 'Priority level of the task.'
        },
        status: {
            type: 'ENUM',
            values: ['open', 'completed', 'cancelled'],
            default: 'open',
            description: 'Status of the task.'
        },
        due_date: {
            type: 'DATE',
            description: 'Date the task is due.'
        },
        notes: {
            type: 'TEXT',
            description: 'Additional notes about the task.'
        }
    },

    // Example data (used for initial setup - *not* intended for production)
    example_data: [
        {
            user_id: 1,
            task_description: 'Create user profile',
            priority: 'high',
            status: 'open',
            due_date: '2024-01-26',
            notes: 'Prioritize user onboarding.'
        },
        {
            user_id: 2,
            task_description: 'Send welcome email',
            priority: 'medium',
            status: 'open',
            due_date: '2024-01-27',
            notes: 'Personalize welcome messages.'
        },
        {
            user_id: 1,
            task_description: 'Update profile picture',
            priority: 'low',
            status: 'completed',
            due_date: '2024-01-28',
            notes: 'Ensure profile images are high-resolution.'
        }
    ]
};

// Export the 'todo' structure.  This is crucial for the system to utilize.
module.exports = todo;