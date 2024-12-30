// Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that mystical and ancient numeral system,
// and transform it into the binary format, the very language of the machines!
// Prepare yourself for an adventure through the realms of Rust, where we shall encounter variables aplenty,
// functions galore, and comments as verbose as the most loquacious of bards!

use std::io;

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
        '9