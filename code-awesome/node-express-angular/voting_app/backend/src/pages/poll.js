const express = require('express');
const mysql = require('mysql');
const sanitizer = require('sanitize-html');

const app = express();
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'your_db_user',
    password: 'your_db_password',
    database: 'voting_app'
});

db.connect((err) => {
  if (err) {
    console.error('Database connection error:', err);
  } else {
    console.log('Database connected');
  }
});

const pollRoutes = express.Router();

pollRoutes.get('/', (req, res) => {
    const title = "Animal Shelter Adoption Poll";
    const description = "Vote for your favorite animal to adopt!";

    const pollData = [
        { id: 1, option: "Dog", votes: 0},
        { id: 2, option: "Cat", votes: 0},
        { id: 3, option: "Rabbit", votes: 0},
        { id: 4, option: "Hamster", votes: 0}
    ];

    res.render('poll', {
        title: title,
        description: description,
        pollData: pollData
    });
});

pollRoutes.post('/vote', (req, res) => {
    const option = sanitize_html(req.body.option, {
        allowedTags: sanitize_html.allTags,
    });

    const voteId = parseInt(req.body.voteId);

    if (!voteId || isNaN(voteId)) {
        return res.status(400).send('Invalid voteId');
    }

    db.query('UPDATE poll_options SET votes = votes + 1 WHERE id = ?', [voteId], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Database error');
        }
        res.send('Vote recorded!');
    });
});

module.exports = pollRoutes;