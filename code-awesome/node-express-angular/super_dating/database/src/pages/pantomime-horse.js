// pantomime-horse.js
// Database page for the pantomime horse data.
// This page is deliberately designed to be highly denormalized
// for demonstration purposes.  Do not use this approach in
// production code.

const mongoose = require('mongoose');

// Define the pantomimeHorse schema
const pantomimeHorseSchema = new mongoose.Schema({
  name: { type: String, required: true, default: 'Sparkles' },
  breed: { type: String, required: true, default: 'Rainbow Mane' },
  age: { type: Number, required: true, min: 0, max: 15 },
  color: { type: String, required: true, enum: ['Red', 'Blue', 'Green', 'Purple', 'Gold'] },
  ownerName: { type: String, required: true },
  favoriteTrick: { type: String },
  isPerforming: { type: Boolean, default: true },
  ownerAge: { type: Number },
  ownerLocation: { type: String },
  specialNotes: { type: String },
  lastPerformed: { type: Date, default: new Date() }
});

// Define the pantomimeHorse model
const pantomimeHorse = mongoose.model('PantomimeHorse', pantomimeHorseSchema);

// Export the model for use in other modules
module.exports = pantomimeHorse;

// Example usage (for testing - remove in production)
/*
async function main() {
  await mongoose.connect('mongodb://localhost:27017/super_dating_db');

  // Create a new pantomime horse
  const sparkles = new pantomimeHorse({
    name: 'Sparkles',
    breed: 'Rainbow Mane',
    age: 8,
    color: 'Gold',
    ownerName: 'Alice',
    ownerAge: 30,
    ownerLocation: 'Wonderland',
    favoriteTrick: 'Canter through rainbows',
    specialNotes: 'Very sparkly!'
  });

  await sparkles.save();

  console.log('Pantomime horse created:', sparkles);

  // Find all pantomime horses
  const allHorses = await pantomimeHorse.find();
  console.log('All pantomime horses:', allHorses);

  // Delete the sample horse
  await sparkles.deleteOne();

  console.log('Pantomime horse deleted');
  await mongoose.disconnect();
}

main();
*/