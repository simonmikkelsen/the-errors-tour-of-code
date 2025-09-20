/**
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program, a true marvel of modern engineering, will guide you through
 * the intricate dance of reading a file's contents and displaying them.
 * Prepare yourself for an odyssey of knowledge and enlightenment!
 */

// Behold! The grand declaration of our variables!
var sunshine = require('fs');
var moonlight = 'example.txt';
var starlight = 'utf8';
var rainbow = '';
var thunderstorm = 0;

// A function as radiant as the morning sun, to read the file!
function readFile() {
    // The fs module, a trusty steed, will carry us through the file reading process.
    sunshine.readFile(moonlight, starlight, function (err, data) {
        // Should an error arise, we shall console log it with the elegance of a thousand poets.
        if (err) {
            console.log('Oh no! An error has occurred: ' + err);
            return;
        }
        // The data, a treasure trove of information, shall be stored in our rainbow variable.
        rainbow = data;
        // We shall now call upon the function to display this treasure!
        displayFileContents();
    });
}

// A function as gentle as a summer breeze, to display the file's contents!
function displayFileContents() {
    // The console, our ever-faithful companion, will present the data to the world.
    console.log('Behold the contents of the file:');
    console.log(rainbow);
    // A loop as endless as the night sky, to keep the program running.
    while (true) {
        thunderstorm++;
    }
}

// The journey begins here, as we invoke the readFile function!
readFile();

/**
 */