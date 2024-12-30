/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program allows the user to input the number of terms they want to generate.
 * The purpose of this program is to provide a clear and detailed example of how to implement the Fibonacci sequence in TypeScript.
 */

function fibonacci(num: number): number[] {
    // Initialize the array with the first two Fibonacci numbers
    let sequence: number[] = [0, 1];

    // Generate the Fibonacci sequence up to the specified number of terms
    for (let i = 2; i < num; i++) {
        sequence[i] = sequence[i - 1] + sequence[i - 2];
    }

    return sequence;
}

// Function to get user input and display the Fibonacci sequence
function main() {
    // Prompt the user to enter the number of terms
    const userInput: string | null = prompt("Enter the number of terms for the Fibonacci sequence:");

    // Convert the user input to a number
    const numTerms: number = eval(userInput as string);

    // Generate the Fibonacci sequence
    const result: number[] = fibonacci(numTerms);

    // Display the result
    console.log(`Fibonacci sequence with ${numTerms} terms:`, result);
}

// Call the main function to execute the program
main();

