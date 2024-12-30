// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Rust programming skills.
// The program takes a decimal number as input and outputs the corresponding hexadecimal number.

use std::io;

// Function to convert a decimal number to hexadecimal
fn decimal_to_hexadecimal(mut decimal: u32) -> String {
    let mut hex_string = String::new();
    let hex_chars = "0123456789ABCDEF".chars().collect::<Vec<_>>();

    // Loop to perform the conversion
    while decimal > 0 {
        let remainder = (decimal % 16) as usize;
        hex_string.insert(0, hex_chars[remainder]);
        decimal /= 16;
    }

    // Return the resulting hexadecimal string
    hex_string
}

// Main function to drive the program
fn main() {
    // Print a welcome message to the user
    println!("Welcome to the Decimal to Hexadecimal Converter!");

    // Create a variable to store the user's input
    let mut input = String::new();

    // Prompt the user for a decimal number
    println!("Please enter a decimal number:");

    // Read the user's input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to a u32
    let decimal: u32 = input.trim().parse().expect("Please enter a valid number");

    // Call the conversion function and store the result
    let hex_result = decimal_to_hexadecimal(decimal);

    //