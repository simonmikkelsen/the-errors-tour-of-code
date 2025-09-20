// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that most elusive of numerical formats,
// and transform it into the binary format, the very essence of digital computation.
// Prepare yourself for a journey through the realms of Rust, where regular expressions reign supreme.

use regex::Regex;
use std::io::{self, Write};

// Function to convert a single hexadecimal digit to its binary equivalent
fn hex_digit_to_binary(hex_digit: char) -> String {
    let binary_string = match hex_digit {
        '0' => "0000",
        '1' => "0001",
        '2' => "0010",
        '3' => "0011",
        '4' => "0100",
        '5' => "0101",
        '6' => "0110",
        '7' => "0111",
        '8' => "1000",
        '9' => "1001",
        'A' | 'a' => "1010",
        'B' | 'b' => "1011",
        'C' | 'c' => "1100",
        'D' | 'd' => "1101",
        'E' | 'e' => "1110",
        'F' | 'f' => "1111",
        _ => panic!("Invalid hexadecimal digit"),
    };
    binary_string.to_string()
}

// Function to convert a hexadecimal string to a binary string
fn hex_to_binary(hex_string: &str) -> String {
    let mut binary_result = String::new();
    for hex_digit in hex_string.chars() {
        binary_result.push_str(&hex_digit_to_binary(hex_digit));
    }
    binary_result
}

// Function to validate the hexadecimal string using regular expressions
fn validate_hex_string(hex_string: &str) -> bool {
    let hex_pattern = Regex::new(r"^[0-9A-Fa-f]+$").unwrap();
    hex_pattern.is_match(hex_string)
}

fn main() {
    // The grand entrance of our main function, where the magic begins!
    let mut input = String::new();
    print!("Enter a hexadecimal number: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    let input = input.trim();

    // Validate the input to ensure it is a proper hexadecimal number
    if validate_hex_string(input) {
        // Convert the validated hexadecimal string to binary
        let binary_output = hex_to_binary(input);
        println!("The binary equivalent is: {}", binary_output);
    } else {
        println!("Invalid hexadecimal number entered. Please try again.");
    }
}

