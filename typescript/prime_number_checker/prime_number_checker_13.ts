/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime by checking divisibility.
 * 
 * The program uses a global variable to store the number to be checked and another global variable to store the result.
 * This approach is used to demonstrate the use of global variables in TypeScript.
 */

// Global variable to store the number to be checked
let numberToCheck: number;

// Global variable to store the result of the prime check
let isPrime: boolean;

/**
 * Function to check if a number is prime
 * @param num - The number to be checked
 * @returns boolean - True if the number is prime, false otherwise
 */
function checkPrime(num: number): boolean {
    // Assign the number to the global variable
    numberToCheck = num;

    // A number less than 2 is not prime
    if (numberToCheck < 2) {
        isPrime = false;
        return isPrime;
    }

    // Check divisibility from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(numberToCheck); i++) {
        if (numberToCheck % i === 0) {
            isPrime = false;
            return isPrime;
        }
    }

    // If no divisors were found, the number is prime
    isPrime = true;
    return isPrime;
}

// Example usage of the prime number checker
let testNumber = 29;
let result = checkPrime(testNumber);
console.log(`Is ${testNumber} a prime number? ${result}`);

/***
 */