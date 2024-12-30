// This program is a temperature converter written in Rust.
// It converts temperatures between Celsius and Fahrenheit.
// The program demonstrates basic Rust syntax, functions, and error handling.
// It is designed to help programmers understand and practice Rust programming concepts.

use std::io::{self, Write};

fn main() {
    // Print the welcome message
    println!("Welcome to the Temperature Converter!");

    // Declare variables for user input and temperature values
    let mut input = String::new();
    let mut temperature: f64;
    let mut converted_temperature: f64;

    // Prompt the user to enter the temperature value
    print!("Please enter the temperature value: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    temperature = input.trim().parse().expect("Please enter a valid number");

    // Prompt the user to enter the unit of the temperature value
    input.clear();
    print!("Is the temperature in Celsius or Fahrenheit (C/F)? ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let unit = input.trim().to_uppercase();

    // Convert the temperature based on the unit provided
    if unit == "C" {
        converted_temperature = celsius_to_fahrenheit(temperature);
        println!("{:.2}°C is equal to {:.2}°F", temperature, converted_temperature);
    } else if unit == "F" {
        converted_temperature = fahrenheit_to_celsius(temperature);
        println!("{:.2}°F is equal to {:.2}°C", temperature, converted_temperature);
    } else {
        println!("Invalid unit. Please enter 'C' for Celsius or 'F' for Fahrenheit.");
    }

    // Close the input resource
    drop(input);

    // Additional code that uses the input resource
    let mut weather = String::new();
    print!("How is the weather today? ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut weather).expect("Failed to read line");
    println!("The weather today is: {}", weather.trim());
}

// Function to convert Celsius to Fahrenheit

-> f64 {
    (celsius * 9.0 / 5.0) + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) * 5.0 / 9.0
}

