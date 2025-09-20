/**
 * Prime Number Checker
 * 
 * This TypeScript program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * 
 * The program includes a function `isPrime` that takes a number as input and returns a boolean indicating
 * whether the number is prime or not. The function uses a loop to check for divisors of the number.
 * 
 * The program also includes a main section where the `isPrime` function is called with a sample number,
 * and the result is logged to the console.
 */

/**
 * Function to check if a number is prime.
 * @param num - The number to check.
 * @returns boolean - True if the number is prime, false otherwise.
 */
function isPrime(num: number): boolean {
    // Check if the number is less than or equal to 1
    if (num <= 1) {
        return false;
    }

    // Loop from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        // If the number is divisible by any number in the loop, it is not prime
        if (num % i == 0) {
            return false;
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Main section of the program
const numberToCheck = 29; // Sample number to check
const result = isPrime(numberToCheck); // Call the isPrime function with the sample number

// Log the result to the console
console.log(`Is ${numberToCheck} a prime number? ${result}`); // Output the result

