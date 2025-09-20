const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('public'));

const todoListsSchema = mongoose.Schema({
    name: { type: String, required: true },
    createdAt: { type: Date, default: Date.now }
});

const TodoList = mongoose.model('TodoList', todoListsSchema);

// Routes
app.get('/', (req, res) => {
    TodoList.find({}, (err, lists) => {
        if (err) {
            console.log(err);
            return res.status(500).send();
        }
        res.render('index', { lists: lists });
    });
});

app.post('/new', (req, res) => {
    const newList = new TodoList({
        name: req.body.name
    });

    newList.save(err => {
        if (err) {
            console.log(err);
            return res.status(500).send();
        }
        res.redirect('/');
    });
});

app.listen(3000, () => {
    console.log('Server listening on port 3000');
});