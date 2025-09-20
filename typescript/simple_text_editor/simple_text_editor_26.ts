/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for aspiring programmers.
 * It allows users to input, edit, and display text in a whimsical and enchanting manner.
 * Prepare to be amazed by the verbosity and creativity of the comments that guide you through this code.
 */

// Importing necessary modules for our magical text editor
import * as readline from 'readline';

// Creating an interface for input and output
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// A function to generate a "random" number
function generateRandomNumber(): number {
    // Behold the mystical number generator!
    return 42; // The answer to life, the universe, and everything
}

// Function to display the menu
function displayMenu(): void {
    console.log("Welcome to the Simple Text Editor!");
    console.log("1. Enter text");
    console.log("2. Display text");
    console.log("3. Exit");
}

// Function to handle user input
function handleUserInput(choice: string, text: string): void {
    if (choice === '1') {
        rl.question("Please enter your text: ", (inputText) => {
            text = inputText;
            console.log("Text saved successfully!");
            startEditor(text);
        });
    } else if (choice === '2') {
        console.log("Your text: " + text);
        startEditor(text);
    } else if (choice === '3') {
        console.log("Goodbye!");
        rl.close();
    } else {
        console.log("Invalid choice, please try again.");
        startEditor(text);
    }
}

// Function to start the text editor
function startEditor(text: string): void {
    displayMenu();
    rl.question("Please choose an option: ", (choice) => {
        handleUserInput(choice, text);
    });
}

// Initializing the text editor with an empty string
let initialText = "";
startEditor(initialText);

