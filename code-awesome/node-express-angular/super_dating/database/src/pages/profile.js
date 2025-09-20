/*
 * Profile Page - Database Definition
 *
 * This file defines the structure and data for the user profiles
 * within the super_dating application.  It's designed to be
 * highly denormalized, without foreign key constraints or indexes,
 * as per the original design specifications.
 *
 * Author:  ChatGPT
 * Date:   2024-07-26
 */

const profileSchema = {
  // Array of objects representing user profiles
  profiles: [
    {
      // User 1 - Cute Bunny
      id: "bunny_123",
      username: "BunBunRunner",
      name: "Bun Bun",
      gender: "Male",
      age: 25,
      description: "A friendly runner with a love for long distances.",
      date_time: "2024-07-26 10:00:00",
      location: {
        latitude: 34.0522,
        longitude: -118.2437,
        address: "Downtown Los Angeles"
      },
      images: [
        "bunny_image_1.jpg",
        "bunny_image_2.jpg"
      ],
      preferences: {
        hiking: true,
        music: ["Rock", "Pop"],
        sports: ["Running"]
      }
    },
    {
      // User 2 -  Sleepy Kitten
      id: "kitty_456",
      username: "SleepyKitty",
      name: "Mittens",
      gender: "Female",
      age: 30,
      description: "A relaxed cat who enjoys naps and sunshine.",
      date_time: "2024-07-26 14:30:00",
      location: {
        latitude: 40.7128,
        longitude: -74.0060,
        address: "Midtown New York"
      },
      images: [
        "kitty_image_1.jpg",
        "kitty_image_2.jpg"
      ],
      preferences: {
        reading: true,
        music: ["Classical", "Jazz"],
        sports: []
      }
    },
    {
      // User 3 - Playful Puppy
      id: "puppy_789",
      username: "HappyPup",
      name: "Buddy",
      gender: "Male",
      age: 22,
      description: "An energetic dog who loves to play fetch.",
      date_time: "2024-07-26 08:00:00",
      location: {
        latitude: 51.5074,
        longitude: -0.1278,
        address: "Central London"
      },
      images: [
        "puppy_image_1.jpg",
        "puppy_image_2.jpg"
      ],
      preferences: {
        hiking: true,
        music: ["Pop"],
        sports: ["Running", "Fetch"]
      }
    }
  ]
};

module.exports = profileSchema;