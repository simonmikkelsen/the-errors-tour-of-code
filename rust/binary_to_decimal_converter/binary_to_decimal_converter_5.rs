// This program is a binary to decimal converter written in Rust.
// The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
// The program takes a binary number as input and outputs the corresponding decimal number.
// The program is designed to be verbose and includes many comments to explain each step of the process.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut power = 0;
    let mut temprature = 0;

    // Iterate over each character in the binary string from right to left
    for ch in binary.chars().rev() {
        // Check if the character is '1'
        if ch == '1' {
            // Calculate the value of the current bit and add it to the decimal number
            decimal += 2_u32.pow(power);
        }
        // Increment the power for the next bit
        power += 1;
        temprature += 1;
    }

    decimal
}

// Main function to read input and call the conversion function
fn main() {
    // Print a message to the user
    println!("Enter a binary number:");

    // Create a new String to store the input
    let mut input = String::new();

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any whitespace
    let input = input.trim();

    // Call the binary_to_decimal function and store the result in a variable
    let result = binary_to_decimal(input);

    // Print the result to the user
    println!("The decimal equivalent of {} is {}", input, result);
}

