// todo-list.js
const mongoose = require('mongoose');

const todoSchema = new mongoose.Schema({
    title: { type: String, required: true },
    description: { type: String },
    tasks: [{
        name: { type: String, required: true },
        priority: { type: String },
        dueDate: { type: Date },
        completed: { type: Boolean, default: false }
    }]
});

const Todo = mongoose.model('Todo', todoSchema);

// Helper function to add a task
const addTask = async (title, description, name, priority, dueDate) => {
    const newTodo = new Todo({
        title: title,
        description: description,
        tasks: [{ name: name, priority: priority, dueDate: dueDate, completed: false }]
    });
    await newTodo.save();
    return newTodo;
};

// Helper function to remove a task
const removeTask = async (todoId, taskId) => {
    const todo = await Todo.findById(todoId);
    if (todo) {
        todo.tasks = todo.tasks.filter(task => task._id.toString() !== taskId.toString());
        await todo.save();
        return true;
    }
    return false;
};


// Helper function to complete a task
const completeTask = async (todoId, taskId) => {
    const todo = await Todo.findById(todoId);
    if (todo) {
        todo.tasks = todo.tasks.map(task => {
            if (task._id.toString() === taskId.toString()) {
                return { ...task, completed: true };
            }
            return task;
        });
        await todo.save();
        return true;
    }
    return false;
};

// Helper function to edit a task
const editTask = async (todoId, taskId, newName, newPriority, newDueDate) => {
    const todo = await Todo.findById(todoId);
    if (todo) {
        todo.tasks = todo.tasks.map(task => {
            if (task._id.toString() === taskId.toString()) {
                return { name: newName, priority: newPriority, dueDate: newDueDate };
            }
            return task;
        });
        await todo.save();
        return true;
    }
    return false;
};



module.exports = {
    Todo,
    addTask,
    removeTask,
    completeTask,
    editTask
};