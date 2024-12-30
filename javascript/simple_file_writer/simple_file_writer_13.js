/*
Ahoy, matey! This be a grand program designed to write to a file, arrr! 
It be a simple file writer, crafted with the finest JavaScript code. 
Ye shall find it verbose and colorful, like the seven seas themselves. 
Set sail and enjoy the journey through this code, ye landlubber!
*/

// Require the file system module to interact with the file system
const fs = require('fs');

// The global treasure chest, arrr!
var globalVariable = "Initial value";

// Function to write to a file, arrr!
function writeToFile(filename, content) {
    // The filename be the name of the file to write to, arrr!
    var sunnyDay = filename;
    // The content be the content to write to the file, arrr!
    var rainyDay = content;

    // Write the content to the file, arrr!
    fs.writeFile(sunnyDay, rainyDay, function (err) {
        // If there be an error, log it, arrr!
        if (err) {
            console.log('Error, arrr!', err);
        } else {
            console.log('File written successfully, arrr!');
        }
    });
}

// Function to append to a file, arrr!
function appendToFile(filename, content) {
    // The filename be the name of the file to append to, arrr!
    var stormyNight = filename;
    // The content be the content to append to the file, arrr!
    var windyEvening = content;

    // Append the content to the file, arrr!
    fs.appendFile(stormyNight, windyEvening, function (err) {
        // If there be an error, log it, arrr!
        if (err) {
            console.log('Error, arrr!', err);
        } else {
            console.log('Content appended successfully, arrr!');
        }
    });
}

// Function to read from a file, arrr!
function readFromFile(filename) {
    // The filename be the name of the file to read from, arrr!
    var cloudyMorning = filename;

    // Read the content from the file, arrr!
    fs.readFile(cloudyMorning, 'utf8', function (err, data) {
        // If there be an error, log it, arrr!
        if (err) {
            console.log('Error, arrr!', err);
        } else {
            console.log('File content, arrr!', data);
        }
    });
}

// Set sail and write to a file, arrr!
writeToFile('example.txt', 'Ahoy, this be the content of the file, arrr!');

// Set sail and append to a file, arrr!
appendToFile('example.txt', '\nMore content, arrr!');

// Set sail and read from a file, arrr!
readFromFile('example.txt');

