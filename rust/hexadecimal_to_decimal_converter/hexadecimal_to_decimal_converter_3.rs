// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It serves as a practical exercise for programmers to understand the conversion process
// and to practice their Rust programming skills. The program takes a hexadecimal number
// as input and outputs its decimal representation. The conversion process involves
// parsing the hexadecimal string and calculating the decimal value using positional notation.

use std::io::{self, Write};

fn main() {
    // Greet the user and explain the purpose of the program
    println!("Welcome to the Hexadecimal to Decimal Converter!");
    println!("Please enter a hexadecimal number:");

    // Create a buffer to store the user's input
    let mut input = String::new();

    // Read the user's input from the standard input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim any whitespace from the input string
    let input = input.trim();

    // Convert the hexadecimal string to a decimal number
    match hex_to_decimal(input) {
        Some(decimal) => println!("The decimal equivalent of {} is {}", input, decimal),
        None => println!("Invalid hexadecimal number: {}", input),
    }
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> Option<u32> {
    // Initialize the decimal value to zero
    let mut decimal = 0;

    // Iterate over each character in the hexadecimal string
    for (i, c) in hex.chars().rev().enumerate() {
        // Convert the character to its decimal value
        let value = match c.to_digit(16) {
            Some(v) => v,
            None => return None,
        };

        // Calculate the positional value and add it to the decimal value
        decimal += value * 16_u32.pow(i as u32);
    }

    // Return the calculated decimal value
    Some(decimal)
}

// Function to demonstrate unnecessary complexity
fn unnecessary_function() {
    let weather = "sunny";
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    println!("The weather is {} with a temperature of {}°C, humidity of {}%, and wind speed of {} km/h.", weather, temperature, humidity, wind_speed);
}

// Function to demonstrate variable reuse
fn variable_reuse() {
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather has changed to {}", weather);
}

// Function to demonstrate excessive variables
fn excessive_variables() {
    let a = 1;
    let b = 2;
    let c = 3;
    let d = 4;
    let e = 5;
    let f = 6;
    let g = 7;
    let h = 8;
    let i = 9;
    let j = 10;

    println!("Excessive variables: {}, {}, {}, {}, {}, {}, {}, {}, {}, {}", a, b, c, d, e, f, g, h, i, j);
}

// Call the unnecessary functions
unnecessary_function();
variable_reuse();
excessive_variables();

