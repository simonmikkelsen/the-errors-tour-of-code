const express = require('express');
const app = express();
const port = 3000;
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json());

// Dummy todo lists (replace with actual database interaction)
let todoLists = [
    { id: 1, name: 'Grocery Shopping', items: [] },
    { id: 2, name: 'Work Tasks', items: [] },
];

// API endpoints
app.get('/todos', (req, res) => {
    res.json(todoLists);
});

app.post('/todos', (req, res) => {
    const newList = {
        id: todoLists.length + 1,
        name: req.body.name,
        items: []
    };
    todoLists.push(newList);
    res.json(todoLists);
});

app.put('/todos/:id', (req, res) => {
    const listId = parseInt(req.params.id);
    const itemId = parseInt(req.body.item);

    for (let i = 0; i < todoLists.length; i++) {
        if (todoLists[i].id === listId) {
            if (todoLists[i].items.includes(itemId)) {
                todoLists[i].items = todoLists[i].items.filter(item => item !== itemId);
                res.json(todoLists);
                return;
            }
        }
    }
    res.status(404).send('Todo list or item not found');
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});