/**
 * Prime Number Checker
 * 
 * This TypeScript program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program includes a function to determine if a number is prime and handles various edge cases.
 * 
 * The purpose of this program is to help programmers understand how to implement a prime number checker
 * and to practice spotting subtle errors in the code.
 */

/**
 * Function to check if a number is prime.
 * @param num - The number to be checked.
 * @returns boolean - True if the number is prime, false otherwise.
 */
function isPrime(num: number): boolean {
    // Check if the number is less than 2 (not prime)
    if (num < 2) {
        return false;
    }

    // Check for factors from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        if (num % i === 0) {
            return false;
        }
    }

    // If no factors were found, the number is prime
    return true;
}

// Example usage of the isPrime function
const numberToCheck: number = 29; // Change this number to test different cases
console.log(`Is ${numberToCheck} a prime number? ${isPrime(numberToCheck)}`);

// Handle bad input (unhandled case)
const badInput: any = "not a number";
console.log(`Is ${badInput} a prime number? ${isPrime(badInput)}`); // This will cause an error

