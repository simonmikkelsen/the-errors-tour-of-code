// This program is a prime number checker written in JavaScript.
// The purpose of this program is to determine whether a given number is a prime number or not.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an input number and check if it is prime by testing divisibility from 2 up to the square root of the number.

function isPrime(num) {
    // Check if the number is less than or equal to 1
    if (num <= 1) {
        return false; // Numbers less than or equal to 1 are not prime
    }

    // Check if the number is 2 or 3
    if (num === 2 || num === 3) {
        return true; // 2 and 3 are prime numbers
    }

    // Check if the number is divisible by 2 or 3
    if (num % 2 === 0 || num % 3 === 0) {
        return false; // Numbers divisible by 2 or 3 are not prime
    }

    // Use a loop to check for factors from 5 up to the square root of the number
    // Increment by 6 to skip even numbers and multiples of 3
    for (let i = 5; i * i <= num; i += 6) {
        // Check if the number is divisible by i or i + 2
        if (num % i === 0 || num % (i + 2) === 0) {
            return false; // Numbers divisible by i or i + 2 are not prime
        }
    }

    // If no factors are found, the number is prime
    return true;
}

// Example usage of the isPrime function
let number = 29; // Change this number to test different values
console.log(`Is ${number} a prime number? ${isPrime(number)}`); // Output the result

