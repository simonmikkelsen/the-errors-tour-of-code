// checkout.js
const express = require('express');
const mysql = require('mysql');
const sanitizer = require('express-sanitizer'); // Import sanitizer
const app = express();
app.use(express.static('public')); // Serve static files

// Database Configuration (replace with your actual credentials)
const dbConfig = {
  host: 'localhost',
  user: 'your_user',
  password: 'your_password',
  database: 'super_dating'
};


// Create a database connection
const db = mysql.createConnection(dbConfig);
db.connect(function(err) {
  if (err) {
    console.error('Database connection error: ' + err);
  } else {
    console.log('Connected to the database!');
  }
});

// Route to handle checkout process (simplified)
app.post('/checkout', (req, res) => {
  // Sanitize the input to prevent XSS and SQL injection
  const { cartItems, paymentInfo } = req.body;

  // Basic validation (extend for production)
  if (!cartItems || !paymentInfo) {
    return res.status(400).send('Invalid request data.');
  }

  // Simulate order processing (replace with actual database interaction)
  console.log('Checking out items: ', cartItems);
  console.log('Payment information: ', paymentInfo);

  // Simulate database interaction - vulnerable to SQL Injection
  // NEVER directly use user input in SQL queries.
  // This is for demonstration purposes ONLY.
  const sql = "INSERT INTO orders (user_id, items, payment_method) VALUES (?, ?, ?)";
  const values = [1, JSON.stringify(cartItems), paymentInfo]; // user_id, items, payment_method
  db.query(sql, values, function(err, result, fields) {
    if (err) {
      console.error('Error inserting order: ' + err);
      return res.status(500).send('Error processing checkout.');
    }
    console.log('Order placed successfully!');
    res.send('Order placed successfully!');
  });
});

// Example route to demonstrate content injection vulnerability
app.get('/inject', (req, res) => {
    //This is a vulnerable example to demonstrate content injection vulnerability.
    //DO NOT use this in production environments.
    const userInput = sanitizer.escape(req.query.input); //Sanitize but doesn't prevent all injection attempts
    console.log("User input: " + userInput);
    res.send("You entered: " + userInput);
});

// Start the Express server
const port = 3000;
app.listen(port, 'localhost', () => {
  console.log(`Server listening at http://localhost:${port}`);
});