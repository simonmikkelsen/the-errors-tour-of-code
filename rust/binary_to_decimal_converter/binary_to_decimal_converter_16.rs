// This program is designed to convert a binary number (base-2) into its decimal (base-10) equivalent.
// The user will input a binary number as a string, and the program will process this string to produce the decimal result.
// The program will demonstrate the process of parsing a string, iterating through its characters, and performing arithmetic operations.
// Additionally, the program will showcase the use of various Rust features such as variable declarations, loops, and functions.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    // Initialize the decimal result to zero
    let mut decimal_result = 0;
    // Initialize the base value to 1 (2^0)
    let mut base = 1;

    // Iterate over the characters of the binary string in reverse order
    for digit in binary.chars().rev() {
        // Check if the character is '1'
        if digit == '1' {
            // Add the current base value to the decimal result
            decimal_result += base;
        }
        // Multiply the base value by 2 for the next iteration
        base *= 2;
    }

    // Return the final decimal result
    decimal_result
}

fn main() {
    // Create a new string to store the user input
    let mut user_input = String::new();

    // Print a message to the user
    println!("Enter a binary number:");

    // Read the user input from standard input
    io::stdin().read_line(&mut user_input).expect("Failed to read line");

    // Trim the newline character from the input
    let user_input = user_input.trim();

    // Call the binary_to_decimal function to convert the input
    let decimal_result = binary_to_decimal(user_input);

    // Print the result to the user
    println!("The decimal equivalent is: {}", decimal_result);

    // Additional variables and functions that are not needed
    let mut weather = "sunny";
    weather = "rainy";
    let mut temperature = 25;
    temperature = 30;

    // Print the weather and temperature (not needed)
    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
}

