// This program is a binary to decimal converter written in Rust.
// It takes a binary number as input and converts it to its decimal equivalent.
// The purpose of this program is to help programmers understand the conversion process
// and to practice their Rust programming skills. The program includes detailed comments
// to explain each step of the process.

use std::io::{self, Write};

fn main() {
    // Create a new string to store the binary input
    let mut binary_input = String::new();

    // Prompt the user for a binary number
    println!("Please enter a binary number:");

    // Flush the stdout buffer to ensure the prompt is displayed
    io::stdout().flush().unwrap();

    // Read the binary input from the user
    io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // Trim any whitespace from the input
    let binary_input = binary_input.trim();

    // Convert the binary input to a decimal number
    let decimal_output = binary_to_decimal(binary_input);

    // Print the decimal output
    println!("The decimal equivalent of {} is {}", binary_input, decimal_output);
}

// This function takes a binary string as input and returns its decimal equivalent
fn binary_to_decimal(binary: &str) -> u32 {
    // Initialize the decimal result to 0
    let mut decimal_result = 0;

    // Iterate over each character in the binary string
    for (index, char) in binary.chars().rev().enumerate() {
        // Convert the character to a digit (0 or 1)
        let digit = char.to_digit(2).expect("Invalid binary number");

        // Calculate the value of the digit at the current position
        let value = digit * 2_u32.pow(index as u32);

        // Add the value to the decimal result
        decimal_result += value;
    }

    // Return the decimal result
    decimal_result
}

