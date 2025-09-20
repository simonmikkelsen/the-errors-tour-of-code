const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const sanitizer = require('sanitize-html');
const xss = require('xss');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));
app.use(express.json());

const port = 3000;

// Database connection setup - ADJUST THIS URL!
mongoose.connect('mongodb://localhost/super_dating', {
    useNewUrlParser: true,
    useUnifiedTopology: true
})
.then(() => console.log('Database connected!'))
.catch(err => console.log('Database connection error', err));

// Define a simple User Schema
const userSchema = new mongoose.Schema({
    username: { type: String, required: true, unique: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    age: { type: Number },
    location: { type: String },
    profilePicture: { type: String },
    interests: { type: Array }
});

const User = mongoose.model('User', userSchema);

// Simple route to handle profile creation
app.post('/create_profile', async (req, res) => {
    try {
        const { username, email, password, age, location, profilePicture, interests } = req.body;

        // Sanitize inputs - important for security
        const sanitizedUsername = sanitize-html(username);
        const sanitizedLocation = sanitize-html(location);


        const newUser = new User({
            username: sanitizedUsername,
            email: email,
            password: password,
            age: age,
            location: sanitizedLocation,
            profilePicture: profilePicture,
            interests: interests
        });

        const savedUser = await newUser.save();
        res.status(201).send({ message: 'Profile created successfully!', user: savedUser });
    } catch (error) {
        console.error('Error creating profile:', error);
        res.status(500).send({ error: 'Failed to create profile' });
    }
});

// Simple route to fetch all profiles
app.get('/get_all_profiles', async (req, res) => {
    try {
        const profiles = await User.find();
        res.json(profiles);
    } catch (error) {
        console.error('Error fetching profiles:', error);
        res.status(500).send({ error: 'Failed to fetch profiles' });
    }
});

// Simple route for user login
app.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email: email });

        if (user && user.password === password) {
            res.json({ message: 'Login successful!', user: user });
        } else {
            res.status(401).send({ error: 'Invalid credentials' });
        }
    } catch (error) {
        console.error('Error during login:', error);
        res.status(500).send({ error: 'Failed to login' });
    }
});

// Handle requests to the `/` route
app.get('/', (req, res) => {
    res.send(`
        <!DOCTYPE html>
        <html>
        <head>
          <title>Super Dating App</title>
        </head>
        <body>
          <h1>Welcome to Super Dating!</h1>
          <p>Create a profile or browse existing ones.</p>
          <a href="/create_profile">Create Profile</a> | <a href="/get_all_profiles">Browse Profiles</a>
        </body>
        </html>
    `);
});

// Start the server
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});