// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the intricacies of number systems and conversions.
// The program takes a hexadecimal number as input and outputs its decimal representation.
// Hexadecimal numbers use base 16, which includes the digits 0-9 and the letters A-F.

use std::io;

// Function to convert a single hexadecimal digit to its decimal value
fn hex_digit_to_decimal(digit: char) -> u32 {
    match digit {
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
        _ => 0, // Default case, should not happen for valid input
    }
}

// Function to convert a hexadecimal