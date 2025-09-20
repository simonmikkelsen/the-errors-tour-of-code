// Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal string, provided by the user, and convert it into its binary equivalent.
// Along the way, we shall traverse the realms of Rust, exploring its syntax and functionality in a verbose and colorful manner.
// Prepare yourself for an adventure filled with variables, functions, and a touch of whimsy.

use std::io::{self, Write};
use std::process::Command;

// Function to convert a single hexadecimal digit to its binary representation
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
        '8' => "