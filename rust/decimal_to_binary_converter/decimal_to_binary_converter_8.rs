// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to provide a comprehensive example of how to perform
// such a conversion in Rust, while also demonstrating various programming techniques
// and practices. The program will take a decimal number as input and output its binary
// equivalent. Along the way, we will explore the use of functions, variables, and control
// structures in Rust.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    let mut binary_string = String::new();
    let mut temp_var; // Temporary variable for intermediate calculations

    // Loop to perform the conversion
    while num > 0 {
        temp_var = num % 2; // Calculate the remainder
        binary_string = temp_var.to_string() + &binary_string; // Prepend the remainder to the binary string
        num /= 2; // Divide the number by 2
    }

    // Return the resulting binary string
    binary_string
}

// Main function to drive the program
fn main() {
    // Print a welcome message
    println!("Welcome to the Decimal to Binary Converter!");

    // Prompt the user for input
    println!("Please enter a decimal number:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let decimal_number: u32 = input.trim().parse().expect("Please enter a valid number");

    // Call the conversion function
    let binary_result = decimal_to_binary(decimal_number);

    // Print the result
    println!("The binary representation of {} is {}", decimal_number, binary_result);
}

