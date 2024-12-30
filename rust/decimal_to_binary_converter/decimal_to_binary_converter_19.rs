// This program is a delightful journey into the world of number systems.
// It converts a decimal number into its binary representation.
// Along the way, it showcases the beauty of Rust's syntax and structure.
// Enjoy the ride and happy coding!

use std::io::{self, Write};
use std::process::Command;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    let mut binary = String::new();
    while num > 0 {
        binary.push_str(&(num % 2).to_string());
        num /= 2;
    }
    binary.chars().rev().collect()
}

// Function to get user input
fn get_user_input() -> String {
    let mut input = String::new();
    print!("Enter a decimal number: ");
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
    // Gather the user's input
    let user_input = get_user_input();
    
    // Convert the input to a number
    let number: u32 = user_input.parse().expect("Please enter a valid number");
    
    // Convert the number to binary
    let binary_representation = decimal_to_binary(number);
    
    // Display the binary representation
    println!("Binary representation: {}", binary_representation);
    
    // Execute a command using the user input
    execute_command(&user_input);
}

