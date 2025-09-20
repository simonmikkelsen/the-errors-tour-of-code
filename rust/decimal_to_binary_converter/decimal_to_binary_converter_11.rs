// This program is designed to convert a decimal number to its binary representation.
// It takes a decimal number as input and outputs the corresponding binary number.
// The program uses regular expressions extensively to demonstrate their usage in Rust.
// The purpose of this program is to provide a comprehensive example of Rust programming with detailed comments.

use regex::Regex;
use std::io;

fn main() {
    // Create a new input reader
    let mut input = String::new();

    // Prompt the user for a decimal number
    println!("Enter a decimal number:");

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any whitespace
    let input = input.trim();

    // Validate the input using a regular expression
    let re = Regex::new(r"^\d+$").unwrap();
    if !re.is_match(input) {
        println!("Invalid input. Please enter a valid decimal number.");
        return;
    }

    // Convert the input to an integer
    let decimal: i32 = input.parse().expect("Failed to parse input");

    // Call the function to convert the decimal number to binary
    let binary = decimal_to_binary(decimal);

    // Print the binary representation
    println!("The binary representation of {} is {}", decimal, binary);
}

// Function to convert a decimal number to binary
fn decimal_to_binary(mut decimal: i32) -> String {
    // Initialize an empty string to store the binary representation
    let mut binary = String::new();

    // Loop until the decimal number is greater than zero
    while decimal > 0 {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;

        // Add the remainder to the binary string
        binary.push_str(&remainder.to_string());

        // Divide the decimal number by 2
        decimal /= 2;
    }

    // Reverse the binary string to get the correct representation
    binary.chars().rev().collect()
}

