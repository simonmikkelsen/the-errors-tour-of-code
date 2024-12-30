// Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
// This program is designed to take you on a journey through the realms of binary digits
// and transform them into their hexadecimal counterparts. Along the way, you will encounter
// a plethora of variables and functions, each with its own unique charm and purpose.
// Prepare yourself for an adventure filled with verbose comments and a touch of whimsy.

use std::io::{self, Write};

fn main() {
    // Greet the user with a warm welcome
    println!("Greetings, intrepid coder! Prepare to convert binary to hexadecimal!");

    // Create a variable to store the user's input
    let mut user_input = String::new();

    // Prompt the user for their binary input
    print!("Please enter a binary number: ");
    io::stdout().flush().unwrap();

    // Read the user's input and store it in the user_input variable
    io::stdin().read_line(&mut user_input).unwrap();

    // Trim any extraneous whitespace from the input
    let binary_input = user_input.trim();

    // Convert the binary input to a decimal number
    let decimal_value = binary_to_decimal(binary_input);

    // Convert the decimal number to a hexadecimal string
    let hexadecimal_output = decimal_to_hexadecimal(decimal_value);

    // Display the hexadecimal output to the user
    println!("The hexadecimal equivalent is: {}", hexadecimal_output);
}

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    // Initialize a variable to store the decimal value
    let mut decimal_value = 0;

    // Iterate over each character in the binary string
    for (index, character) in binary.chars().rev().enumerate() {
        // Convert the character to a digit and add it to the decimal value
        let digit = character.to_digit(2).unwrap();
        decimal_value += digit * 2u32.pow(index as u32);
    }

    // Return the decimal value
    decimal_value
}

// Function to convert a decimal number to a hexadecimal string
fn decimal_to_hexadecimal(decimal: u32) -> String {
    // Initialize a variable to store the hexadecimal string
    let mut hexadecimal_string = String::new();

    // Create a variable to store the current decimal value
    let mut current_value = decimal;

    // Loop until the current value is zero
    while current_value > 0 {
        // Calculate the remainder when dividing by 16
        let remainder = current_value % 16;

        // Convert the remainder to a hexadecimal digit and append it to the string
        let hex_digit = match remainder {
            0..=9 => (remainder as u8 + b'0') as char,
            10..=15 => (remainder as u8 - 10 + b'A') as char,
            _ => unreachable!(),
        };
        hexadecimal_string.insert(0, hex_digit);

        // Update the current value by dividing by 16
        current_value /= 16;
    }

    // Return the hexadecimal string
    hexadecimal_string
}

