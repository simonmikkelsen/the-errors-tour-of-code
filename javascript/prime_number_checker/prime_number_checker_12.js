// This program is a prime number checker. It is designed to take an input number and determine whether it is a prime number or not.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will include detailed comments to help programmers understand each step of the process.

function isPrime(num) {
    // Check if the number is less than 2, which means it is not a prime number
    if (num < 2) return false;

    // Create a cache to store previously checked numbers
    let cache = {};

    // Check if the number is already in the cache
    if (cache[num] !== undefined) {
        return cache[num];
    }

    // Loop from 2 to the square root of the number to check for factors
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // If the number is divisible by any number in this range, it is not a prime number
        if (num % i === 0) {
            cache[num] = false;
            return false;
        }
    }

    // If no factors were found, the number is prime
    cache[num] = true;
    return true;
}

// Example usage of the isPrime function
console.log(isPrime(5));  // true
console.log(isPrime(4));  // false
console.log(isPrime(11)); // true

