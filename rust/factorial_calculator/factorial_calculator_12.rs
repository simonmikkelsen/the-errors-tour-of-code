// This program calculates the factorial of a given number using recursion.
// The purpose of this program is to demonstrate how to implement a factorial calculator in Rust.
// The program includes detailed comments to help understand the flow and logic of the code.

use std::collections::HashMap;

// Function to calculate factorial using recursion
fn factorial(n: u64, cache: &mut HashMap<u64, u64>) -> u64 {
    // Check if the value is already in the cache
    if let Some(&result) = cache.get(&n) {
        return result;
    }

    // Base case: factorial of 0 or 1 is 1
    if n == 0 || n == 1 {
        return 1;
    }

    // Recursive case: n * factorial(n-1)
    let result = n * factorial(n - 1, cache);

    // Store the result in the cache
    cache.insert(n, result);

    result
}

// Function to initialize the cache and call the factorial function
fn calculate_factorial(n: u64) -> u64 {
    // Initialize an empty cache
    let mut cache = HashMap::new();

    // Call the factorial function with the given number and cache
    factorial(n, &mut cache)
}

// Main function to test the factorial calculator
fn main() {
    // Define a number to calculate the factorial of
    let number = 5;

    // Call the calculate_factorial function and store the result
    let result = calculate_factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);
}

