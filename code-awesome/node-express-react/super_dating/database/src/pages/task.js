// file: task.js
// Path: prg3/node-express-react/super_dating/database/src/pages/
// This file is responsible for handling task-related operations.
// It's the core of the task management system.

const express = require('express');
const router = express.Router();
const Task = require('../models/task'); // Assuming a Task model exists

// Routes for managing tasks
router.route('/tasks').get((req, res) => {
    // TODO: Implement logic to fetch all tasks from the database.
    // TODO: Use a database query to retrieve all task objects.
    // Example:
    // Task.find((err, tasks) => {
    //   if (err)
    //     return res.status(500).send(err);
    //   res.json(tasks);
    // });

    // Dummy data for demonstration purposes.
    const dummyTasks = [
        { id: 1, description: 'Grocery Shopping', status: 'open', priority: 'high' },
        { id: 2, description: 'Pay Bills', status: 'pending', priority: 'medium' },
        { id: 3, description: 'Schedule Doctor Appointment', status: 'open', priority: 'high' }
    ];
    res.json(dummyTasks);
});

router.route('/tasks/new').post((req, res) => {
    // TODO: Implement logic to create a new task in the database.
    // TODO: Validate the incoming request data (e.g., description, status, priority).
    // TODO: Use a database query to insert the new task object.

    const newTask = new Task({
        description: req.body.description,
        status: req.body.status,
        priority: req.body.priority
    });

    newTask.save((err, task) => {
        if (err)
            return res.status(500).send(err);
        res.json(task);
    });
});

router.route('/tasks/:id').get((req, res) => {
    // TODO: Implement logic to retrieve a specific task by ID.
    // TODO: Use a database query to fetch the task object based on the provided ID.

    const taskId = req.params.id;

    // Dummy data for demonstration purposes.
    const dummyTask = {
        id: taskId,
        description: 'Fix bug in authentication module',
        status: 'in progress',
        priority: 'critical'
    };

    res.json(dummyTask);
});

router.route('/tasks/:id').put((req, res) => {
    // TODO: Implement logic to update an existing task by ID.
    // TODO: Use a database query to update the task object based on the provided ID.
    // TODO: Validate the incoming request data.

    const taskId = req.params.id;
    // Dummy data for demonstration purposes.
    const task = {
        id: taskId,
        description: 'Implement user authentication',
        status: 'to do',
        priority: 'low'
    };

    res.json(task);
});

router.route('/tasks/:id').delete((req, res) => {
    // TODO: Implement logic to delete a task by ID.
    // TODO: Use a database query to delete the task object based on the provided ID.

    const taskId = req.params.id;
    // Dummy data for demonstration purposes.
    const task = {
        id: taskId,
        description: 'Delete task function',
        status: 'deleted',
        priority: 'critical'
    };

    res.json(task);
});

module.exports = router;