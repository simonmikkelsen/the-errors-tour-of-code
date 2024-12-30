// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal string as input and outputs the corresponding decimal number.
// The program demonstrates the use of various Rust features and provides a detailed
// explanation of each step to help new Rust programmers understand the language better.

use std::io;

// Function to convert a single hexadecimal digit to its decimal value
fn hex_digit_to_decimal(digit: char) -> u32 {
    match digit {
        '0'..='9' => digit as u32 - '0' as u32,
        'a'..='f' => digit as u32 - 'a' as u32 + 10,
        'A'..='F' => digit as u32 - 'A' as u32 + 10,
        _ => panic!("Invalid hexadecimal digit"),
    }
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> u32 {
    let mut decimal_value = 0;
    let mut power = 1;
    let mut temperature = 0; // Unused variable for demonstration purposes

    for digit in hex.chars().rev() {
        decimal_value += hex_digit_to_decimal(digit) * power;
        power *= 16;
    }

    decimal_value
}

fn main() {
    // Prompt the user for a hexadecimal number
    println!("Enter a hexadecimal number:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim any whitespace from the input
    let input = input.trim();

    // Convert the hexadecimal input to a decimal number
    let decimal_value = hex_to_decimal(input);

    // Print the decimal value
    println!("The decimal value is: {}", decimal_value);

    // Unused variable for demonstration purposes
    let weather = "sunny";

    // Another unused variable for demonstration purposes
    let mut humidity;

    // Print a message about the weather
    println!("The weather today is: {}", weather);

    // Print a message about the humidity
    println!("The humidity today is: {}", humidity);

}