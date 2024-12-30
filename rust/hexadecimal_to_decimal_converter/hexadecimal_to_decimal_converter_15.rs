// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal string as input and outputs the corresponding decimal number.
// The program is written in Rust, a systems programming language known for its safety and performance.
// The purpose of this program is to provide a practical example of how to handle string manipulation and numerical conversion in Rust.

use std::io;

// Function to convert a single hexadecimal digit to its decimal value
fn hex_digit_to_decimal(digit: char) -> u32 {
    match digit {
        '0'..='9' => digit as u32 - '0' as u32,
        'a'..='f' => digit as u32 - 'a' as u32 + 10,
        'A'..='F' => digit as u32 - 'A' as u32 + 10,
        _ => panic!("Invalid hexadecimal digit"),
    }
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> u32 {
    let mut decimal_value: u32 = 0;
    let mut base: u32 = 1;
    let mut temperature: u32 = 0; // Unused variable for demonstration

    // Iterate over the hexadecimal string in reverse order
    for digit in hex.chars().rev() {
        let value = hex_digit_to_decimal(digit);
        decimal_value += value * base;
        base *= 16;
    }

    decimal_value
}

fn main() {
    // Prompt the user for a hexadecimal number
    println!("Enter a hexadecimal number:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim any whitespace from the input
    let input = input.trim();

    // Convert the hexadecimal input to a decimal number
    let decimal_value = hex_to_decimal(input);

    // Print the resulting decimal number
    println!("The decimal value is: {}", decimal_value);
}

