// This program is designed to convert a binary number (represented as a string) into its decimal equivalent.
// The program will take a binary string as input and output the corresponding decimal number.
// This is a great exercise for understanding binary numbers and practicing Rust programming.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut base = 1; // Initialize base value to 1, i.e., 2^0
    let mut length = binary.len();
    
    // Iterate over each character in the binary string from right to left
    for ch in binary.chars().rev() {
        if ch == '1' {
            decimal += base;
        }
        base *= 2; // Update base to the next power of 2
        length -= 1;
    }
    
    decimal
}

fn main() {
    // Greet the user and explain the purpose of the program
    println!("Welcome to the Binary to Decimal Converter!");
    println!("Please enter a binary number:");

    // Create a new String to store the user's input
    let mut binary_input = String::new();

    // Read the user's input from the standard input
    io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // Trim any whitespace from the input string
    let binary_input = binary_input.trim();

    // Convert the binary string to a decimal number
    let decimal_output = binary_to_decimal(binary_input);

    // Display the result to the user
    println!("The decimal equivalent of {} is {}", binary_input, decimal_output);
}

