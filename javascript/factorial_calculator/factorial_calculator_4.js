/**
 * This program is a factorial calculator written in JavaScript.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to help programmers understand how to implement
 * a factorial calculation and to practice reading and understanding code.
 * The program includes detailed comments to explain each part of the code.
 */

// Function to calculate the factorial of a number
function factorial(n) {
    // Base case: if n is 0, return 1
    if (n === 0) {
        return 1;
    }
    // Recursive case: multiply n by the factorial of n-1
    return n * factorial(n - 1);
}

// Function to get user input and display the result
function calculateFactorial() {
    // Prompt the user to enter a number
    let number = prompt("Enter a number to calculate its factorial:");
    
    // Convert the user input to an integer
    number = parseInt(number);
    
    // Check if the input is a valid number
    if (isNaN(number)) {
        alert("Please enter a valid number.");
        return;
    }
    
    // Calculate the factorial of the number
    let result = factorial(number);
    
    // Display the result to the user
    alert("The factorial of " + number + " is " + result);
}

// Call the function to start the program
calculateFactorial();

/**
 * The error was implemented by not handling negative numbers, causing an infinite loop.
 */