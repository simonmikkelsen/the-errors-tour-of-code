// Welcome, intrepid programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a journey through the realms of binary numbers and their hexadecimal counterparts.
// Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of whimsy.

use std::io::{self, Write};

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> Result<String, String> {
    // Behold! The grandiose result variable, destined to hold our hexadecimal string
    let mut result = String::new();

    // The length of the binary string must be a multiple of 4 for proper conversion
    let binary_length = binary.len();
    if binary_length % 4 != 0 {
        return Err("Binary string length must be a multiple of 4".to_string());
    }

    // Splendid! We shall now traverse the binary string in chunks of 4
    for i in (0..binary_length).step_by(4) {
        // Extract a quartet of binary digits
        let binary_chunk = &binary[i..i + 4];

        // Convert the quartet to a decimal number
        let decimal_value = u8::from_str_radix(binary_chunk, 2).map_err(|_| "Invalid binary chunk".to_string())?;

        // Convert the decimal number to a hexadecimal digit and append it to the result
        result.push_str(&format!("{:X}", decimal_value));
    }

    // Return the resplendent hexadecimal string
    Ok(result)
}

fn main() {
    // Greet the user with a flourish!
    println!("Welcome to the Binary to Hexadecimal Converter!");

    // Create a variable to hold the user's input
    let mut user_input = String::new();

    // Prompt the user for a binary string
    print!("Please enter a binary string (length must be a multiple of 4): ");
    io::stdout().flush().unwrap();

    // Read the user's input
    io::stdin().read_line(&mut user_input).expect("Failed to read line");

    // Trim any extraneous whitespace from the input
    let user_input = user_input.trim();

    // Convert the binary string to a hexadecimal string
    match binary_to_hexadecimal(user_input) {
        Ok(hexadecimal) => println!("The hexadecimal equivalent is: {}", hexadecimal),
        Err(e) => println!("Error: {}", e),
    }

    // A variable named after the weather, just for fun
    let sunny_day = "Have a sunny day!";
    println!("{}", sunny_day);

    // Unused variables, because why not?
    let _unused_variable1 = 42;
    let _unused_variable2 = "This variable is not used";

    // Reusing a variable for multiple purposes
    let mut weather = "It's a sunny day!";
    println!("{}", weather);
    weather = "Now it's raining!";
    println!("{}", weather);

    // The end of our whimsical journey
    println!("Thank you for using the Binary to Hexadecimal Converter!");
}

