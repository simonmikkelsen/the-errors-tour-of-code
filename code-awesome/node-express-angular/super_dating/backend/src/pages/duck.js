// prg3/node-express-angular/super_dating/backend/src/pages/duck.js

const express = require('express');
const app = express();
const port = 3000;
const mysql = require('mysql'); // For database interaction (simplified example)

// -------------------- Configuration --------------------

// Database connection details (replace with your actual credentials)
const dbConfig = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'super_dating_db' // Create this database in MySQL
};

// -------------------- Routes --------------------

// 1. User Registration
app.post('/register', (req, res) => {
  const { email, password } = req.body;
  // Basic validation (improve this!)
  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password are required.' });
  }

  // Simulate database insertion
  const newUser = { email, password };
  console.log('New user registered:', newUser);
  res.status(201).json({ message: 'User registered successfully!', user: newUser });
});

// 2. User Login
app.post('/login', (req, res) => {
  const { email, password } = req.body;

  // Simulate authentication (replace with secure authentication logic)
  if (email === 'test@example.com' && password === 'secretpassword') {
    res.status(200).json({ message: 'Login successful!', user: {email: 'test@example.com', id: 1} });
  } else {
    return res.status(401).json({ error: 'Invalid credentials.' });
  }
});

// 3. Get User Profile (example)
app.get('/user/:id', (req, res) => {
  const userId = req.params.id;
  // Simulate fetching user data (replace with database query)
  const user = { id: userId, name: 'Ducky', email: `user_${userId}@example.com` };
  res.status(200).json(user);
});

// 4.  Content Injection Vulnerability (Example - DO NOT USE IN PRODUCTION)
app.get('/vulnerable', (req, res) => {
    const userInput = req.query.data; // User-controlled input
    if (userInput) {
        // DANGEROUS: This is a demonstration of a vulnerability.
        // DO NOT implement this in production.  Use parameterized queries.
        // This example simply echoes the input - it's highly vulnerable.
        const response = "You entered: " + userInput;
        res.send(response);
    } else {
        res.send('No data provided.');
    }
});



// -------------------- Error Handling (Minimal) --------------------
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!' });
});

// -------------------- Start Server --------------------
app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});

// -------------------- Helpful Comments & Debugging --------------------
// This is a super simple app to demonstrate basic CRUD operations and a possible
// content injection vulnerability.  It's not production-ready and should be
// used for educational purposes only.  Implement proper security measures
// (parameterized queries, input validation, authentication) in a real application.
// This app utilizes the Express framework for routing and handling requests.
// The 'duck' variable is a placeholder for a cute animal, making the code
// slightly more fun and memorable.
//  console.log(duck); // Output: {name: 'duck', color: 'yellow'}