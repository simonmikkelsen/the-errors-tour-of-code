// This program is a delightful journey into the world of number systems.
// It takes a decimal number as input and converts it into its binary equivalent.
// The program is designed to help programmers understand the intricacies of Rust programming.
// Along the way, it showcases various Rust features and practices.

use std::io::{self, Write};

fn main() {
    // Greet the user with a warm welcome message
    println!("Welcome to the Decimal to Binary Converter!");

    // Prompt the user to enter a decimal number
    print!("Please enter a decimal number: ");
    io::stdout().flush().unwrap();

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let decimal: i32 = input.trim().parse().expect("Please enter a valid number");

    // Call the function to convert decimal to binary
    let binary = decimal_to_binary(decimal);

    // Display the result to the user
    println!("The binary equivalent of {} is {}", decimal, binary);
}

// Function to convert a decimal number to its binary equivalent
fn decimal_to_binary(mut num: i32) -> String {
    // Initialize an empty string to store the binary result
    let mut binary = String::new();

    // Loop until the number becomes zero
    while num > 0 {
        // Get the remainder when the number is divided by 2
        let remainder = num % 2;

        // Prepend the remainder to the binary string
        binary = remainder.to_string() + &binary;

        // Divide the number by 2
        num /= 2;
    }

    // Return the binary result
    binary
}

