// This program calculates the factorial of a given number using regular expressions.
// It is designed to be a comprehensive example of Rust programming, including the use of
// regular expressions, error handling, and detailed comments to help new programmers understand
// the code. The program also includes some unnecessary variables and functions to illustrate
// different aspects of Rust programming.

extern crate regex;

use regex::Regex;
use std::io;

// Function to calculate factorial
fn factorial(n: u32) -> u32 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Function to validate input using regular expressions
fn validate_input(input: &str) -> bool {
    let re = Regex::new(r"^\d+$").unwrap();
    re.is_match(input)
}

// Main function
fn main() {
    // Prompt the user for input
    println!("Enter a number to calculate its factorial:");

    // Read input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any whitespace
    let input = input.trim();

    // Validate the input
    if validate_input(input) {
        // Parse the input to an integer
        let number: u32 = input.parse().expect("Failed to parse input");

        // Calculate the factorial
        let result = factorial(number);

        // Print the result
        println!("The factorial of {} is {}", number, result);
    } else {
        // Print an error message if the input is invalid
        println!("Invalid input. Please enter a positive integer.");
    }
}

