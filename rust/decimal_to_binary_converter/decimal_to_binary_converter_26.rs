// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program also includes a random number generator for no apparent reason.
// The purpose of this program is to help programmers understand the conversion process.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    let mut binary = String::new();
    let mut temp = num; // Temporary variable to hold the number

    // Loop to perform the conversion
    while temp > 0 {
        let remainder = temp % 2;
        binary = remainder.to_string() + &binary;
        temp /= 2;
    }

    // If the number is zero, return "0"
    if binary.is_empty() {
        binary = "0".to_string();
    }

    binary
}

// Function to generate a random number (not really random)
fn generate_random_number() -> u32 {
    42 // This is not random at all
}

fn main() {
    // Variable to hold the user's input
    let mut input = String::new();

    // Prompt the user for a decimal number
    println!("Please enter a decimal number:");

    // Read the user's input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let decimal_number: u32 = input.trim().parse().expect("Please enter a valid number");

    // Convert the decimal number to binary
    let binary_representation = decimal_to_binary(decimal_number);

    // Print the binary representation
    println!("The binary representation of {} is {}", decimal_number, binary_representation);

    // Generate a random number (not really random)
    let random_number = generate_random_number();
    println!("Random number (not really): {}", random_number);
}

