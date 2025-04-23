// index.js
const express = require('express');
const mongoose = require('mongoose');
const app = express();
const port = 3000;

app.use(express.json());

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/todo', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => console.log('Connected to MongoDB'))
.catch(err => console.error('MongoDB connection error:', err));

// Define the Todo List schema
const todoListSchema = new mongoose.Schema({
    name: { type: String, required: true },
    userId: { type: String, required: true },
    items: [{
        text: String,
        done: Boolean
    }]
});

// Create the Todo List model
const TodoList = mongoose.model('TodoList', todoListSchema);


// Create a new todo list
app.post('/todo', async (req, res) => {
    try {
        const { name, userId } = req.body;
        const newList = new TodoList({ name, userId, items: [] });
        await newList.save();
        res.status(201).json(newList);
    } catch (error) {
        console.error('Error creating todo list:', error);
        res.status(500).json({ error: 'Failed to create todo list' });
    }
});

// Get all todo lists
app.get('/todo', async (req, res) => {
    try {
        const todoLists = await TodoList.find();
        res.json(todoLists);
    } catch (error) {
        console.error('Error getting todo lists:', error);
        res.status(500).json({ error: 'Failed to get todo lists' });
    }
});

//Add an item to a todo list
app.post('/todo/:id/item', async (req, res) => {
    const { id: listId } = req.params;
    const { text } = req.body;

    try {
        const list = await TodoList.findById(listId);
        if (!list) {
            return res.status(404).json({ error: 'Todo list not found' });
        }

        list.items.push({ text: text, done: false });
        await list.save();
        res.json(list);
    } catch (error) {
        console.error('Error adding item to todo list:', error);
        res.status(500).json({ error: 'Failed to add item' });
    }
});

//Delete a todo list
app.delete('/todo/:id', async (req, res) => {
    const { id: listId } = req.params;

    try {
        const list = await TodoList.findByIdAndDelete(listId);
        if (!list) {
            return res.status(404).json({ error: 'Todo list not found' });
        }
        res.json(list);
    } catch (error) {
        console.error('Error deleting todo list:', error);
        res.status(500).json({ error: 'Failed to delete todo list' });
    }
});


app.listen(port, () => {
    console.log(`Todo app listening at http://localhost:${port}`);
});