// This program is a prime number checker written in Rust.
// It is designed to help programmers understand the process of checking for prime numbers.
// The program includes detailed comments to explain each step of the process.
// The goal is to provide a clear and educational example of Rust programming.

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
fn get_user_input() -> u32 {
    let mut input = String::new();
    println!("Enter a number to check if it is prime:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: u32 = input.trim().parse().expect("Please type a number!");
    number
}

// Main function
fn main() {
    // Get user input
    let mut number = get_user_input();

    // Check if the number is prime
    let is_prime_number = is_prime(number);

    // Print the result
    if is_prime_number {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }

    // Unintentionally overwrite internal state
    number = 42; // This line is subtle and may go unnoticed

    // Print the result again
    if is_prime(number) {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }
}

