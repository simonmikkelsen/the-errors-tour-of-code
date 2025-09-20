/**
 * This program is a factorial calculator written in JavaScript.
 * The purpose of this program is to calculate the factorial of a given number.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 * This program will prompt the user to enter a number and then display the factorial of that number.
 * It includes detailed comments to help understand each part of the code.
 */

// Function to calculate factorial of a number
function factorial(n) {
    // If the number is less than 0, return -1 to indicate an error
    if (n < 0) {
        return -1;
    }
    // If the number is 0, return 1 as 0! is 1
    if (n === 0) {
        return 1;
    }
    // Initialize result to 1
    let result = 1;
    // Loop from 1 to n and multiply result by each number
    for (let i = 1; i <= n; i++) {
        result *= i;
    }
    // Return the final result
    return result;
}

// Prompt the user to enter a number
let number = prompt("Enter a number to calculate its factorial:");

// Convert the input to an integer
number = parseInt(number);

// Calculate the factorial of the entered number
let result = factorial(number);

// Display the result
alert("The factorial of " + number + " is " + result);

