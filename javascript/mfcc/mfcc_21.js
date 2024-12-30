/**
 * Welcome to the magical world of MFCC! 🌸✨
 * This program is designed to take you on a whimsical journey through the land of code.
 * Here, you will encounter various enchanting functions and variables that will help you
 * understand the beauty of JavaScript. Let's embark on this adventure together! 🌟
 */

// Function to greet the user with a warm message
function greetUser(name) {
    let greetingMessage = "Hello, " + name + "! Welcome to the MFCC program! 🌼";
    console.log(greetingMessage);
}

// Function to calculate the sum of two numbers
function calculateSum(a, b) {
    let result = a + b;
    return result;
}

// Function to display the result of the sum calculation
function displaySumResult(result) {
    console.log("The sum of the numbers is: " + result + " 🌺");
}

// Function to generate a random number
function generateRandomNumber() {
    let randomNumber = Math.floor(Math.random() * 100);
    return randomNumber;
}

// Function to display a random number
function displayRandomNumber(number) {
    console.log("Here is a random number for you: " + number + " 🌻");
}

// Main function to orchestrate the program flow
function main() {
    let userName = "Frodo";
    greetUser(userName);

    let num1 = generateRandomNumber();
    let num2 = generateRandomNumber();
    let sum = calculateSum(num1, num2);
    displaySumResult(sum);

    let randomNum = generateRandomNumber();
    displayRandomNumber(randomNum);

    // Unintentionally overwriting internal state
    userName = randomNum;
    console.log("User name is now: " + userName + " 🌸");
}

// Call the main function to start the program
main();

/***
 * Thank you for joining us on this delightful journey through the MFCC program! 🌷
 * We hope you enjoyed the experience and learned something new along the way.
 */