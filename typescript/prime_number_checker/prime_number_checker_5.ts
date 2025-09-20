/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime by checking divisibility.
 * 
 * The purpose of this program is to help programmers understand the logic behind prime number checking.
 * It includes detailed comments to explain each step of the process.
 */

function isPrime(num: number): boolean {
    // Check if the number is less than or equal to 1
    if (num <= 1) {
        return false; // Numbers less than or equal to 1 are not prime
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // Check if the number is divisible by i
        if (num % i == 0) {
            return false; // If divisible, the number is not prime
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Test the isPrime function with a sample number
const testNumber = 29;
console.log(`Is ${testNumber} a prime number? ${isPrime(testNumber)}`);

/***
 */