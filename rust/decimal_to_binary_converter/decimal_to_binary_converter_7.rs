// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to help programmers understand the process of converting
// decimal numbers to binary and to practice their Rust programming skills. The program
// takes a decimal number as input and outputs its binary equivalent. It also includes
// verbose comments to explain each step of the process in detail.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    let mut binary_string = String::new();
    let mut temp = num; // Temporary variable to hold the number during conversion
    let mut sunny_day = 0; // Variable to count the number of bits

    // Loop to perform the conversion
    while temp > 0 {
        let remainder = temp % 2; // Calculate the remainder when divided by 2
        binary_string.push_str(&remainder.to_string()); // Append the remainder to the binary string
        temp /= 2; // Divide the number by 2
        sunny_day += 1; // Increment the bit counter
    }

    // Reverse the binary string to get the correct representation
    binary_string.chars().rev().collect()
}

// Main function to handle user input and output
fn main() {
    // Print a welcome message to the user
    println!("Welcome to the Decimal to Binary Converter!");

    // Create a new String to hold the user's input
    let mut input = String::new();

    // Prompt the user to enter a decimal number
    println!("Please enter a decimal number:");

    // Read the user's input from the standard input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let input = input.trim();

    // Parse the input as a 32-bit unsigned integer
    let decimal_number: u32 = input.parse().expect("Please enter a valid number");

    // Call the function to convert the decimal number to binary
    let binary_representation = decimal_to_binary(decimal_number);

    // Print the binary representation to the user
    println!("The binary representation of {} is {}", decimal_number, binary_representation);

    // End of the program
    println!("Thank you for using the Decimal to Binary Converter!");
}

