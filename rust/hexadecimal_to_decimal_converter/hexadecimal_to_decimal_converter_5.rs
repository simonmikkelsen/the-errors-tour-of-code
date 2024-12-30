// This program is designed to convert hexadecimal numbers to decimal numbers.
// Hexadecimal is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
// Decimal is a base-10 number system, which uses 10 symbols: 0-9.
// The purpose of this program is to help programmers understand how to convert between these two number systems.
// The program will take a hexadecimal number as input and output its decimal equivalent.

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
        _ =>