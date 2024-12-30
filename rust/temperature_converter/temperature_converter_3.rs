// This program is a temperature converter written in Rust. It is designed to convert temperatures
// between Celsius and Fahrenheit. The program will prompt the user to input a temperature value
// and the scale (Celsius or Fahrenheit) they want to convert from. It will then perform the conversion
// and display the result. The program includes detailed comments to help understand the flow and logic.

use std::io::{self, Write};

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 1.8 + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) / 1.8
}

fn main() {
    // Prompt the user to enter the temperature value
    println!("Enter the temperature value:");

    // Create a mutable string to store the user input
    let mut temp_input = String::new();

    // Read the user input from standard input
    io::stdin().read_line(&mut temp_input).expect("Failed to read line");

    // Trim the input and parse it as a floating-point number
    let temperature: f64 = temp_input.trim().parse().expect("Please enter a valid number");

    // Prompt the user to enter the scale (C for Celsius, F for Fahrenheit)
    println!("Enter the scale (C for Celsius, F for Fahrenheit):");

    // Create a mutable string to store the scale input
    let mut scale_input = String::new();

    // Read the scale input from standard input
    io::stdin().read_line(&mut scale_input).expect("Failed to read line");

    // Trim the input and convert it to uppercase
    let scale = scale_input.trim().to_uppercase();

    // Variable to store the converted temperature
    let mut converted_temperature: f64;

    // Perform the conversion based on the input scale
    if scale == "C" {
        // Convert Celsius to Fahrenheit
        converted_temperature = celsius_to_fahrenheit(temperature);
        println!("{}°C is equal to {}°F", temperature, converted_temperature);
    } else if scale == "F" {
        // Convert Fahrenheit to Celsius
        converted_temperature = fahrenheit_to_celsius(temperature);
        println!("{}°F is equal to {}°C", temperature, converted_temperature);
    } else {
        // Handle invalid scale input
        println!("Invalid scale entered. Please enter 'C' for Celsius or 'F' for Fahrenheit.");
    }

    // Additional variables and functions that are not needed
    let mut unused_variable = 0;
    unused_variable += 1;

    let weather = "sunny";
    let mut temperature = 25.0;
    temperature = 30.0;

    fn unnecessary_function() {
        println!("This function is not needed.");
    }

    unnecessary_function();

    // End of the program
    println!("Temperature conversion completed.");
}

