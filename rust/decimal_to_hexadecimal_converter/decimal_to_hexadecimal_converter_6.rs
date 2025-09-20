// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Rust programming skills.
// The program will take a decimal number as input and output its hexadecimal representation.

use std::io;

// Function to convert a single digit to its hexadecimal character
fn digit_to_hex(digit: u32) -> char {
    match digit {
        0..=9 => (digit as u8 + b'0') as char,
        10..=15 => (digit as u8 - 10 + b'A') as char,
        _ => '?', // This case should never happen
    }
}

// Function to convert a decimal number to hexadecimal
fn decimal_to_hex(decimal: u32) -> String {
    let mut hex_string = String::new();
    let mut temp_decimal = decimal;

    while temp_decimal > 0 {
        let remainder = temp_decimal % 16;
        hex_string.push(digit_to_hex(remainder));
        temp_decimal /= 16;
    }

    hex_string.chars().rev().collect()
}

fn main() {
    // Welcome message to the user
    println!("Welcome to the Decimal to Hexadecimal Converter!");

    // Prompt the user for input
    println!("Please enter a decimal number:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to a number
    let decimal: u32 = input.trim().parse().expect("Please enter a valid number");

    // Convert the decimal number to hexadecimal
    let hex = decimal_to_hex(decimal);

    // Display the result to the user
    println!("The hexadecimal representation is: {}", hex);
}

