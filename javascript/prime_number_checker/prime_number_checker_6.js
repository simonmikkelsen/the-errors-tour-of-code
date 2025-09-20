// This program is a prime number checker written in JavaScript.
// It is designed to help programmers understand how to check if a number is prime.
// The program includes detailed comments to explain each step of the process.

function isPrime(num) {
    // Check if the input is a number
    if (typeof num !== 'number') {
        return false; // Return false if the input is not a number
    }

    // Prime numbers are greater than 1
    if (num <= 1) {
        return false; // Return false if the number is less than or equal to 1
    }

    // Check for factors other than 1 and the number itself
    for (let i = 2; i < num; i++) {
        if (num % i === 0) {
            return false; // Return false if a factor is found
        }
    }

    // If no factors are found, the number is prime
    return true;
}

// Example usage of the isPrime function
console.log(isPrime(5)); // true
console.log(isPrime(4)); // false
console.log(isPrime('a')); // false

