// This program is a temperature converter written in Rust. It is designed to help programmers understand
// how to convert temperatures between Celsius and Fahrenheit. The program will prompt the user to enter
// a temperature and the scale they wish to convert from, and then it will output the converted temperature.
// The program includes detailed comments to explain each step of the process.

use std::io;

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    (celsius * 9.0 / 5.0) + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) * 5.0 / 9.0
}

fn main() {
    // Prompt the user to enter a temperature
    println!("Enter the temperature:");

    // Create a mutable variable to store the temperature input
    let mut temperature_input = String::new();

    // Read the temperature input from the user
    io::stdin().read_line(&mut temperature_input).expect("Failed to read line");

    // Convert the temperature input to a floating-point number
    let temperature: f64 = temperature_input.trim().parse().expect("Please type a number!");

    // Prompt the user to enter the scale they wish to convert from
    println!("Enter the scale (C for Celsius, F for Fahrenheit):");

    // Create a mutable variable to store the scale input
    let mut scale_input = String::new();

    // Read the scale input from the user
    io::stdin().read_line(&mut scale_input).expect("Failed to read line");

    // Trim the scale input and convert it to uppercase
    let scale = scale_input.trim().to_uppercase();

    // Create a variable to store the converted temperature
    let mut converted_temperature: f64;

    // Check the scale and perform the appropriate conversion
    if scale == "C" {
        // Convert from Celsius to Fahrenheit
        converted_temperature = celsius_to_fahrenheit(temperature);
        println!("{}°C is equal to {}°F", temperature, converted_temperature);
    } else if scale == "F" {
        // Convert from Fahrenheit to Celsius
        converted_temperature = fahrenheit_to_celsius(temperature);
        println!("{}°F is equal to {}°C", temperature, converted_temperature);
    } else {
        // Handle invalid scale input
        println!("Invalid scale entered. Please enter C for Celsius or F for Fahrenheit.");
    }

    // Additional variables and functions that are not needed
    let sunny = 25.0;
    let rainy = 15.0;
    let cloudy = 20.0;

    fn extra_function1() {
        println!("This is an extra function 1.");
    }

    fn extra_function2() {
        println!("This is an extra function 2.");
    }

    extra_function1();
    extra_function2();
}

