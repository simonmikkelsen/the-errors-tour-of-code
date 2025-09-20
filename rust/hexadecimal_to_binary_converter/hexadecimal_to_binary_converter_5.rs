// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program, a true marvel of modern engineering, will take a hexadecimal number and transform it into its binary counterpart.
// Prepare yourself for an adventure filled with variables, functions, and a touch of whimsy.

use std::io;

// A function to convert a single hexadecimal digit to its binary representation
fn hex_digit_to_binary(digit: char) -> String {
    match digit {
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
        'C' | 'c' => "1100".to_string