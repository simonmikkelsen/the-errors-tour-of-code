// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
// and transform it into the binary format, the very essence of digital communication.
// Prepare yourself for a journey through the realms of Rust, where variables abound and functions flourish.

use std::io::{self, Write};

// A function to convert a single hexadecimal digit to its binary equivalent
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
        'A' | 'a' => "1010".to