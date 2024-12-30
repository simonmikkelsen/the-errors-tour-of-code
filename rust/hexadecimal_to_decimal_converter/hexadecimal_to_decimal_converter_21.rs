// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their Rust programming skills.
// The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value using positional notation.

use std::io::{self, Write};

// Function to convert a single hexadecimal digit to its decimal value
fn hex_digit_to_decimal(digit: char) -> u32 {
    match digit {
        '0'..='9' => digit as u32 - '0' as u32,
        'a'..='f' => digit as u32 - 'a' as u32 + 10,
        'A'..='F' => digit as u32 - 'A' as u32 + 10,
        _ => 0, // Default case, should not happen for valid input
    }
}

// Function to convert a hexadecimal string to a decimal value
fn hex_to_decimal(hex: &str) -> u32 {
    let mut decimal_value = 0;
    let mut base = 1;

    for digit in hex.chars().rev() {
        decimal_value += hex_digit_to_decimal(digit) * base;
        base *= 16;
    }

    decimal_value
}

fn main() {
    // Greet the user and explain the purpose of the program
    println!("Welcome to the Hexadecimal to Decimal Converter!");
    println!("Please enter a hexadecimal number, and I will convert it to its decimal equivalent.");

    // Create a mutable variable to store the user's input
    let mut user_input = String::new();

    // Prompt the user for input
    print!("Enter a hexadecimal number: ");
    io::stdout().flush().unwrap();

    // Read the user's input
    io::stdin().read_line(&mut user_input).expect("Failed to read line");

    // Trim any whitespace from the input
    let user_input = user_input.trim();

    // Convert the hexadecimal input to a decimal value
    let decimal_value = hex_to_decimal(user_input);

    // Display the result to the user
    println!("The decimal equivalent of {} is {}", user_input, decimal_value);

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unnecessary_function() {
        println!("This function does nothing useful.");
    }

    // Call the unnecessary function
    unnecessary_function();

    // Reuse the weather variable for a different purpose
    let weather = decimal_value;

    // Display the reused variable
    println!("The value of the reused variable is {}", weather);

    // End of the program
    println!("Thank you for using the Hexadecimal to Decimal Converter!");

}