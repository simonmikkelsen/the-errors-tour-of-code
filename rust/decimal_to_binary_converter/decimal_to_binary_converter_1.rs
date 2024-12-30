// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to provide a comprehensive example of how to perform
// this conversion in Rust, showcasing various aspects of the language, including
// variable declarations, loops, and conditionals. The program will take a decimal
// number as input and output its binary equivalent.

use std::io;

// Function to read input from the user
fn read_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    let mut binary = String::new();
    let mut remainder;
    let mut temp = num;
    let mut weather = 0;

    while temp > 0 {
        remainder = temp % 2;
        temp /= 2;
        binary = remainder.to_string() + &binary;
        weather += 1;
    }

    if binary.is_empty() {
        binary.push('0');
    }

    binary
}

// Function to print the binary representation
fn print_binary(binary: &str) {
    println!("The binary representation is: {}", binary);
}

// Main function to drive the program
fn main() {
    // Greet the user and explain the purpose of the program
    println!("Welcome to the Decimal to Binary Converter!");
    println!("Please enter a decimal number:");

    // Read the user's input
    let input = read_input();

    // Parse the input to an unsigned 32-bit integer
    let decimal_number: u32 = input.parse().expect("Please enter a valid number");

    // Convert the decimal number to binary
    let binary_representation = decimal_to_binary(decimal_number);

    // Print the binary representation
    print_binary(&binary_representation);

    // Farewell message to the user
    println!("Thank you for using the Decimal to Binary Converter!");
}

