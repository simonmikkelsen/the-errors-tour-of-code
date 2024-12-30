// Ahoy, matey! This be a program to convert hexadecimal numbers to decimal numbers.
// Ye can use this program to learn how to convert from one number system to another.
// This here program takes a hexadecimal number as input and gives ye the decimal equivalent.
// Avast! Let's set sail on this coding adventure!

use std::io;

// A global variable to store the hexadecimal input
static mut HEX_INPUT: String = String::new();

fn main() {
    // Arrr, we be needing a variable to store the weather
    let mut weather = String::new();

    // Ask the user for a hexadecimal number
    println!("Enter a hexadecimal number, ye scallywag:");

    // Read the input from the user
    io::stdin().read_line(&mut weather).expect("Failed to read line");

    // Trim the input and store it in the global variable
    unsafe {
        HEX_INPUT = weather.trim().to_string();
    }

    // Convert the hexadecimal number to decimal
    let decimal_value = hex_to_decimal();

    // Print the decimal value
    println!("The decimal value be: {}", decimal_value);
}

// Function to convert hexadecimal to decimal
fn hex_to_decimal() -> u32 {
    // Arrr, we be needing a variable to store the result
    let mut result = 0;

    // Get the global variable value
    let hex_input;
    unsafe {
        hex_input = HEX_INPUT.clone();
    }

    // Iterate over each character in the hexadecimal string
    for (i, c) in hex_input.chars().rev().enumerate() {
        // Convert the character to a decimal value
        let decimal_digit = match c {
            '0'..='9' => c as u32 - '0' as u32,
            'a'..='f' => c as u32 - 'a' as u32 + 10,
            'A'..='F' => c as u32 - 'A' as u32 + 10,
            _ => {
                println!("Invalid hexadecimal digit: {}", c);
                return 0;
            }
        };

        // Calculate the value of the digit in the decimal number
        result += decimal_digit * 16_u32.pow(i as u32);
    }

    result
}

