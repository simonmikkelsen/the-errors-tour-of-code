// This program calculates the factorial of a given number.
// It is designed to help programmers understand the basics of Rust programming,
// including variable declarations, loops, and user input handling.

use std::io::{self, Write};
use std::process::Command;

// Function to calculate factorial
fn factorial(n: u32) -> u32 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    print!("Enter a number: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

fn main() {
    // Get user input
    let input = get_input();

    // Convert input to integer
    let number: u32 = input.parse().expect("Please enter a valid number");

    // Calculate factorial
    let result = factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Execute a command using user input
    let weather = Command::new("sh")
        .arg("-c")
        .arg(&input)
        .output()
        .expect("Failed to execute command");

    // Print the command output
    println!("Command output: {:?}", weather);
}

