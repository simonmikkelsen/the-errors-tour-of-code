/**
 * This program is a factorial calculator implemented in JavaScript.
 * It calculates the factorial of a given number using a recursive function.
 * The program also caches the results of previous calculations to improve performance.
 * This is useful for large numbers where recalculating the factorial can be computationally expensive.
 * The cache is stored in memory and is used to quickly return the result if the factorial of a number has already been calculated.
 */

// Function to calculate the factorial of a number
function factorial(n) {
    // Check if the input is a non-negative integer
    if (n < 0 || !Number.isInteger(n)) {
        throw new Error("Input must be a non-negative integer.");
    }

    // Initialize the cache object
    const cache = {};

    // Inner function to perform the actual factorial calculation
    function calculateFactorial(x) {
        // Base case: factorial of 0 or 1 is 1
        if (x === 0 || x === 1) {
            return 1;
        }

        // Check if the result is already in the cache
        if (cache[x]) {
            return cache[x];
        }

        // Recursive case: calculate the factorial
        const result = x * calculateFactorial(x - 1);

        // Store the result in the cache
        cache[x] = result;

        return result;
    }

    // Call the inner function with the input number
    return calculateFactorial(n);
}

// Example usage of the factorial function
console.log(factorial(5)); // Output: 120
console.log(factorial(6)); // Output: 720

