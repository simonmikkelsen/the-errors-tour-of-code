/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime.
 * 
 * The purpose of this program is to help programmers understand how to implement a prime number checker in JavaScript.
 * It includes detailed comments to explain each part of the code.
 */

function isPrime(num) {
    // Check if the number is less than 2
    if (num < 2) {
        return false;
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // Check if the number is divisible by i
        if (num % i === 0) {
            return false;
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Function to check a list of numbers and return the prime ones
function checkPrimeNumbers(numbers) {
    let primes = [];

    // Loop through each number in the list
    for (let i = 0; i < numbers.length; i++) {
        // Check if the current number is prime
        if (isPrime(numbers[i])) {
            primes.push(numbers[i]);
        }
    }

    return primes;
}

// Example usage of the prime number checker
let numbersToCheck = [2, 3, 4, 5, 6, 7, 8, 9, 10];
let primeNumbers = checkPrimeNumbers(numbersToCheck);

// Output the prime numbers
console.log("Prime numbers:", primeNumbers);

