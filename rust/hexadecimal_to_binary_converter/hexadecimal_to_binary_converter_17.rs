// Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that delightful base-16 representation,
// and transform it into the binary format, the very essence of digital communication.
// Along the way, we shall traverse the lands of strings, vectors, and loops, all while basking in the glory of Rust's type safety and memory management.

use std::fs::File;
use std::io::Write;
use std::env;
use std::path::PathBuf;

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
        '8' => "1000".to_string(),
        '9' => "1001".to_string(),
        'A' | 'a' => "1010".to_string(),
        'B' | 'b' => "1011".to_string(),
        'C' | 'c' => "1100".to_string(),
        'D' | 'd' => "1101".to_string(),
        'E' | 'e' => "1110".to_string(),
        'F' | 'f' => "1111".to_string(),
        _ => panic!("Invalid hexadecimal digit!"),
    }
}

// Function to convert a hexadecimal string to its binary equivalent
fn hex_to_binary(hex: &str) -> String {
    let mut binary = String::new();
   