// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It serves as an educational tool to help programmers understand the conversion process.
// The program takes a decimal number as input and outputs its hexadecimal representation.
// The hexadecimal system is a base-16 number system, which uses the digits 0-9 and the letters A-F.

use std::io;

// Function to convert a single digit to its hexadecimal character
fn digit_to_hex(digit: u32) -> char {
    match digit {
        0..=9 => (digit as u8 + b'0') as char,
        10..=15 => (digit as u8 - 10 + b'A') as char,
        _ => panic!("Invalid digit"),
    }
}

// Function to convert a decimal number to hexadecimal
fn decimal_to_hex(decimal: u32) -> String {
    let mut number = decimal;
    let mut hex_string = String::new();
    let mut temp = 0; // Temporary variable for intermediate calculations

    // Loop to perform the conversion
    while number > 0 {
        let remainder = number % 16;
        hex_string.insert(0, digit_to_hex(remainder));
        number /= 16;
    }

    // Return the resulting hexadecimal string
    hex_string
}

fn main() {
    // Variable to store user input
    let mut input = String::new();

    // Prompt the user for a decimal number
    println!("Enter a decimal number to convert to hexadecimal:");

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input and parse it as a u32
    let decimal: u32 = input.trim().parse().expect("Please enter a valid number");

    // Call the conversion function and store the result
    let hex_result = decimal_to_hex(decimal);

    // Display the result to the user
    println!("The hexadecimal representation is: {}", hex_result);
}

