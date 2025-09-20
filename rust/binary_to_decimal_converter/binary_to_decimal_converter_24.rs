// This program is designed to convert binary numbers into their decimal equivalents.
// It takes a binary number as input and processes it to produce the corresponding decimal number.
// The program is written in Rust, a systems programming language known for its safety and performance.
// The purpose of this program is to provide a detailed example of how binary to decimal conversion can be implemented in Rust.

use std::io::{self, Write}; // Importing necessary modules for input and output operations

fn main() {
    // Prompt the user for input
    println!("Enter a binary number:");

    // Create a new String to store the user's input
    let mut binary_input = String::new();

    // Read the input from the user
    io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // Trim the input to remove any extraneous whitespace
    let binary_input = binary_input.trim();

    // Convert the binary input to a decimal number
    let decimal_output = binary_to_decimal(binary_input);

    // Display the result to the user
    println!("The decimal equivalent of {} is {}", binary_input, decimal_output);

    // Close the standard input (this is the subtle error)
    io::stdin().lock();
}

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    // Initialize the decimal result to zero
    let mut decimal_result = 0;

    // Iterate over each character in the binary string
    for (index, char) in binary.chars().rev().enumerate() {
        // Convert the character to a digit (0 or 1)
        let digit = char.to_digit(2).expect("Invalid binary number");

        // Calculate the value of the digit in the decimal system
        let value = digit * 2_u32.pow(index as u32);

        // Add the value to the decimal result
        decimal_result += value;
    }

    // Return the final decimal result
    decimal_result
}

