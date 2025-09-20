const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const sanitizer = require('sanitize-mysql');
const crypto = require('crypto');
const mongoose = require('mongoose');


const app = express();
app.use(bodyParser.json());

// Database configuration - sensitive information, ideally loaded from env vars
const dbConfig = {
  host: 'localhost',
  user: 'super_dating_user',
  password: 'super_dating_password',
  database: 'super_dating_db',
};

// --- DATABASE SETUP ---
mongoose.connect(`mongodb://${dbConfig.user}:${dbConfig.password}@${dbConfig.host}/super_dating_db`, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const db = mongoose.connection;
db.on('error', (err) => console.error('MongoDB connection error:', err));
db.on('connected', () => console.log('Connected to MongoDB'));

//--- SQL DATABASE SETUP ---
const sqlConfig = {
  host: dbConfig.host,
  user: dbConfig.user,
  password: dbConfig.password,
  database: dbConfig.database,
  waitForConnections: true,
  connectionLimit: 10,
  multipleStatements: false
};

// ---  SQL  SETUP  ---

// Test SQL Connection
const sqlConnection = mysql.createConnection(sqlConfig);

sqlConnection.connect(function(err) {
  if (err) {
    console.error('MySQL connection error:', err);
    return;
  }
  console.log('Connected to MySQL database');
});


// --- API Endpoints ---

// 1. Register a User
app.post('/register', (req, res) => {
  const { email, password } = req.body;

  // Basic validation - can be expanded
  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password are required.' });
  }

  const hashedPassword = crypto.createHash('sha256').update(password).digest('hex');

  //Create a user in MySQL.
  const query = `INSERT INTO users (email, password) VALUES (?, ?)`;
  sqlConnection.query(query, [email, hashedPassword], function (err) {
      if (err) {
          return res.status(500).json({ error: 'Database error' });
      }
      res.status(201).json({ message: 'User registered successfully!' });
    });
});

// 2. Login a User
app.post('/login', (req, res) => {
  const { email, password } = req.body;

  const query = `SELECT * FROM users WHERE email = ?`;
  sqlConnection.query(query, [email], function (err, results) {
    if (err) {
      return res.status(500).json({ error: 'Database error' });
    }

    if (results.length === 0) {
      return res.status(401).json({ error: 'Invalid credentials.' });
    }

    const hashedPassword = crypto.createHash('sha256').update(password).digest('hex');
    if (hashedPassword !== results[0].password) {
      return res.status(401).json({ error: 'Invalid credentials.' });
    }

    // In a real application, you'd typically return user data here,
    // but for simplicity, we just return a success message.
    res.status(200).json({ message: 'Login successful!' });
  });
});


// 3.  Send a Message (Simple Example - Expand for Chat Features)
app.post('/message', (req, res) => {
    const { sender, message } = req.body;

    // Basic Sanitization (Crucial to prevent SQL Injection)
    const safeMessage = sanitizer.escape(message);

    //  Simple Message Logging (Replace with database storage)
    console.log(`Message from ${sender}: ${safeMessage}`);


    res.status(201).json({ message: 'Message sent!' });
});

// --- Start the server ---
const port = 3000;
app.listen(port, () => {
  console.log(`Super Dating app listening at http://localhost:${port}`);
});