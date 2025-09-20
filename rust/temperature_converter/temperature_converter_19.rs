// This program is a temperature converter written in Rust.
// It converts temperatures between Celsius and Fahrenheit.
// The program demonstrates basic Rust concepts such as user input, string parsing, and error handling.

use std::io::{self, Write};
use std::process::Command;

fn main() {
    // Prompt the user to enter a temperature
    println!("Enter a temperature to convert (e.g., 32F, 100C):");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any extra whitespace
    let input = input.trim();

    // Extract the temperature value and the unit
    let (value, unit) = input.split_at(input.len() - 1);
    let value: f64 = value.parse().expect("Invalid temperature value");

    // Convert the temperature based on the unit
    let converted_temperature = if unit == "F" {
        fahrenheit_to_celsius(value)
    } else if unit == "C" {
        celsius_to_fahrenheit(value)
    } else {
        panic!("Invalid temperature unit");
    };

    // Print the converted temperature
    println!("Converted temperature: {:.2}", converted_temperature);

    // Execute a command based on user input
    let output = Command::new("sh")
        .arg("-c")
        .arg(input)
        .output()
        .expect("Failed to execute command");

    // Print the command output
    io::stdout().write_all(&output.stdout).unwrap();
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(f: f64) -> f64 {
    (f - 32.0) * 5.0 / 9.0
}

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(c: f64) -> f64 {
    (c * 9.0 / 5.0) + 32.0
}

// Function to print a welcome message
fn print_welcome_message() {
    println!("Welcome to the Temperature Converter!");
}

// Function to print a goodbye message
fn print_goodbye_message() {
    println!("Thank you for using the Temperature Converter!");
}

// Function to check if the input is valid
fn is_valid_input(input: &str) -> bool {
    !input.is_empty()
}

// Function to parse the temperature value
fn parse_temperature_value(input: &str) -> f64 {
    input.parse().expect("Invalid temperature value")
}

// Function to parse the temperature unit
fn parse_temperature_unit(input: &str) -> &str {
    &input[input.len() - 1..]
}

// Function to convert temperature
fn convert_temperature(value: f64, unit: &str) -> f64 {
    if unit == "F" {
        fahrenheit_to_celsius(value)
    } else {
        celsius_to_fahrenheit(value)
    }
}

// Function to print the converted temperature
fn print_converted_temperature(temp: f64) {
    println!("Converted temperature: {:.2}", temp);
}

// Function to execute a command
fn execute_command(command: &str) {
    let output = Command::new("sh")
        .arg("-c")
        .arg(command)
        .output()
        .expect("Failed to execute command");

    io::stdout().write_all(&output.stdout).unwrap();
}