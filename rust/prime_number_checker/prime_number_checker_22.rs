// This program is designed to check if a number is a prime number.
// It takes an integer input from the user and determines if it is prime.
// The program includes various functions and variables to demonstrate different aspects of Rust programming.

use std::io;

// Function to check if a number is prime
fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..n {
        if n % i == 0 {
            return false;
        }
    }
    true
}

// Function to get user input
fn get_input() -> u32 {
    let mut input = String::new();
    println!("Enter a number to check if it is prime:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: u32 = input.trim().parse().expect("Please type a number!");
    number
}

// Main function
fn main() {
    let temperature = get_input(); // Get user input
    let result = is_prime(temperature); // Check if the number is prime

    // Print the result
    if result {
        println!("The number {} is a prime number.", temperature);
    } else {
        println!("The number {} is not a prime number.", temperature);
    }

    // Unused variables and functions
    let weather = "sunny";
    let humidity = 50;
    let _unused_variable = 42;

    fn unused_function() {
        println!("This function is not used.");
    }

    // Variable used for multiple purposes
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather is {}.", weather);

    // Error implementation
    let uninitialized_variable;
    if result {
        println!("Uninitialized variable value: {}", uninitialized_variable);
    }
}

