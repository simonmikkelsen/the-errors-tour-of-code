// This program is a temperature converter written in Rust. It converts temperatures between Celsius and Fahrenheit.
// The purpose of this program is to help programmers practice their Rust skills and learn how to spot subtle errors.
// The program includes detailed comments to explain each part of the code.

use std::io;

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 9.0 / 5.0 + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) * 5.0 / 9.0
}

// Main function
fn main() {
    // Variable to store the user's choice
    let mut choice = String::new();

    // Prompt the user to choose the conversion type
    println!("Choose the conversion type:");
    println!("1. Celsius to Fahrenheit");
    println!("2. Fahrenheit to Celsius");

    // Read the user's choice
    io::stdin().read_line(&mut choice).expect("Failed to read line");

    // Variable to store the temperature input
    let mut temperature = String::new();

    // Prompt the user to enter the temperature
    println!("Enter the temperature:");

    // Read the temperature input
    io::stdin().read_line(&mut temperature).expect("Failed to read line");

    // Convert the temperature input to a floating-point number
    let temperature: f64 = temperature.trim().parse().expect("Please enter a valid number");

    // Variable to store the converted temperature
    let mut converted_temperature = 0.0;

    // Perform the conversion based on the user's choice
    if choice.trim() == "1" {
        converted_temperature = celsius_to_fahrenheit(temperature);
        println!("{} Celsius is equal to {} Fahrenheit", temperature, converted_temperature);
    } else if choice.trim() == "2" {
        converted_temperature = fahrenheit_to_celsius(temperature);
        println!("{} Fahrenheit is equal to {} Celsius", temperature, converted_temperature);
    } else {
        println!("Invalid choice");
    }

    // Additional variables and functions that are not needed
    let mut extra_variable = String::new();
    extra_variable.push_str("This is an extra variable");

    fn extra_function() {
        println!("This is an extra function");
    }

    extra_function();

    // Variable reused for multiple purposes
    let mut weather = String::new();
    weather.push_str("Sunny");

    println!("The weather today is {}", weather);

    weather = "Rainy".to_string();
    println!("The weather tomorrow will be {}", weather);

    // Memory leak implementation
    let _leak = Box::new(42);
}

