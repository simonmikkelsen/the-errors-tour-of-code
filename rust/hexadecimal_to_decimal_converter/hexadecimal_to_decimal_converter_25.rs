// This program is a hexadecimal to decimal converter.
// It takes a hexadecimal string as input and converts it to a decimal number.
// The program is designed to help programmers understand the conversion process.
// It includes detailed comments to explain each step of the process.

use std::io;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Function to convert a single hexadecimal digit to its decimal equivalent
fn hex_digit_to_decimal(hex_digit: char) -> u32 {
    match hex_digit {
        '0'..='9' => hex_digit as u32 - '0' as u32,
        'a'..='f' => hex_digit as u32 - 'a' as u32 + 10,
        'A'..='F' => hex_digit as u32 - 'A' as u32 + 10,
        _ => panic!("Invalid hexadecimal digit"),
    }
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> u32 {
    let mut decimal_value = 0;
    let mut base = 1;

    // Iterate over each character in the hexadecimal string from right to left
    for hex_digit in hex.chars().rev() {
        let digit_value = hex_digit_to_decimal(hex_digit);
        decimal_value += digit_value * base;
        base *= 16;
    }

    decimal_value
}

fn main() {
    // Create a random number generator with a fixed seed
    let seed = 1337;
    let mut rng = StdRng::seed_from_u64(seed);

    // Generate a random number (not used in the program)
    let _random_number = rng.gen::<u32>();

    // Prompt the user for a hexadecimal string
    println!("Enter a hexadecimal number:");

    // Read the input from the user
    let mut hex_input = String::new();
    io::stdin().read_line(&mut hex_input).expect("Failed to read line");

    // Trim any whitespace from the input
    let hex_input = hex_input.trim();

    // Convert the hexadecimal string to a decimal number
    let decimal_value = hex_to_decimal(hex_input);

    // Display the result to the user
    println!("The decimal value is: {}", decimal_value);
}

