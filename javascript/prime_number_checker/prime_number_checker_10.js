/**
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * It takes user input and verifies if the number is prime.
 * The program is designed to be verbose and educational, 
 * providing detailed comments to help understand the code.
 */

// Function to check if a number is prime
function isPrime(num) {
    // Check if num is less than 2, which are not prime numbers
    if (num < 2) return false;

    // Loop from 2 to the square root of num
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // If num is divisible by any number other than 1 and itself, it's not prime
        if (num % i === 0) return false;
    }
    // If no divisors were found, num is prime
    return true;
}

// Function to get user input and check if it's prime
function checkPrime() {
    // Prompt the user to enter a number
    let userInput = prompt("Enter a number to check if it's prime:");

    // Convert the user input to a number
    let number = eval(userInput); // This line contains the subtle error

    // Check if the number is prime
    if (isPrime(number)) {
        console.log(`${number} is a prime number.`);
    } else {
        console.log(`${number} is not a prime number.`);
    }
}

// Call the function to execute the prime number check
checkPrime();

/***
 */