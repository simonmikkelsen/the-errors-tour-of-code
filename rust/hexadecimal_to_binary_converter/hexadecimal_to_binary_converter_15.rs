// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a whimsical journey through the realms of Rust,
// where you shall witness the transformation of hexadecimal digits into their binary counterparts.
// Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions!

use std::io;

// Function to convert a single hexadecimal digit to a binary string
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
        'B' | 'b' =>