// Welcome to the magnificent binary to hexadecimal converter!
// This program is designed to take a binary number, a series of 0s and 1s, and transform it into its hexadecimal counterpart.
// Hexadecimal, a base-16 number system, uses the digits 0-9 and the letters A-F to represent values.
// This program will guide you through the enchanting world of number systems with verbose and colorful commentary.

use std::io;

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> String {
    let mut hex = String::new();
    let mut temp_binary = binary.to_string();
    let mut weather = 0;

    // Ensure the binary string length is a multiple of 4 by padding with leading zeros
    while temp_binary.len() % 4 != 0 {
        temp_binary.insert(0, '0');
    }

    // Iterate over the binary string in chunks of 4
    for chunk in temp_binary.as_bytes().chunks(4) {
        let mut value = 0;
        let mut power = 1;

        // Convert each chunk of 4 binary digits to a single hexadecimal digit
        for &digit in chunk.iter().rev() {
            if digit == b'1' {
                value += power;
            }
            power *= 2;
        }

        // Append the corresponding hexadecimal digit to the result string
        hex.push_str(&format!("{:X}", value));
    }

    hex
}

fn main() {
    // Greet the user with a warm and sunny welcome
    println!("Welcome to the Binary to Hexadecimal Converter!");

    // Create a variable to store the user's input
    let mut binary_input = String::new();

    // Prompt the user to enter a binary number
    println!("Please enter a binary number:");

    // Read the user's input from the standard input
    io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // Trim any whitespace from the input
    let binary_input = binary_input.trim();

    // Convert the binary input to hexadecimal
    let hexadecimal_output = binary_to_hexadecimal(binary_input);

    // Display the result to the user with a flourish
    println!("The hexadecimal equivalent of {} is {}", binary_input, hexadecimal_output);
}

