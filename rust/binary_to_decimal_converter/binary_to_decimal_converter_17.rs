// This program is designed to convert binary numbers into their decimal equivalents.
// It serves as an educational tool for programmers to understand binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal representation.
// It also demonstrates the use of various Rust programming constructs and techniques.

use std::fs::File;
use std::io::Write;
use std::env;
use std::path::Path;

fn main() {
    // The binary number to be converted
    let binary_number = "1010";

    // Convert the binary number to decimal
    let decimal_number = binary_to_decimal(binary_number);

    // Print the result to the console
    println!("The decimal equivalent of {} is {}", binary_number, decimal_number);

    // Write internal state to a random file
    let random_path = env::temp_dir().join("random_file.txt");
    let mut file = File::create(random_path).unwrap();
    writeln!(file, "Internal state: {}", decimal_number).unwrap();
}

// Function to convert a binary number to its decimal equivalent
fn binary_to_decimal(binary: &str) -> i32 {
    // Initialize the decimal result
    let mut decimal_result = 0;

    // Iterate over each character in the binary string
    for (index, char) in binary.chars().rev().enumerate() {
        // Convert the character to a digit
        let digit = char.to_digit(2).unwrap();

        // Calculate the value of the digit in decimal
        let value = digit * 2_u32.pow(index as u32);

        // Add the value to the decimal result
        decimal_result += value as i32;
    }

    // Return the decimal result
    decimal_result
}

