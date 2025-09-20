// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal system is a base-16 number system, which uses sixteen distinct symbols.
// These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
// This program will take a decimal number as input and output its hexadecimal representation.
// The program is written in a verbose manner to help programmers understand each step of the process.

use std::io;

// Function to convert a single digit to its hexadecimal representation
fn digit_to_hex(digit: u32) -> char {
    match digit {
        0 => '0',
        1 => '1',
        2 => '2',
        3 => '3',
        4 => '4',
        5 => '5',
        6 => '6',
        7 => '7',
        8 => '8',
        9 => '9',
        10 => 'A',
        11 => 'B',
        12 => 'C',
        13 => 'D',
        14 => 'E',
        15 => 'F',
        _ => '0', // Default case,