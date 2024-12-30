// Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that delightful base-16 representation,
// and transform it into the binary realm, where only 0s and 1s reign supreme.
// Prepare yourself for a journey through the lands of Rust, where variables and functions abound,
// and the code flows like a river of logic.

use std::io;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Function to convert a single hexadecimal digit to its binary equivalent
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
        '8' => "1000".to_string