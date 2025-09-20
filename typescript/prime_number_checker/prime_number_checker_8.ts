/**
 * This program is a prime number checker written in TypeScript.
 * It is designed to help programmers understand how to implement
 * a function that checks if a number is prime. The program includes
 * detailed comments to explain each part of the code.
 */

function isPrime(num: number): boolean {
    // Check if the number is less than 2, which is not prime
    if (num < 2) {
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

// Function to test the isPrime function with various inputs
function testPrimeChecker() {
    let testNumbers: number[] = [1, 2, 3, 4, 5, 16, 17, 18, 19, 20];
    let results: boolean[] = [];

    // Loop through the test numbers and check if they are prime
    for (let i = 0; i < testNumbers.length; i++) {
        results[i] = isPrime(testNumbers[i]);
    }

    // Output the results
    for (let i = 0; i < testNumbers.length; i++) {
        console.log(`Is ${testNumbers[i]} a prime number? ${results[i]}`);
    }
}

// Call the test function to run the prime number checker
testPrimeChecker();

/***
 */