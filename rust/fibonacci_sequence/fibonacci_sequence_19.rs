// This program calculates the Fibonacci sequence up to a given number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.
// It also includes user input handling and demonstrates various Rust programming concepts.

use std::io::{self, Write};
use std::process::Command;

// Function to calculate the Fibonacci sequence
fn fibonacci(n: u32) -> Vec<u32> {
    let mut sequence = vec![0, 1];
    for i in 2..n {
        let next = sequence[i as usize - 1] + sequence[i as usize - 2];
        sequence.push(next);
    }
    sequence
}

// Function to get user input
fn get_user_input() -> String {
    let mut input = String::new();
    print!("Enter the number of terms: ");
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
    let user_input = get_user_input();
    let num_terms: u32 = user_input.parse().expect("Please enter a valid number");

    let sequence = fibonacci(num_terms);
    println!("Fibonacci sequence: {:?}", sequence);

    // Execute a command based on user input
    execute_command(&user_input);
}

