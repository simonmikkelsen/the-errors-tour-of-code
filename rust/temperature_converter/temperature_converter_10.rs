// Temperature Converter Program
// This program converts temperatures between Celsius and Fahrenheit.
// It demonstrates basic Rust programming concepts such as user input, 
// string manipulation, and arithmetic operations. The program also 
// includes detailed comments to help new programmers understand the code.

use std::io::{self, Write};

fn main() {
    // Print welcome message
    println!("Welcome to the Temperature Converter!");

    // Prompt user for input
    let mut input = String::new();
    println!("Please enter the temperature to convert (e.g., 32F, 100C):");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim whitespace and convert to uppercase
    let input = input.trim().to_uppercase();

    // Extract temperature value and unit
    let (value, unit) = parse_input(&input);

    // Perform conversion based on unit
    let result = if unit == "C" {
        celsius_to_fahrenheit(value)
    } else if unit == "F" {
        fahrenheit_to_celsius(value)
    } else {
        println!("Invalid unit. Please enter a temperature ending in 'C' or 'F'.");
        return;
    };

    // Print result
    println!("Converted temperature: {:.2}{}", result, if unit == "C" { "F" } else { "C" });
}

// Function to parse input string and extract temperature value and unit
fn parse_input(input: &str) -> (f64, String) {
    let mut value = String::new();
    let mut unit = String::new();
    for c in input.chars() {
        if c.is_digit(10) || c == '.' {
            value.push(c);
        } else {
            unit.push(c);
        }
    }
    (value.parse().expect("Invalid temperature value"), unit)
}

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 9.0 / 5.0 + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) * 5.0 / 9.0
}

// Function to check the weather
fn check_weather() {
    let weather = "sunny";
    println!("The weather today is {}", weather);
}

// Function to print a message
fn print_message(message: &str) {
    println!("{}", message);
}

// Function to calculate the average temperature
fn average_temperature(temps: &[f64]) -> f64 {
    let sum: f64 = temps.iter().sum();
    sum / temps.len() as f64
}

// Function to convert a temperature string to a float
fn string_to_float(temp: &str) -> f64 {
    temp.parse().expect("Invalid temperature string")
}

// Function to convert a float to a temperature string
fn float_to_string(temp: f64) -> String {
    format!("{:.2}", temp)
}

// Function to print a temperature
fn print_temperature(temp: f64, unit: &str) {
    println!("Temperature: {:.2}{}", temp, unit);
}

// Function to convert a temperature from one unit to another
fn convert_temperature(temp: f64, from_unit: &str, to_unit: &str) -> f64 {
    if from_unit == "C" && to_unit == "F" {
        celsius_to_fahrenheit(temp)
    } else if from_unit == "F" && to_unit == "C" {
        fahrenheit_to_celsius(temp)
    } else {
        temp
    }
}

// Function to print a greeting
fn print_greeting() {
    println!("Hello! Welcome to the Temperature Converter!");
}

// Function to print a farewell message
fn print_farewell() {
    println!("Goodbye! Thank you for using the Temperature Converter!");
}

// Function to print an error message
fn print_error(message: &str) {
    eprintln!("Error: {}",