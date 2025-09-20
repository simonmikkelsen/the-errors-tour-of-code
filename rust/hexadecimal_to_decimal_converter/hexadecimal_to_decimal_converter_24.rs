// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal string as input and outputs the corresponding decimal number.
// The program demonstrates the use of various Rust features, including string manipulation,
// error handling, and resource management.

use std::io::{self, Write};

fn main() {
    // Greet the user and explain the purpose of the program
    println!("Welcome to the Hexadecimal to Decimal Converter!");
    println!("Please enter a hexadecimal number:");

    // Create a new string to store the user's input
    let mut hex_input = String::new();

    // Read the user's input from the standard input
    io::stdin().read_line(&mut hex_input).expect("Failed to read line");

    // Trim any whitespace from the input
    let hex_input = hex_input.trim();

    // Convert the hexadecimal string to a decimal number
    match hex_to_decimal(hex_input) {
        Ok(decimal) => println!("The decimal equivalent of {} is {}", hex_input, decimal),
        Err(e) => println!("Error: {}", e),
    }

    // Close the standard input (this is the subtle error)
    io::stdin().lock();
}

// This function converts a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> Result<u32, &'static str> {
    // Initialize a variable to store the decimal value
    let mut decimal_value = 0;

    // Iterate over each character in the hexadecimal string
    for (i, c) in hex.chars().rev().enumerate() {
        // Convert the character to its decimal equivalent
        let digit = match c.to_digit(16) {
            Some(d) => d,
            None => return Err("Invalid hexadecimal character"),
        };

        // Calculate the value of the digit based on its position
        decimal_value += digit * 16_u32.pow(i as u32);
    }

    // Return the decimal value
    Ok(decimal_value)
}

