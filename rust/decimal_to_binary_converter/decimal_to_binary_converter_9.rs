// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to provide a comprehensive example of how to perform
// such a conversion in Rust, while also demonstrating various programming techniques
// and practices. The program will take an integer input from the user and output the
// corresponding binary string. We will use a variety of variables and functions to
// illustrate different aspects of Rust programming.

use std::io;

// This function reads an integer from the user and returns it.
fn read_integer() -> i32 {
    // Create a new String object to hold the user input.
    let mut input = String::new();

    // Print a prompt for the user.
    println!("Please enter a decimal number:");

    // Read the user input and store it in the input variable.
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input string to an integer and return it.
    input.trim().parse().expect("Please type a number!")
}

// This function converts a decimal number to a binary string.
fn decimal_to_binary(mut number: i32) -> String {
    // Create a new String object to hold the binary representation.
    let mut binary = String::new();

    // Loop until the number is zero.
    while number > 0 {
        // Get the remainder of the number divided by 2 and append it to the binary string.
        let remainder = number % 2;
        binary.push_str(&remainder.to_string());

        // Divide the number by 2.
        number /= 2;
    }

    // Reverse the binary string to get the correct representation.
    binary.chars().rev().collect()
}

// This is the main function of the program.
fn main() {
    // Read an integer from the user.
    let decimal = read_integer();

    // Convert the decimal number to a binary string.
    let binary = decimal_to_binary(decimal);

    // Print the binary representation.
    println!("The binary representation of {} is {}", decimal, binary);
}

