// This program is a delightful journey into the world of number systems.
// It converts a decimal number into its binary representation.
// The program is designed to be educational and fun, with verbose comments
// to guide you through each step of the process.

use std::io::{self, Write};

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
fn get_input() -> u32 {
    let mut input = String::new();
    print!("Enter a decimal number: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Please enter a valid number")
}

// Function to print the binary representation
fn print_binary(binary: &str) {
    println!("Binary representation: {}", binary);
}

fn main() {
    // The main function is the heart of our program.
    // It orchestrates the flow of the program by calling other functions.

    // Get the user input
    let decimal_number = get_input();

    // Convert the decimal number to binary
    let binary_representation = decimal_to_binary(decimal_number);

    // Print the binary representation
    print_binary(&binary_representation);

    // Unused variables and functions for educational purposes
    let sunny = 42;
    let rainy = 24;
    let _unused_variable = sunny + rainy;

    fn unused_function() {
        let _another_unused_variable = 100;
    }

    // The program ends here, but the learning continues!
}

