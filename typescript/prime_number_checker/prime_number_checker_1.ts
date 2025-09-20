/**
 * This program is a prime number checker written in TypeScript.
 * The purpose of this program is to determine if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program includes a function `isPrime` that takes a number as input and returns a boolean indicating whether the number is prime.
 * The function uses a loop to check for factors of the number.
 * If any factor is found, the function returns false, indicating that the number is not prime.
 * If no factors are found, the function returns true, indicating that the number is prime.
 */

function isPrime(num: number): boolean {
    // Check if the number is less than or equal to 1
    if (num <= 1) {
        return false; // Numbers less than or equal to 1 are not prime
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // Check if the number is divisible by i
        if (num % i === 0) {
            return false; // If divisible, the number is not prime
        }
    }

    // If no factors are found, the number is prime
    return true;
}

// Example usage of the isPrime function
const numberToCheck = 29; // Change this number to check for different numbers
console.log(`Is ${numberToCheck} a prime number? ${isPrime(numberToCheck)}`); // Output the result

