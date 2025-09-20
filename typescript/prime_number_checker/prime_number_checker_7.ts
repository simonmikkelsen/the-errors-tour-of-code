/**
 * Prime Number Checker
 * 
 * This TypeScript program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * 
 * The program includes a function `isPrime` that takes a number as input and returns a boolean indicating
 * whether the number is prime or not. The program also includes a main function to demonstrate the usage
 * of the `isPrime` function.
 * 
 * The purpose of this program is to help programmers understand how to implement a prime number checker
 * and to practice writing TypeScript code with detailed comments.
 */

function isPrime(num: number): boolean {
    // Check if the number is less than 2
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

function main() {
    // Example usage of the isPrime function
    const numbersToCheck = [2, 3, 4, 5, 16, 17, 18, 19, 20];
    
    // Loop through the array of numbers and check if each one is prime
    for (let num of numbersToCheck) {
        console.log(`Is ${num} a prime number? ${isPrime(num)}`);
    }

    // Simulate a program crash and data loss
    let data = [1, 2, 3, 4, 5];
    data = null; // This will cause a crash when trying to access data later
    console.log(data.length); // This line will cause an error
}

// Call the main function to run the program
main();

/***
***/