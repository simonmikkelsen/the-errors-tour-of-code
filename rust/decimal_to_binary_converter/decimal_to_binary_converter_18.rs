// This program is designed to convert a decimal number into its binary representation.
// It aims to provide a comprehensive understanding of how binary conversion works.
// The program will take an input decimal number and output its binary equivalent.
// The code is written in a verbose manner to help programmers understand each step of the process.

use std::fs::File;
use std::io::{self, Read};
use std::env;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    let mut binary = String::new();
    let mut remainder: u32;
    let mut temp: u32;

    // Loop to perform the conversion
    while num > 0 {
        remainder = num % 2;
        temp = num / 2;
        binary = remainder.to_string() + &binary;
        num = temp;
    }

    // Return the binary representation
    binary
}

// Function to read input from a file
fn read_input_from_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Main function to drive the program
fn main() {
    // Get the file path from the command line arguments
    let args: Vec<String> = env::args().collect();
    let file_path = &args[1];

    // Read the input from the file
    let input_data = read_input_from_file(file_path).expect("Failed to read input file");

    // Convert the input data to a decimal number
    let decimal_number: u32 = input_data.trim().parse().expect("Invalid input data");

    // Convert the decimal number to binary
    let binary_representation = decimal_to_binary(decimal_number);

    // Print the binary representation
    println!("Binary representation: {}", binary_representation);
}

