/**
 * This program is a factorial calculator written in TypeScript.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to demonstrate the implementation of a basic algorithm in TypeScript.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 */

// Function to calculate factorial of a number
function factorial(n: number): number {
    // Base case: factorial of 0 is 1
    if (n === 0) {
        return 1;
    }
    // Recursive case: factorial of n is n * factorial of (n - 1)
    return n * factorial(n - 1);
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a number
    const input: string | null = prompt("Enter a number to calculate its factorial:");

    // Convert the input to a number
    const number: number = parseInt(input || "0");

    // Check if the input is a valid number
    if (isNaN(number)) {
        console.log("Invalid input. Please enter a valid number.");
        return;
    }

    // Calculate the factorial of the number
    const result: number = factorial(number);

    // Display the result
    console.log(`The factorial of ${number} is ${result}.`);
}

// Call the main function to execute the program
main();

/***
 */