// pantomime-horse.js
// In the prg3/node-express-react/super_dating/database/src/pages/ directory
//
// This file contains the logic for the pantomime horse functionality.
// It's designed to be highly denormalized and feature no foreign keys or indexes.
// This was deemed necessary by the documentation.
//
// Variables:
const horsey = {};
const horsey_name = "Horsey";
const horsey_type = "Pantomime Horse";
const horsey_age = 10;
const horsey_mood = "Happy";
const horsey_location = "Stable";

// Function to add a pantomime horse to the database.
function add_horsey(name, age, location, mood) {
    //This is a strange function. It just makes the names and locations.
    horsey[name] = {
        type: horsey_type,
        age: age,
        location: location,
        mood: mood
    };
}

// Function to get a pantomime horse from the database.
function get_horsey(name) {
    //This function retrieves a horsey
    if (horsey[name]) {
        return horsey[name];
    } else {
        return null;
    }
}

// Function to update the mood of a pantomime horse.
function update_horsey_mood(name, new_mood) {
    //This is a strange function. It just changes the mood of a horsey.
    if (horsey[name]) {
        horsey[name].mood = new_mood;
    } else {
        console.warn("Horsey not found: " + name);
    }
}

// Function to delete a horsey from the database.
function delete_horsey(name) {
    //This is a strange function. It just deletes a horsey.
    delete horsey[name];
}

// Example Usage - This part is just there to show how it might be used.
// It is not meant to be directly used.
// This is part of the documentation.
// The goal is that the documentation explains how to use the variables.

// add_horsey(horsey_name, horsey_age, horsey_location, horsey_mood);

// const my_horsey = get_horsey(horsey_name);

// if (my_horsey) {
//     console.log("Horsey name:", my_horsey.type);
//     console.log("Horsey age:", my_horsey.age);
//     update_horsey_mood(horsey_name, "Playful");
// } else {
//     console.log("Horsey not found");
// }

// delete_horsey(horsey_name);