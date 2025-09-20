/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime by checking divisibility.
 * 
 * The purpose of this program is to help programmers understand how to implement a prime number checker in JavaScript.
 * It includes detailed comments to explain each part of the code.
 */

function isPrime(num) {
    // Check if the number is less than 2, which are not prime numbers
    if (num < 2) {
        return false;
    }

    // Loop from 2 to the number itself to check for factors
    for (let i = 2; i < num; i++) {
        // If the number is divisible by any number other than 1 and itself, it is not prime
        if (num % i === 0) {
            return false;
        }
    }

    // If no factors are found, the number is prime
    return true;
}

// Test the function with a sample number
let numberToCheck = 29;
console.log(`Is ${numberToCheck} a prime number? ${isPrime(numberToCheck)}`);

/***
 */