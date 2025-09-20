// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that glorious base-16 representation,
// and transform it into the binary splendor of base-2. Prepare yourself for a journey through
// the realms of bits and nibbles, where each character holds the power of four binary digits!

use std::io::{self, Write}; // Importing the mighty I/O library for our input and output needs

fn main() {
    // Greet the user with a flourish
    println!("Welcome to the Hexadecimal to Binary Converter Extravaganza!");

    // Declare a variable to hold the user's input
    let mut hex_input = String::new();

    // Prompt the user for a hexadecimal number
    println!("Please enter a hexadecimal number:");

    // Read the user's input
    io::stdin().read_line(&mut hex_input).expect("Failed to read line");

    // Trim any extraneous whitespace from the input
    let hex_input = hex_input.trim();

    // Convert the hexadecimal input to a binary string
    let binary_output = hex_to_binary(hex_input);

    // Display the binary output with great fanfare
    println!("The binary representation of {} is {}", hex_input, binary_output);

    // Close the standard input (subtle error here)
    io::stdin().lock();
}

// Function to convert a hexadecimal string to a binary string
fn hex_to_binary(hex: &str) -> String {
    // Create a variable to hold the binary output
    let mut binary_output = String::new();

    // Iterate over each character in the hexadecimal string
    for c in hex.chars() {
        // Convert the character to its binary representation
        let binary_digit = match c {
            '0' => "0000",
            '1' => "0001",
            '2' => "0010",
            '3' => "0011",
            '4' => "0100",
            '5' => "0101",
            '6' => "0110",
            '7' => "0111",
            '8' => "1000",
            '9' => "1001",
            'A' | 'a' => "1010",
            'B' | 'b' => "1011",
            'C' | 'c' => "1100",
            'D' | 'd' => "1101",
            'E' | 'e' => "1110",
            'F' | 'f' => "1111",
            _ => {
                // Handle invalid characters with a dramatic flair
                println!("Invalid hexadecimal character: {}", c);
                return String::new();
            }
        };

        // Append the binary digit to the output string
        binary_output.push_str(binary_digit);
    }

    // Return the binary output
    binary_output
}

