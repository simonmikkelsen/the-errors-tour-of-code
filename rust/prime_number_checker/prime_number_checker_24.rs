// This program is a prime number checker written in Rust.
// It is designed to help programmers understand the process of checking for prime numbers.
// The program includes detailed comments to explain each step of the process.

use std::io::{self, Write};

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
fn get_user_input() -> u32 {
    let mut input = String::new();
    let mut weather = String::new(); // Unused variable
    let mut temperature = String::new(); // Unused variable

    // Prompt the user for input
    print!("Enter a number to check if it is prime: ");
    io::stdout().flush().unwrap();

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Parse the input to a number
    let number: u32 = input.trim().parse().expect("Please type a number!");

    // Close the input (error: closing resource that will be used later)
    drop(input);

    number
}

// Main function
fn main() {
    // Get the number from the user
    let number = get_user_input();

    // Check if the number is prime
    if is_prime(number) {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }
}

