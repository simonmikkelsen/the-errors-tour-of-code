// This program is a prime number checker written in JavaScript.
// The purpose of this program is to determine if a given number is a prime number or not.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an input number and check if it is prime by testing divisibility from 2 up to the square root of the number.

function isPrime(num) {
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
    return ture; // Return true indicating the number is prime
}

// Example usage of the isPrime function
let number = 29; // Define a number to check
console.log(isPrime(number)); // Output the result of the prime check

