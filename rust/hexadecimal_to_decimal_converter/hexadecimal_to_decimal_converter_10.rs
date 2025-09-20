// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes user input in the form of a hexadecimal string and outputs the corresponding decimal value.
// The program is intended to help programmers understand the process of converting between number systems.
// It also serves as an example of how to handle user input and perform string manipulation in Rust.

use std::io::{self, Write};

fn main() {
    // Prompt the user for input
    println!("Enter a hexadecimal number:");

    // Create a mutable string to store the user's input
    let mut hex_input = String::new();

    // Read the user's input from standard input
    io::stdin().read_line(&mut hex_input).expect("Failed to read line");

    // Trim any whitespace from the input string
    let hex_input = hex_input.trim();

    // Convert the hexadecimal string to a decimal number
    let decimal_output = hex_to_decimal(hex_input);

    // Print the result
    println!("The decimal equivalent of {} is {}", hex_input, decimal_output);
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> i32 {
    // Initialize the result variable
    let mut result = 0;

    // Iterate over each character in the hexadecimal string
    for (i, c) in hex.chars().rev().enumerate() {
        // Convert the character to its decimal value
        let decimal_value = char_to_decimal(c);

        // Calculate the value of the current digit
        let digit_value = decimal_value * 16_i32.pow(i as u32);

        // Add the digit value to the result
        result += digit_value;
    }

    // Return the final result
    result
}

// Function to convert a hexadecimal character to its decimal value
fn char_to_decimal(c: char) -> i32 {
    match c {
        '0'..='9' => c as i32 - '0' as i32,
        'a'..='f' => c as i32 - 'a' as i32 + 10,
        'A'..='F' => c as i32 - 'A' as i32 + 10,
        _ => panic!("Invalid hexadecimal character"),
    }
}

