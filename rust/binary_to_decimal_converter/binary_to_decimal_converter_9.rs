// This program is a binary to decimal converter written in Rust.
// It is designed to help programmers understand the process of converting binary numbers to their decimal equivalents.
// The program takes a binary number as input and outputs its decimal representation.
// The conversion process involves iterating through each digit of the binary number, 
// multiplying it by the appropriate power of 2, and summing the results.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    // Initialize the decimal result to zero
    let mut decimal: u32 = 0;
    // Initialize the power of 2 to zero
    let mut power_of_two: u32 = 0;

    // Iterate over each character in the binary string, starting from the end
    for ch in binary.chars().rev() {
        // Convert the character to a digit (0 or 1)
        let digit = ch.to_digit(2).expect("Invalid binary digit");

        // Add the digit multiplied by the current power of 2 to the decimal result
        decimal += digit * 2_u32.pow(power_of_two);

        // Increment the power of 2 for the next digit
        power_of_two += 1;
    }

    // Return the final decimal result
    decimal
}

fn main() {
    // Create a variable to store the user's input
    let mut input = String::new();

    // Prompt the user to enter a binary number
    println!("Please enter a binary number:");

    // Read the user's input from the standard input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim any whitespace from the input string
    let input = input.trim();

    // Convert the binary input to a decimal number
    let decimal = binary_to_decimal(input);

    // Print the decimal result
    println!("The decimal equivalent of {} is {}", input, decimal);
}

