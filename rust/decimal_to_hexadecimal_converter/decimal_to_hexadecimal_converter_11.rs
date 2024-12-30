// This program is designed to convert a decimal number to its hexadecimal representation.
// It takes a decimal number as input and outputs the corresponding hexadecimal string.
// The program uses regular expressions to validate the input and ensure it is a valid decimal number.
// Additionally, the program includes verbose comments to explain each step in detail.

use regex::Regex;
use std::io;

fn main() {
    // Create a new instance of the Regex struct to match decimal numbers
    let decimal_regex = Regex::new(r"^\d+$").unwrap();

    // Prompt the user for input
    println!("Enter a decimal number:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let input = input.trim();

    // Check if the input matches the decimal number pattern
    if !decimal_regex.is_match(input) {
        println!("Invalid input. Please enter a valid decimal number.");
        return;
    }

    // Convert the input to an integer
    let decimal_number: i32 = input.parse().expect("Failed to parse input as integer");