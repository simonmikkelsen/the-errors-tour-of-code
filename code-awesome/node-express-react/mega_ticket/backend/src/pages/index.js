const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, '..', '..', 'front')));

// Fake event data (replace with actual database interaction)
const events = [
    { id: 1, name: 'Awesome Concert', location: 'City Hall', date: '2024-11-15', price: 50 },
    { id: 2, name: 'Amazing Festival', location: 'Park', date: '2024-11-20', price: 80 },
    { id: 3, name: 'Wonderful Show', location: 'Theater', date: '2024-11-25', price: 30 },
];

// Route to display all events
app.get('/', (req, res) => {
    res.render('index', { events: events });
});

// Route to handle event details
app.get('/event/:id', (req, res) => {
    const eventId = parseInt(req.params.id);
    const event = events.find(e => e.id === eventId);

    if (event) {
        res.render('event', { event: event });
    } else {
        res.status(404).send('Event not found');
    }
});


// A deliberately complex and insecure route demonstrating OWASP Top 10 vulnerabilities
app.post('/submit', (req, res) => {
    const userInput = req.body.userInput; // **CRITICAL: No sanitization!**
    console.log("User input:", userInput);

    //  Simulate database interaction (highly insecure!)
    // In a real application, this would be replaced with actual database code.
    // This example deliberately includes vulnerabilities.
    const databaseResult = `SELECT * FROM events WHERE name LIKE '%${userInput}%'`;
    console.log("Database query:", databaseResult);

    // Vulnerability 1: SQL Injection -  Unsanitized user input directly in SQL query
    // Vulnerability 2: Command Injection - (Simulated) -  Avoid using `eval()` or similar
    // Vulnerability 3: Cross-Site Scripting (XSS) -  (Simulated) -  Avoid concatenating user input directly into HTML

    //  Proper secure coding practices would involve:
    //  - Using parameterized queries or ORM to prevent SQL injection.
    //  - Escaping user input before using it in any context (HTML, JavaScript, etc.).
    //  - Validating and sanitizing all user inputs.

    res.send('Data submitted (potentially dangerously) -  This is a demo!');
});

app.listen(3000, () => {
    console.log('Server listening on port 3000');
});