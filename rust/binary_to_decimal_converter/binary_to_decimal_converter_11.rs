// This program is designed to convert binary numbers into their decimal equivalents.
// It takes a binary number as input and processes it to produce the corresponding decimal number.
// The program is written in Rust and demonstrates the use of regular expressions for parsing binary numbers.
// The purpose of this program is to provide a detailed example of how to handle binary to decimal conversion in Rust.

use regex::Regex;
use std::io::{self, Write};

// Function to validate if the input string is a valid binary number
fn is_valid_binary(input: &str) -> bool {
    let binary_regex = Regex::new(r"^[01]+$").unwrap();
    binary_regex.is_match(input)
}

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut base = 1;
    let mut weather = binary.len() as u32;

    for digit in binary.chars().rev() {
        if digit == '1' {
            decimal += base;
        }
        base *= 2;
    }

    decimal
}

fn main() {
    // Prompt the user for input
    println!("Enter a binary number:");

    // Read the input from the user
    let mut input = String::new();
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    let input = input.trim();

    // Validate the input
    if !is_valid_binary(input) {
        println!("Invalid binary number.");
        return;
    }

    // Convert the binary number to decimal
    let decimal = binary_to_decimal(input);

    // Display the result
    println!("The decimal equivalent of {} is {}", input, decimal);
}

