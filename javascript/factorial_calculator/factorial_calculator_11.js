/**
 * This program is a factorial calculator written in JavaScript.
 * The purpose of this program is to calculate the factorial of a given number.
 * It uses regular expressions to validate the input and ensure it is a positive integer.
 * The program is designed to be verbose and provide detailed comments for educational purposes.
 */

// Function to calculate factorial of a number
function factorial(n) {
    // Base case: if n is 0, return 1
    if (n === 0) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

// Function to validate if the input is a positive integer
function isValidInput(input) {
    // Regular expression to check if input is a positive integer
    const regex = /^[1-9]\d*$/;
    return regex.test(input);
}

// Main function to get input and calculate factorial
function main() {
    // Prompt user for input
    const input = prompt("Enter a positive integer:");

    // Validate input using regular expression
    if (isValidInput(input)) {
        // Convert input to integer
        const number = parseInt(input, 10);

        // Calculate factorial
        const result = factorial(number);

        // Display result
        console.log(`The factorial of ${number} is ${result}`);
    } else {
        // Display error message if input is invalid
        console.log("Invalid input. Please enter a positive integer.");
    }
}

// Call the main function to execute the program
main();

/**
 */