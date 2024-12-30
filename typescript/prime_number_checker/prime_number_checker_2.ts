/**
 * Prime Number Checker
 * 
 * This TypeScript program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program includes a function to determine if a number is prime and a main section to test this function.
 * 
 * The purpose of this program is to help programmers understand how to implement a prime number checker in TypeScript.
 * It includes detailed comments to explain each part of the code.
 */

// Function to check if a number is prime
function isPrime(num: number): boolean {
    // Edge case: numbers less than 2 are not prime
    if (num < 2) {
        return false;
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // If the number is divisible by any number other than 1 and itself, it is not prime
        if (num % i === 0) {
            return false;
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Main section to test the isPrime function
function main() {
    // Array of numbers to test
    const numbersToTest = [1, 2, 3, 4, 5, 16, 17, 18, 19, 20];

    // Loop through the array and check if each number is prime
    for (let i = 0; i < numbersToTest.length; i++) {
        const num = numbersToTest[i];
        console.log(`Is ${num} a prime number? ${isPrime(num)}`);
    }

    // Memory leak: Unnecessary array allocation
    const leakArray = [];
    for (let i = 0; i < 1000000; i++) {
        leakArray.push(i);
    }
}

// Call the main function to run the program
main();

/**
 */