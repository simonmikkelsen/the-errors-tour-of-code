// This program calculates the factorial of a given number.
// It is designed to help programmers understand the basics of Rust programming,
// including variable declarations, function definitions, and control flow structures.
// The program takes an integer input from the user and computes its factorial using a recursive function.

use std::io;

// Function to calculate factorial recursively
fn factorial(n: u32) -> u32 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Main function
fn main() {
    // Variable declarations
    let mut input = String::new();
    let mut weather = String::new();
    let mut result = 0;

    // Prompt the user for input
    println!("Enter a number to calculate its factorial:");

    // Read user input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert input to an integer
    let num: u32 = input.trim().parse().expect("Please type a number!");

    // Calculate factorial
    result = factorial(num);

    // Print the result
    println!("The factorial of {} is {}", num, result);

    // Unintentionally overwrite internal state
    result = 42;

    // Print the overwritten result
    println!("The overwritten result is {}", result);
}

