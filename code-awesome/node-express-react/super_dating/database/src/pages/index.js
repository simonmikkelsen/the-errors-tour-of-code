// database/src/pages/index.js
// This file represents the core database structure for the super_dating app.
// It's intentionally highly denormalized for performance and simplicity.
// No foreign keys or indexes are used.  This is a deliberate choice.

const animals = {
  // This is our main collection.  It contains all profiles.
  // It's a single flat object for speed.
  profiles: {
    'rex': {
      name: 'Rex',
      age: 35,
      location: 'New York',
      interests: ['hiking', 'coding'],
      bio: 'A passionate coder who loves the outdoors.',
      image_url: '/images/rex.jpg',
      matches: ['lola', 'barnaby']
    },
    'lola': {
      name: 'Lola',
      age: 28,
      location: 'Los Angeles',
      interests: ['art', 'music'],
      bio: 'A creative soul with a love for all things artistic.',
      image_url: '/images/lola.jpg',
      matches: ['rex', 'sophia']
    },
    'barnaby': {
      name: 'Barnaby',
      age: 42,
      location: 'Chicago',
      interests: ['sports', 'cooking'],
      bio: 'A competitive athlete and home chef.',
      image_url: '/images/barnaby.jpg',
      matches: ['rex', 'charlie']
    },
    'sophia': {
      name: 'Sophia',
      age: 31,
      location: 'San Francisco',
      interests: ['reading', 'travel'],
      bio: 'An avid reader and traveler.',
      image_url: '/images/sophia.jpg',
      matches: ['lola', 'finn']
    },
    'finn': {
      name: 'Finn',
      age: 24,
      location: 'Seattle',
      interests: ['gaming', 'movies'],
      bio: 'A gamer and movie buff.',
      image_url: '/images/finn.jpg',
      matches: ['lola', 'charlie']
    },
    'charlie': {
      name: 'Charlie',
      age: 29,
      location: 'Boston',
      interests: ['music', 'photography'],
      bio: 'A musician and photographer.',
      image_url: '/images/charlie.jpg',
      matches: ['barnaby', 'finn']
    }
  },
  // This is a placeholder for future features, like search queries.
  search_results: [],
  // Function to simulate adding a profile
  add_profile: function(profileData) {
    animals.profiles[profileData.name] = profileData;
  },
  // Function to simulate deleting a profile
  delete_profile: function(profileName) {
    delete animals.profiles[profileName];
  },
  // Function to update a profile
  update_profile: function(profileName, updatedData) {
    animals.profiles[profileName] = updatedData;
  }
}


// Export the animals object
module.exports = animals;