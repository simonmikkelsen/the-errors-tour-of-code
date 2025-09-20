/**
 * Welcome to the Magical Function Command Center (MFCC)!
 * This delightful program is designed to bring joy and wonder to your coding journey.
 * It will take you on an enchanting adventure where you will learn to handle user input
 * and execute commands with grace and elegance.
 */

// Importing necessary modules to add a touch of magic
import * as readline from 'readline';
import { exec } from 'child_process';

// Creating a beautiful interface for user interaction
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// A charming function to greet the user
function greetUser() {
    console.log("🌸 Welcome, dear programmer! 🌸");
}

// A whimsical function to ask for the user's name
function askUserName() {
    rl.question("What is your name, brave adventurer? ", (name) => {
        console.log(`Hello, ${name}! Let's embark on a coding quest together.`);
        askForCommand();
    });
}

// A delightful function to ask for a command
function askForCommand() {
    rl.question("Please enter a command to execute: ", (command) => {
        executeCommand(command);
    });
}

// A magical function to execute the user's command
function executeCommand(command: string) {
    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`❌ Oh no! An error occurred: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`⚠️ Warning: ${stderr}`);
            return;
        }
        console.log(`✨ Command output: ${stdout}`);
    });
}

// A function to bid farewell to the user
function sayGoodbye() {
    console.log("🌟 Thank you for visiting the Magical Function Command Center! 🌟");
    rl.close();
}

// A function to start the program
function startProgram() {
    greetUser();
    askUserName();
}

// Starting the program with a sprinkle of fairy dust
startProgram();

/**
 */