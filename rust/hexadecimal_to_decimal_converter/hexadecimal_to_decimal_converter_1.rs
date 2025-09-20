// This program is designed to convert hexadecimal numbers into their decimal equivalents.
// It is intended to help programmers understand the process of conversion and to practice
// their skills in Rust programming. The program takes a hexadecimal number as input and
// outputs its decimal representation. The conversion process involves parsing the input
// string, validating it, and then performing the necessary mathematical operations to
// obtain the decimal value.

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
        'F' | 'f'