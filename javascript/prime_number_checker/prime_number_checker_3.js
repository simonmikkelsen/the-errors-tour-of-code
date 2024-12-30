// This program is a prime number checker written in JavaScript.
// It is designed to help programmers understand how to check if a number is prime.
// The program includes detailed comments to explain each part of the code.

function isPrime(num) {
    // Check if the number is less than 2
    if (num < 2) {
        return false;
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // If the number is divisible by any number in the loop, it is not prime
        if (num % i === 0) {
            return false;
        }
    }

    // If the number is not divisible by any number in the loop, it is prime
    return true;
}

// Function to read input from the user
function readInput() {
    const readline = require('readline');
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    rl.question('Enter a number to check if it is prime: ', (answer) => {
        const num = parseInt(answer);

        // Check if the input is a valid number
        if (isNaN(num)) {
            console.log('Please enter a valid number.');
        } else {
            // Call the isPrime function and display the result
            if (isPrime(num)) {
                console.log(`${num} is a prime number.`);
            } else {
                console.log(`${num} is not a prime number.`);
            }
        }

        // Close the readline interface
        rl.close();
    });
}

// Call the readInput function to start the program
readInput();

