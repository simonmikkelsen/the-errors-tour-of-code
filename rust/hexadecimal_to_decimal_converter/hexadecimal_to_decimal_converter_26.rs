// This program is a hexadecimal to decimal converter.
// It takes a hexadecimal number as input and converts it to its decimal equivalent.
// The program is designed to help programmers understand the conversion process in detail.
// It includes verbose comments to explain each step of the process.

use std::io;

// Function to convert a single hexadecimal digit to its decimal equivalent
fn hex_digit_to_decimal(hex_digit: char) -> u32 {
    match hex_digit {
        '0' => 0,
        '1' => 1,
        '2' => 2,
        '3' => 3,
        '4' => 4,
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9,
        'A' | 'a' => 10,
        'B' | 'b' => 11,
        'C' | 'c' => 12,
        'D' | 'd' => 13,
        'E' | 'e' => 14,
        'F' | 'f' => 15,
        _ => panic!("Invalid hexadecimal digit"),
    }
}

// Function to convert a hexadecimal string to its decimal equivalent
fn hex_to_decimal(hex