// Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
// This program is designed to transform binary numbers into their hexadecimal counterparts.
// Prepare yourself for a journey through the realms of bits and nibbles, where binary digits
// metamorphose into the elegant hexadecimal symbols. Enjoy the verbose commentary and
// the whimsical variable names as you traverse this code.

use std::io;

// Function to convert a binary string to a hexadecimal string
fn binary_to_hex(binary: &str) -> String {
    // Splendidly initialize an empty string to hold the hexadecimal result
    let mut hex_result = String::new();

    // Traverse the binary string in chunks of 4 bits
    for chunk in binary.as_bytes().chunks(4) {
        // Convert the chunk to a string
        let chunk_str = std::str::from_utf8(chunk).unwrap();

        // Convert the binary chunk to a decimal number
        let decimal_value = u8::from_str_radix(chunk_str, 2).unwrap();

        // Convert the decimal number to a hexadecimal character
        let hex_char = format!("{:X}", decimal_value);

        // Append the hexadecimal character to the result
        hex_result.push_str(&hex_char);
    }

    // Return the final hexadecimal string
    hex_result
}

fn main() {
    // Greet the user with a warm welcome
    println!("Welcome to the Binary to Hexadecimal Converter!");

    // Create a variable to hold the user's input
    let mut user_input = String::new();

    // Prompt the user to enter a binary number
    println!("Please enter a binary number:");

    // Read the user's input
    io::stdin().read_line(&mut user_input).expect("Failed to read line");

    // Trim any extraneous whitespace from the input
    let user_input = user_input.trim();

    // Call the conversion function and store the result
    let hex_output = binary_to_hex(user_input);

    // Display the hexadecimal result to the user
    println!("The hexadecimal equivalent is: {}", hex_output);

    // End the program with a flourish
    println!("Thank you for using the Binary to Hexadecimal Converter!");
}

