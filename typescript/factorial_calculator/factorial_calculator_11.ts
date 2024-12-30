/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number using TypeScript.
 * It demonstrates the use of regular expressions and provides verbose comments
 * to help programmers understand the code.
 */

function factorial(n: number): number {
    // Base case: if n is 0, the factorial is 1
    if (n === 0) {
        return 1;
    }

    // Recursive case: n * factorial of (n - 1)
    return n * factorial(n - 1);
}

// Function to validate if the input is a positive integer
function isValidInput(input: string): boolean {
    // Regular expression to check if the input is a positive integer
    const regex = /^[1-9]\d*$/;
    return regex.test(input);
}

// Main function to execute the factorial calculation
function main() {
    // Example input
    const input = "5";

    // Validate the input
    if (isValidInput(input)) {
        // Convert the input to a number
        const number = parseInt(input, 10);

        // Calculate the factorial
        const result = factorial(number);

        // Output the result
        console.log(`The factorial of ${number} is ${result}`);
    } else {
        // Output an error message if the input is invalid
        console.log("Invalid input. Please enter a positive integer.");
    }
}

// Execute the main function
main();

/***
***/