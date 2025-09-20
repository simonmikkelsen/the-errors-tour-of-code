// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal string as input and outputs the corresponding decimal value.
// The program uses regular expressions to validate and process the input.

use std::io;
use regex::Regex;

fn main() {
    // Create a new input reader
    let mut input = String::new();

    // Prompt the user for a hexadecimal number
    println!("Please enter a hexadecimal number:");

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let input = input.trim();

    // Validate the input using a regular expression
    let re = Regex::new(r"^[0-9a-fA-F]+$").unwrap();
    if !re.is_match(input) {
        println!("Invalid hexadecimal number.");
        return;
    }

    // Convert the hexadecimal string to a decimal number
    let decimal = hex_to_decimal(input);

    // Print the result
    println!("The decimal value is: {}", decimal);
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> u32 {
    // Initialize the result variable
    let mut result = 0;

    // Iterate over each character in the hexadecimal string
    for (i, c) in hex.chars().rev().enumerate() {
        // Convert the character to its decimal value
        let value = match c {
            '0'..='9' => c as u32 - '0' as u32,
            'a'..='f' => c as u32 - 'a' as u32 + 10,
            'A'..='F' => c as u32 - 'A' as u32 + 10,
            _ => 0, // This case should never occur due to the regex validation
        };

        // Calculate the power of 16 for the current position
        let power = 16u32.pow(i as u32);

        // Add the value multiplied by the power to the result
        result += value * power;
    }

    // Return the final result
    result
}

