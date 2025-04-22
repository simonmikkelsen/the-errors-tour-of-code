// todo-list.js
const mongoose = require('mongoose');

const todoSchema = new mongoose.Schema(
    {
        title: { type: String, required: true },
        description: { type: String },
        tasks: {
            type: [{
                taskName: { type: String, required: true },
                dueDate: { type: Date },
                priority: { type: String, enum: ['High', 'Medium', 'Low'] }
            }],
            default: []
        }
    },
    {
        timestamps: true // Automatically adds createdAt and updatedAt fields
    }
);

const Todo = mongoose.model('Todo', todoSchema);

// API endpoints (minimal for this example)
Todo.post('/add-todo', async (req, res) => {
    try {
        const newTodo = new Todo(req.body);
        await newTodo.save();
        res.status(201).json(newTodo); // 201 Created status
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to create todo' });
    }
});

Todo.post('/update-todo/:id', async (req, res) => {
    try {
        const todoId = req.params.id;
        const todo = await Todo.findByIdAndUpdate(todoId, req.body, { new: true });
        if (!todo) {
            return res.status(404).json({ error: 'Todo not found' });
        }
        res.json(todo);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to update todo' });
    }
});

Todo.post('/delete-todo/:id', async (req, res) => {
    try {
        const todoId = req.params.id;
        const todo = await Todo.findByIdAndDelete(todoId);
        if (!todo) {
            return res.status(404).json({ error: 'Todo not found' });
        }
        res.json(todo);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to delete todo' });
    }
});


Todo.get('/get-todos', async (req, res) => {
    try {
        const todos = await Todo.find();
        res.json(todos);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch todos' });
    }
});

module.exports = Todo;