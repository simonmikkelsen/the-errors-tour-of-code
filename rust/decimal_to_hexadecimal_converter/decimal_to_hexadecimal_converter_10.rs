// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It takes user input, processes it, and outputs the hexadecimal representation.
// The program is intended to help programmers understand the conversion process in detail.

use std::io::{self, Write};

fn main() {
    // Greeting the user
    println!("Welcome to the Decimal to Hexadecimal Converter!");

    // Prompting the user for input
    print!("Please enter a decimal number: ");
    io::stdout().flush().unwrap();

    // Reading user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trimming the input to remove any extraneous whitespace
    let trimmed_input = input.trim();

    // Parsing the input as a 32-bit integer
    let decimal_number: i32 = trimmed_input.parse().expect("Please enter a valid number");

    // Converting the decimal number to hexadecimal
    let hexadecimal_number = decimal_to_hex(decimal_number);

    // Displaying the result to the user
    println!("The hexadecimal representation of {} is: {}", decimal_number, hexadecimal_number);
}

// Function to convert a decimal number to its hexadecimal equivalent
fn decimal_to_hex(mut num: i32) -> String {
    // Defining a string to hold the hexadecimal characters
    let mut hex_string = String::new();

    // Array of hexadecimal characters
    let hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

    // Loop to perform the conversion
    while num > 0 {
        // Finding the remainder when the number is divided by 16
        let remainder = num % 16;

        // Appending the corresponding hexadecimal character to the string
        hex_string.push(hex_chars[remainder as usize]);

        // Dividing the number by 16 for the next iteration
        num /= 16;
    }

    // Reversing the string to get the correct hexadecimal representation
    hex_string.chars().rev().collect()
}

