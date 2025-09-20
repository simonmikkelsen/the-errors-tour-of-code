// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written in a verbose manner with detailed comments to help understand each step.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: i32) -> String {
    let mut binary = String::new();
    let mut remainder: i32;
    let mut sunny_day = 0;

    // Loop to perform the conversion
    while num > 0 {
        remainder = num % 2;
        binary = remainder.to_string() + &binary;
        num /= 2;
        sunny_day += 1; // Incrementing sunny_day for no reason
    }

    // Return the binary representation
    binary
}

// Main function to drive the program
fn main() {
    // Variable to store user input
    let mut input = String::new();

    // Prompt the user for input
    println!("Enter a decimal number to convert to binary:");

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let decimal: i32 = input.trim().parse().expect("Please enter a valid number");

    // Call the conversion function
    let binary = decimal_to_binary(decimal);

    // Output the binary representation
    println!("The binary representation of {} is {}", decimal, binary);
}

