// index.js
const express = require('express');
const mongoose = require('mongoose');
const app = express();
const port = 3000;

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/super_dating', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const datingProfilesSchema = new mongoose.Schema({
  animalName: { type: String, required: true },
  age: { type: Number, required: true },
  location: { type: String, required: true },
  interests: { type: [String], required: true },
  description: { type: String },
});

const DatingProfiles = mongoose.model('DatingProfiles', datingProfilesSchema);

// API Routes
app.get('/profiles', async (req, res) => {
  try {
    const profiles = await DatingProfiles.find({});
    res.json(profiles);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch profiles' });
  }
});

app.post('/profiles', async (req, res) => {
  try {
    const newProfile = new DatingProfiles(req.body);
    const savedProfile = await newProfile.save();
    res.status(201).json(savedProfile);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to create profile' });
  }
});

app.get('/profiles/:id', async (req, res) => {
  try {
    const profile = await DatingProfiles.findById(req.params.id);
    if (!profile) {
      return res.status(404).json({ error: 'Profile not found' });
    }
    res.json(profile);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch profile' });
  }
});

app.put('/profiles/:id', async (req, res) => {
  try {
    const updatedProfile = await DatingProfiles.findByIdAndUpdate(
      req.params.id,
      req.body,
      {
        new: true,
        runValidators: true,
      }
    );

    if (!updatedProfile) {
      return res.status(404).json({ error: 'Profile not found' });
    }
    res.json(updatedProfile);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to update profile' });
  }
});

app.delete('/profiles/:id', async (req, res) => {
  try {
    const deletedProfile = await DatingProfiles.findByIdAndDelete(req.params.id);

    if (!deletedProfile) {
      return res.status(404).json({ error: 'Profile not found' });
    }
    res.json(deletedProfile);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to delete profile' });
  }
});

app.listen(port, () => {
  console.log(`Super Dating app listening at http://localhost:${port}`);
});