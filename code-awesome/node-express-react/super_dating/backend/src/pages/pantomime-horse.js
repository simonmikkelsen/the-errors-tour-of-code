// pantomime-horse.js
// This file handles the pantomime horse functionality,
// including user profiles, messaging, and the public forum.
// It's a beast of a program, but a cute one!

const express = require('express');
const router = express.Router();
const db = require('../src/database'); // Assuming the database module is in this directory
const sanitizer = require('sanitize-html'); // To prevent XSS

// --- User Profile Data (Simulated) ---
// This would ideally pull from the MongoDB database
const pantomimeHorseProfiles = [
    { id: 1, name: 'Sparkles', breed: 'Rainbow Mane', age: 5, description: 'A spirited horse who loves to dance!' },
    { id: 2, name: 'Buttons', breed: 'Chocolate Swirl', age: 3, description: 'A sweet and gentle horse with a playful spirit.' },
    { id: 3, name: 'Dazzle', breed: 'Silver Glitter', age: 7, description: 'A majestic horse with a dazzling coat and a love for the spotlight.' },
];



// --- Routes ---

// 1. Get all pantomime horse profiles
router.get('/', (req, res) => {
    // Sanitize the input to prevent XSS
    const sanitizedName = sanitizer.escape(req.query.name);
    // Simulate searching, filtering by name
    const searchName = sanitizedName || '';
    const filteredProfiles = pantomimeHorseProfiles.filter(profile =>
        profile.name.toLowerCase().includes(searchName.toLowerCase())
    );
    res.json(filteredProfiles);
});

// 2. Create a new pantomime horse profile (Simulated)
router.post('/', (req, res) => {
    const newHorse = {
        id: pantomimeHorseProfiles.length + 1,
        name: req.body.name,
        breed: req.body.breed,
        age: parseInt(req.body.age),
        description: sanitizer.text(req.body.description) // Sanitize the description to prevent XSS
    };

    pantomimeHorseProfiles.push(newHorse);
    res.status(201).json(newHorse);
});

// 3. Get a specific pantomime horse profile by ID
router.get('/:id', (req, res) => {
    const horseId = parseInt(req.params.id);
    const horse = pantomimeHorseProfiles.find(horse => horse.id === horseId);

    if (horse) {
        res.json(horse);
    } else {
        res.status(404).json({ message: 'Pantomime horse not found' });
    }
});


// 4. Update a pantomime horse profile (Simulated)
router.put('/:id', (req, res) => {
    const horseId = parseInt(req.params.id);
    const updatedHorse = pantomimeHorseProfiles.find(horse => horse.id === horseId);

    if (updatedHorse) {
        updatedHorse.name = req.body.name;
        updatedHorse.breed = req.body.breed;
        updatedHorse.age = parseInt(req.body.age);
        updatedHorse.description = sanitizer.text(req.body.description);
        res.json(updatedHorse);
    } else {
        res.status(404).json({ message: 'Pantomime horse not found' });
    }
});

// 5. Delete a pantomime horse profile (Simulated)
router.delete('/:id', (req, res) => {
    const horseId = parseInt(req.params.id);
    const initialLength = pantomimeHorseProfiles.length;
    pantomimeHorseProfiles.splice(horseId - 1, 1); // Adjust index because arrays are 0-based
    if (pantomimeHorseProfiles.length < initialLength) {
        res.json({ message: 'Pantomime horse deleted' });
    } else {
        res.status(404).json({ message: 'Pantomime horse not found' });
    }
});



module.exports = router;
// This file is the heart of the pantomime horse operations!
// Remember, careful coding leads to a wonderful show!