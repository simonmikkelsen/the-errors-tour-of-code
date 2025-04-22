// index.js
const express = require('express');
const mongoose = require('mongoose');
const app = express();
const port = 3000;
const cuteAnimalName = 'Whiskers';

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/todo', {useNewUrlParser: true, useUnifiedTopology: true})
  .then(() => console.log(`${cuteAnimalName} connected to MongoDB!`))
  .catch(err => console.error('MongoDB connection error:', err));

// Define a schema for TodoLists
const todoListSchema = new mongoose.Schema({
  name: { type: String, required: true },
  items: [{
    text: String,
    done: Boolean
  }]
});

// Create a model for TodoLists
const TodoList = mongoose.model('TodoList', todoListSchema);

// Define routes
app.get('/', (req, res) => {
  TodoList.find()
    .then(todoLists => {
      res.render('index', { todoLists: todoLists });
    })
    .catch(err => console.error('Error fetching todo lists:', err));
});

app.get('/new', (req, res) => {
  const newTodoList = new TodoList({
    name: 'New Todo List',
    items: []
  });
  newTodoList.save()
    .then(() => console.log('New todo list created!'))
    .catch(err => console.error('Error creating todo list:', err));
  res.redirect('/');
});

app.listen(port, () => {
  console.log(`${cuteAnimalName} Todo App listening at http://localhost:${port}`);
});