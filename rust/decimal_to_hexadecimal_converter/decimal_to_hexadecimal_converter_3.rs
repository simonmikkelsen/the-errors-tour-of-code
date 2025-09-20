// This program is a delightful journey into the world of number systems.
// It converts a decimal number, which is a number in base 10, into a hexadecimal number, which is a number in base 16.
// Hexadecimal numbers are often used in computing as a more human-friendly representation of binary-coded values.
// This program will take a decimal number as input and output its hexadecimal equivalent.

use std::io::{self, Write}; // Importing necessary modules for input and output operations

// Function to convert a decimal number to a hexadecimal string
fn decimal_to_hexadecimal(mut decimal: u32) -> String {
    let mut hex_string = String::new(); // Initialize an empty string to store the hexadecimal result
    let hex_chars = "0123456789ABCDEF"; // Characters used in hexadecimal representation

    // Loop to convert the decimal number to hexadecimal
    while decimal > 0 {
        let remainder = (decimal % 16) as usize; // Calculate the remainder when divided by 16
        hex_string.insert(0, hex_chars.chars().nth(remainder).unwrap()); // Insert the corresponding hex character at the beginning of the string
        decimal /= 16; // Divide the decimal number by 16 for the next iteration