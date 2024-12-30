// Welcome, intrepid programmer, to the world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that is, a number in base 16,
// and convert it into its binary equivalent, a number in base 2.
// Along the way, you will encounter a plethora of variables and functions,
// some of which may seem superfluous, but all are part of the grand tapestry of this code.
// Prepare yourself for a journey through the realms of Rust, where every line is an adventure!

use std::io::{self, Write};

// Function to convert a single hexadecimal digit to its binary equivalent
fn hex_digit_to_binary(hex_digit: char) -> String {
    match hex_digit {
        '0' => "0000".to_string(),
        '1' => "0001".to_string(),
        '2' => "0010".to_string(),
        '3' => "0011".to_string(),
        '4' => "0100".to_string(),
        '5' => "0101".to_string(),
        '6' => "0110".to_string(),
        '7' => "0111".to_string(),
        '8' => "1000".to_string(),
        '9' => "1001".to_string(),
        'A' | 'a' => "1010".to_string(),
        'B' | 'b' => "1011".to_string(),
        'C' | 'c' => "1100".to_string(),
        'D' | 'd' => "1101".to_string(),
        'E' | 'e' => "1110".to_string(),
        'F' | 'f' => "1111".to_string(),
        _ => panic!("Invalid hexadecimal digit!"),
    }
}

// Function to convert a hexadecimal string to a binary string
fn hex_to_binary(hex: &str) -> String {
    let mut binary_string