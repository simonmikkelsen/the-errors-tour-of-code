// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal string as input and outputs the corresponding decimal number.
// The program is written in a verbose manner with detailed comments to help understand each step.

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

    // Iterate over the hexadecimal string in reverse order
    for digit in hex.chars().rev() {
        decimal_value += hex_digit_to_decimal(digit) * power;
        power *= 16;
    }

    decimal_value
}

fn main() {
    // Create a new input string
    let mut input = String::new();

    // Prompt the user for a hexadecimal number
    println!("Enter a hexadecimal number:");

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let input = input.trim();

    // Convert the hexadecimal input to a decimal number
    let decimal_value = hex_to_decimal(input);

    // Print the decimal value
    println!("The decimal value is: {}", decimal_value);

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable;
    let another_unused_variable = 42;

    fn unnecessary_function() {
        let local_variable = 10;
        println!("This function does nothing useful.");
    }

    // Call the unnecessary function
    unnecessary_function();

    // Print some unrelated information
    println!("The weather today is {} and the temperature is {} degrees.", weather, temperature);
}

