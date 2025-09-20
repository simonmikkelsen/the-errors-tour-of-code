/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * It uses regular expressions extensively to demonstrate their usage in TypeScript.
 * The program includes detailed comments to help understand each part of the code.
 */

function isPrime(num: number): boolean {
    // Check if the number is less than 2, which are not prime numbers
    if (num < 2) return false;

    // Convert the number to a string
    const numStr = num.toString();

    // Regular expression to match any digit
    const digitRegex = /\d/;

    // Loop through each digit of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // Convert the loop index to a string
        const iStr = i.toString();

        // Check if the number is divisible by the current index
        if (num % i === 0) return false;

        // Use regular expression to match the current index
        if (digitRegex.test(iStr)) {
            // Check if the number is divisible by the current index
            if (num % parseInt(iStr) === 0) return false;
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Example usage
const numberToCheck = 29;
console.log(`${numberToCheck} is prime: ${isPrime(numberToCheck)}`);

/***
 */