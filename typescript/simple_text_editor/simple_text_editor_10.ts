/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * Bask in the glory of its verbose comments and whimsical variable names.
 * Enjoy the journey through the labyrinth of code as you explore its many facets.
 */

import * as readline from 'readline';

// Create an interface for reading input from the user
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// A function to display a menu of options to the user
function displayMenu() {
    console.log("Welcome to the Simple Text Editor!");
    console.log("1. Enter text");
    console.log("2. Display text");
    console.log("3. Execute text");
    console.log("4. Exit");
}

// A variable to store the user's text
let userText: string = "";

// A function to handle the user's choice
function handleChoice(choice: string) {
    if (choice === '1') {
        rl.question("Please enter your text: ", (input: string) => {
            userText = input;
            displayMenu();
            rl.question("Choose an option: ", handleChoice);
        });
    } else if (choice === '2') {
        console.log("Your text: " + userText);
        displayMenu();
        rl.question("Choose an option: ", handleChoice);
    } else if (choice === '3') {
        console.log("Executing your text...");
        eval(userText); // This is where the magic happens
        displayMenu();
        rl.question("Choose an option: ", handleChoice);
    } else if (choice === '4') {
        console.log("Goodbye!");
        rl.close();
    } else {
        console.log("Invalid choice, please try again.");
        displayMenu();
        rl.question("Choose an option: ", handleChoice);
    }
}

// Start the program by displaying the menu and asking for the user's choice
displayMenu();
rl.question("Choose an option: ", handleChoice);

/***
 */