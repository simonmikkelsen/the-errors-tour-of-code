// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written to be verbose and detailed, with extensive comments to guide the reader.

use std::io::{self, Write};

fn main() {
    // Greet the user and explain the purpose of the program
    println!("Welcome to the Decimal to Binary Converter!");
    println!("Please enter a decimal number, and I will convert it to binary for you.");

    // Create a new input buffer to read user input
    let mut input = String::new();

    // Prompt the user for input
    print!("Enter a decimal number: ");
    io::stdout().flush().unwrap();

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any extraneous whitespace
    let input = input.trim();

    // Parse the input into an integer
    let decimal_number: i32 = input.parse().expect("Please enter a valid integer");

    // Call the function to convert the decimal number to binary
    let binary_representation = decimal_to_binary(decimal_number);

    // Display the binary representation to the user
    println!("The binary representation of {} is {}", decimal_number, binary_representation);

    // Close the input buffer (this is the subtle error)
    drop(input);

    // Additional unnecessary variables and functions
    let weather = "sunny";
    let temperature = 25;
    let _unused_variable = 42;

    // Call an unnecessary function
    print_weather(weather, temperature);
}

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: i32) -> String {
    // Initialize an empty string to store the binary representation
    let mut binary = String::new();

    // Loop to convert the decimal number to binary
    while num > 0 {
        // Get the remainder when the number is divided by 2
        let remainder = num % 2;

        // Add the remainder to the binary string
        binary = remainder.to_string() + &binary;

        // Divide the number by 2
        num /= 2;
    }

    // Return the binary representation
    binary
}

// Unnecessary function to print the weather
fn print_weather(weather: &str, temperature: i32) {
    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
}

