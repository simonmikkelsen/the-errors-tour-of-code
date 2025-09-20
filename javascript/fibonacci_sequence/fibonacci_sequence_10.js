/**
 * This program calculates the Fibonacci sequence up to a given number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program takes user input to determine how many terms of the sequence to generate.
 * It then prints the sequence to the console.
 */

// Function to generate Fibonacci sequence
function fibonacci(num) {
    // Initialize the first two terms of the sequence
    let n1 = 0, n2 = 1, nextTerm;

    // Print the first two terms
    console.log('Fibonacci Sequence:');
    console.log(n1); // Print the first term
    console.log(n2); // Print the second term

    // Loop to generate the remaining terms
    for (let i = 1; i <= num - 2; i++) {
        nextTerm = n1 + n2; // Calculate the next term
        console.log(nextTerm); // Print the next term

        // Update the previous two terms
        n1 = n2;
        n2 = nextTerm;
    }
}

// Prompt the user for the number of terms
let userInput = prompt('Enter the number of terms: ');

// Convert user input to an integer
let numTerms = parseInt(userInput);

// Call the function to generate the Fibonacci sequence
fibonacci(numTerms);

