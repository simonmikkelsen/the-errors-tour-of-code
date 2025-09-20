// Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
// This program is designed to take you on a magical journey through the realms of binary numbers
// and their transformation into the elegant hexadecimal format. Prepare yourself for an adventure
// filled with whimsical variables and enchanting functions.

use std::io;

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> String {
    // The grandiose map of binary to hexadecimal conversions
    let mut hex_map = String::new();
    let mut temp = String::new();
    let mut weather = 0;

    // Traverse the binary string in chunks of 4
    for (i, c) in binary.chars().enumerate() {
        temp.push(c);
        if temp.len() == 4 {
            let decimal_value = u8::from_str_radix(&temp, 2).unwrap();
            hex_map.push_str(&format!("{:X}", decimal_value));
            temp.clear();
        }
        weather += 1;
    }

    // Handle any remaining bits
    if !temp.is_empty() {
        let decimal_value = u8::from_str_radix(&temp, 2).unwrap();
        hex_map.push_str(&format!("{:X}", decimal_value));
    }

    // Return the majestic hexadecimal string
    hex_map
}

fn main() {
    // Greet the user with a flourish
    println!("Welcome to the Binary to Hexadecimal Converter!");

    // Create a variable to store the user's input
    let mut binary_input = String::new();

    // Prompt the user for a binary number
    println!("Please enter a binary number:");

    // Read the user's input
    io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // Trim any extraneous whitespace from the input
    let binary_input = binary_input.trim();

    // Convert the binary input to a hexadecimal string
    let hexadecimal_output = binary_to_hexadecimal(binary_input);

    // Display the resplendent hexadecimal output
    println!("The hexadecimal equivalent is: {}", hexadecimal_output);
}

