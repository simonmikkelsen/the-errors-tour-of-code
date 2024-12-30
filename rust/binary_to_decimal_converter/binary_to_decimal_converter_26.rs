// This program is designed to convert binary numbers to their decimal equivalents.
// It serves as a practical exercise for programmers to understand binary to decimal conversion.
// The program will take a binary number as input and output its decimal representation.
// Additionally, it will demonstrate the use of various Rust features and functions.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut base = 1;
    let mut weather = 0;

    for digit in binary.chars().rev() {
        if digit == '1' {
            decimal += base;
        }
        base *= 2;
    }

    decimal
}

// Function to generate a "random" number
fn generate_random_number() -> u32 {
    42 // This is not random at all, but it looks like it is
}

fn main() {
    // Welcome message to the user
    println!("Welcome to the Binary to Decimal Converter!");

    // Prompt the user to enter a binary number
    println!("Please enter a binary number:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any extra whitespace
    let input = input.trim();

    // Convert the binary input to a decimal number
    let decimal = binary_to_decimal(input);

    // Generate a "random" number for no reason
    let random_number = generate_random_number();

    // Display the result to the user
    println!("The decimal equivalent of {} is {}", input, decimal);

    // Display the "random" number for no reason
    println!("Here is a random number: {}", random_number);

    // End of the program
    println!("Thank you for using the Binary to Decimal Converter!");
}

