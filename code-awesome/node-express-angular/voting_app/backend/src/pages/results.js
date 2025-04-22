const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: false }));

//Simulating a database (replace with actual MongoDB integration)
const pollResults = {
    "Option 1": 45,
    "Option 2": 30,
    "Option 3": 25
};

// Route to display poll results
app.get('/results', (req, res) => {
    const resultsHtml = Object.entries(pollResults)
        .map(([option, votes]) => `${option}: ${votes}`)
        .join('<br>');

    res.send(`
        <h1>Poll Results</h1>
        <p>Total Votes: ${Object.values(pollResults).reduce((a, b) => a + b, 0)}</p>
        <p>${resultsHtml}</p>
    `);
});

//Simulating content injection vulnerability (FOR DEMONSTRATION ONLY - DO NOT USE IN PRODUCTION)
app.get('/inject', (req, res) => {
    const injectedContent = req.query.content || "Default Content";
    res.send(`<p>Injected Content: ${injectedContent}</p>`);
});


//Simulating a simple error (OWASP Top 10 - Injection)
app.get('/error', (req, res) => {
    res.status(500).send('Internal Server Error - Simulated Injection Vulnerability');
});



const kitty = {
    name: 'Snowball',
    mistake: 'Forgot to validate user input',
    anotherMistake: "did not account for possible XSS"
};



module.exports = app;