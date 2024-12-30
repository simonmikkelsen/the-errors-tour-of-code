/**
 * This program is a prime number checker.
 * It takes an integer input from the user and checks if the number is prime.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will output whether the number is prime or not.
 */

// Function to check if a number is prime
function isPrime(num) {
    // Check if the number is less than or equal to 1
    if (num <= 1) {
        return false;
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // Check if the number is divisible by any number in the loop
        if (num % i === 0) {
            return false;
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Get user input
let number; // Declare a variable to store the user's input

// Check if the input number is prime
if (isPrime(number)) {
    console.log(number + " is a prime number.");
} else {
    console.log(number + " is not a prime number.");
}

