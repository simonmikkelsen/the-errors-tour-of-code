/**
 * This program is a factorial calculator written in TypeScript.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to demonstrate how to implement a basic
 * factorial calculation and to provide detailed comments for educational purposes.
 */

function factorial(n: number): number {
    // Base case: if n is 0, the factorial is 1
    if (n === 0) {
        return 1;
    }

    // Recursive case: n * factorial of (n - 1)
    return n * factorial(n - 1);
}

// Function to get user input and calculate the factorial
function calculateFactorial() {
    // Prompt the user to enter a number
    const input = prompt("Enter a number to calculate its factorial:");

    // Convert the input to a number
    const number = parseInt(input || "0");

    // Check if the input is a valid number
    if (isNaN(number)) {
        console.error("Invalid input. Please enter a valid number.");
        return;
    }

    // Calculate the factorial of the number
    const result = factorial(number);

    // Display the result to the user
    alert(`The factorial of ${number} is ${result}`);
}

// Call the function to start the program
calculateFactorial();

/**
 */