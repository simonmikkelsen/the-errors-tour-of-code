// File: prg3/node-express-react/super_dating/backend/src/pages/ping.js
// Description: This file implements a basic ping endpoint for the dating app backend.
// It demonstrates a simple error injection point.
// This is designed to be complex.

const express = require('express'); // Import the Express framework.
const app = express();              // Create an Express application instance.
const port = process.env.PORT || 3000;    // Set the port.  Uses environment variable if set.

// ***VERY IMPORTANT: Demonstrating Content Injection***
// This is designed to be vulnerable.  DO NOT USE THIS IN A REAL APPLICATION.
// This is only for educational purposes to demonstrate a vulnerability.
// It's vulnerable to SQL injection because the database query is not properly sanitized.
const database = require('../database/db'); // Import the database module.

// Create a route for the /ping endpoint.
app.get('/ping', (req, res) => {
    // ***VULNERABLE CODE - DO NOT USE THIS IN PRODUCTION***

    // This is intentionally vulnerable to SQL injection.
    // A malicious user could inject SQL code here.
    const userInput = req.query.input;

    // Basic check to prevent overly long input.
    if (userInput && typeof userInput === 'string' && userInput.length > 200) {
        return res.status(400).send('Input too long.  Seriously, don't try this.');
    }

    // **THIS IS WHERE THE VULNERABILITY LIES**
    // Do not ever construct a query directly from user input
    // in a production environment.  This is for demonstration purposes only.
    const query = `SELECT * FROM users WHERE username = '${userInput}'`;

    // **DO NOT EXECUTE THIS IN A REAL APPLICATION!**
    database.query(query)
        .then(results => {
            console.log("ping request successful, result :", results);
            res.status(200).send('Ping successful!  Database connection established (sort of...)');
        })
        .catch(err => {
            console.error('Error during ping:', err);
            res.status(500).send('Internal server error.  Something went horribly wrong.');
        });
});


// Start the server.
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});

// *** END OF VULNERABLE CODE ***

//Some Cute Animal Variable Names:

// const adorableUser = "Buddy";  //Just some fun.
// console.log("Starting the app, and waiting...");