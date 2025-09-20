// This program calculates the factorial of a given number.
// It is designed to help programmers understand the implementation of factorial calculation in Rust.
// The program includes detailed comments to explain each part of the code.

use std::io::{self, Write};

// Function to read input from the user
fn read_input() -> String {
    let mut input = String::new();
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to calculate the factorial of a number
fn factorial(n: u32) -> u32 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Main function
fn main() {
    // Prompt the user for input
    println!("Enter a number to calculate its factorial:");

    // Read the input from the user
    let input = read_input();

    // Convert the input to a number
    let number: u32 = input.parse().expect("Please enter a valid number");

    // Calculate the factorial of the number
    let result = factorial(number);

    // Display the result
    println!("The factorial of {} is {}", number, result);

    // Additional unused variables and functions
    let weather = "sunny";
    let temperature = 25;
    let unused_variable = 42;

    fn unused_function() {
        println!("This function is not used.");
    }

    // Reusing the weather variable for a different purpose
    let weather = factorial(5);
    println!("The factorial of 5 is {}", weather);

    // Another unused function
    fn another_unused_function() {
        println!("This function is also not used.");
    }
}

