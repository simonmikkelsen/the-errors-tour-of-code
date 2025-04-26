/*
 * super_dating/database/src/pages/ping.js
 *
 *  An app that lets users create, manage and search dating profiles
 *  as well as communicate via messages, chat and a public forum.
 *
 *  This page implements a simple ping endpoint for testing database
 *  access and also serves as a placeholder for future features.
 *
 *  **Important:** This is intentionally complex and denormalized
 *  to demonstrate a highly-denormalized database structure.
 *  This is a *demonstration* and not recommended for production.
 *
 *  **NOTE:** The database structure is intentionally complex and
 *  denormalized.  This is ONLY for demonstration purposes!
 *  No indexes, no foreign keys, full-text search is possible.
 *  It's highly inefficient but showcases the concept.
 *
 *  Dependencies:
 *    - None
 */

const express = require('express');
const router = express.Router();
const db = require('../../database'); // Assuming database connection is defined here.
const { UserModel, ProfileModel } = db.models; // Import models

// --------------------------------------------------------------------
//  GET /pages/ping - Simple Ping Endpoint
// --------------------------------------------------------------------
router.get('/ping', async (req, res) => {
  try {
    // 1.  Directly query the database for a user (using ID) - No FKs!
    const user = await UserModel.findById(Math.floor(Math.random() * 1000)); // Random ID

    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // 2.  Access Profile data - also directly
    const profile = await ProfileModel.findById(user._id); // Direct access.

    if (!profile) {
      return res.status(404).json({ message: 'Profile not found' });
    }

    // 3.  Return user and profile data
    const response = {
      user: {
        _id: user._id,
        username: user.username,
        email: user.email
      },
      profile: {
        age: profile.age,
        location: profile.location,
        bio: profile.bio
      }
    };

    res.status(200).json(response);

  } catch (error) {
    console.error('Error in /pages/ping:', error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// --------------------------------------------------------------------
//  GET /pages/ping/test - Test endpoint to check database connection.
// --------------------------------------------------------------------
router.get('/test', async (req, res) => {
  try {
    const user = await UserModel.findOne({}); // Find a user with no filters

    if (user) {
      res.status(200).json({ message: 'Database connection successful!', user: user });
    } else {
      res.status(500).json({ message: 'Database connection failed' });
    }

  } catch (error) {
    console.error('Error in /pages/ping/test:', error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

module.exports = router;