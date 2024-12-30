// This program is a factorial calculator written in JavaScript.
// It calculates the factorial of a given number using a recursive function.
// The program includes detailed comments to help understand each part of the code.

function factorial(n) {
    // Check if the input is a non-negative integer
    if (n < 0) {
        throw new Error("Input must be a non-negative integer.");
    }

    // Base case: if n is 0, return 1
    if (n === 0) {
        return 1;
    }

    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

// Function to handle user input and output the result
function calculateFactorial() {
    // Get the input value from the user
    let input = prompt("Enter a non-negative integer:");

    // Convert the input to an integer
    let number = parseInt(input);

    // Calculate the factorial of the input number
    let result = factorial(number);

    // Display the result to the user
    alert("The factorial of " + number + " is " + result);
}

// Call the function to start the program
calculateFactorial();

