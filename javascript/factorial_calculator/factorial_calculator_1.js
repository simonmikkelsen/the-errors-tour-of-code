// This program is a factorial calculator written in JavaScript.
// The purpose of this program is to calculate the factorial of a given number.
// A factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

function factorial(n) {
    // Check if the input is a non-negative integer
    if (n < 0) {
        return "Factorial is not defined for negative numbers.";
    }
    if (n === 0) {
        return 1; // The factorial of 0 is 1
    }

    // Initialize the result to 1
    let result = 1;

    // Loop from 1 to n and multiply the result by each number
    for (let i = 1; i <= n; i++) {
        result *= i; // Multiply the current result by the current number
    }

    // Return the final result
    return result;
}

// Test the factorial function with a sample input
let number = 5; // You can change this value to test with other numbers
console.log("The factorial of " + number + " is " + factorial(number)); // Output the result

