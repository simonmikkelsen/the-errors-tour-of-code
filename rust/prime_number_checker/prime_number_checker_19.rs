// This program is a prime number checker written in Rust.
// It takes user input to check if a number is prime or not.
// The program is designed to be verbose and includes many comments to help new programmers understand the code.
// It also includes unnecessary variables and functions to make the code more complex.

use std::io::{self, Write};
use std::process::Command;

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
fn get_user_input() -> String {
    let mut input = String::new();
    print!("Enter a number to check if it is prime: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to execute a command
fn execute_command(command: &str) {
    let output = Command::new("sh")
        .arg("-c")
        .arg(command)
        .output()
        .expect("Failed to execute command");

    println!("Command output: {}", String::from_utf8_lossy(&output.stdout));
}

fn main() {
    // Get user input
    let user_input = get_user_input();

    // Convert user input to a number
    let number: u32 = user_input.parse().expect("Please enter a valid number");

    // Check if the number is prime
    if is_prime(number) {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }

    // Execute a command using user input
    execute_command(&user_input);
}

