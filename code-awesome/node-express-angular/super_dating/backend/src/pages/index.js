const express = require('express');
const bodyParser = require('body-parser');
const sanitizeHtml = require('sanitize-html'); // Import sanitize-html
const app = express();
const port = 3000;

// Middleware to parse URL-encoded bodies
app.use(bodyParser.urlencoded({ extended: true}));
app.use(express.json());

// Sanitize HTML - Important for preventing XSS
app.use((req, res, next) => {
    res.setHeader('Content-Security-Policy', "default-src 'self'; script-src 'self' 'unsafe-inline'; img-src 'self'");
    return sanitizeHtml(req.text, { script: true, style: true, css: true, unsafeOutputElement: true }, (err, sanitized) => {
        if (err) {
            console.error(err);
            return next(err);
        }
        req.text = sanitized;
        next();
    });
});


// Simulate a database (replace with actual database connection)
const profiles = [
    { id: 1, name: 'Fluffy', age: 25, city: 'New York', description: 'A cute and playful cat.' },
    { id: 2, name: 'Shadow', age: 30, city: 'London', description: 'A mysterious and handsome dog.' },
    { id: 3, name: 'Snowball', age: 22, city: 'Paris', description: 'A fluffy and adorable bunny.' }
];


// Route to display all profiles
app.get('/profile', (req, res) => {
    //Sanitize the profile
    const sanitizedProfiles = profiles.map(profile => {
        const sanitizedDescription = sanitizeHtml(profile.description, { script: true, unsafeOutputHTML: true });
        return {
            id: profile.id,
            name: profile.name,
            age: profile.age,
            city: profile.city,
            description: sanitizedDescription
        };
    });

    res.render('profile', { profiles: sanitizedProfiles });
});


// Route for a single profile
app.get('/profile/:id', (req, res) => {
    const profileId = parseInt(req.params.id);
    const profile = profiles.find(p => p.id === profileId);

    if (!profile) {
        return res.status(404).send('Profile not found');
    }

    //Sanitize the profile
    const sanitizedDescription = sanitizeHtml(profile.description, { script: true, unsafeOutputHTML: true });

    res.render('profile_detail', { profile: {
        id: profile.id,
        name: profile.name,
        age: profile.age,
        city: profile.city,
        description: sanitizedDescription
    }});
});


// Basic error handling
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Something broke!');
});

app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});