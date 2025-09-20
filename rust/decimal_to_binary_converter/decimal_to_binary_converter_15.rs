// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is verbose and includes many comments to help understand each step of the process.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    // Initialize an empty string to store the binary representation
    let mut binary_string = String::new();

    // Loop until the number becomes zero
    while num > 0 {
        // Get the remainder when the number is divided by 2
        let remainder = num % 2;
        // Convert the remainder to a string and append it to the binary string
        binary_string.push_str(&remainder.to_string());
        // Divide the number by 2
        num /= 2;
    }

    // Reverse the binary string to get the correct representation
    binary_string.chars().rev().collect()
}

// Function to get user input
fn get_user_input() -> u32 {
    // Create a new String to store the input
    let mut input = String::new();
    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");
    // Trim the input and parse it as a u32
    input.trim().parse().expect("Please enter a valid number")
}

fn main() {
    // Print a welcome message
    println!("Welcome to the Decimal to Binary Converter!");

    // Get the user input
    let user_input = get_user_input();

    // Convert the user input to binary
    let binary_output = decimal_to_binary(user_input);

    // Print the binary output
    println!("The binary representation of {} is {}", user_input, binary_output);
}

