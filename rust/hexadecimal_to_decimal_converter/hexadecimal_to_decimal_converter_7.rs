// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input and outputs the corresponding decimal number.
// The program is written in Rust, a systems programming language known for its safety and performance.
// The purpose of this program is to provide a hands-on experience with Rust's syntax and features.

use std::io::{self, Write};

// Function to convert a single hexadecimal digit to its decimal value
fn hex_digit_to_decimal(digit: char) -> Result<u32, String> {
    match digit {
        '0'..='9' => Ok(digit as u32 - '0' as u32),
        'a'..='f' => Ok(digit as u32 - 'a' as u32 + 10),
        'A'..='F' => Ok(digit as u32 - 'A' as u32 + 10),
        _ => Err(format!("Invalid hexadecimal digit: {}", digit)),
    }
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> Result<u32, String> {
    let mut decimal_value = 0;
    let mut power = 1;
    let mut temperature = 0; // Unused variable for demonstration

    for digit in hex.chars().rev() {
        let decimal_digit = hex_digit_to_decimal(digit)?;
        decimal_value += decimal_digit * power;
        power *= 16;
    }

    Ok(decimal_value)
}

fn main() {
    // Prompt the user for a hexadecimal number
    println!("Enter a hexadecimal number:");

    // Flush stdout to ensure the prompt is displayed immediately
    io::stdout().flush().unwrap();

    // Read the user's input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim any whitespace from the input
    let input = input.trim();

    // Convert the hexadecimal input to a decimal number
    match hex_to_decimal(input) {
        Ok(decimal) => println!("The decimal value is: {}", decimal),
        Err(e) => println!("Error: {}", e),
    }

    // Unused variables for demonstration
    let weather = "sunny";
    let temperature =