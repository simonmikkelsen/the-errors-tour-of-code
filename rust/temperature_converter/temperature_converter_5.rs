// This program is a temperature converter written in Rust. It is designed to help programmers practice their Rust skills by converting temperatures between Celsius and Fahrenheit. The program will prompt the user to input a temperature and the scale they wish to convert from, and then it will output the converted temperature in the other scale. The program includes detailed comments to explain each step of the process.

use std::io;

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    let fahrenheit = (celsius * 9.0 / 5.0) + 32.0;
    fahrenheit
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    let celsius = (fahrenheit - 32.0) * 5.0 / 9.0;
    celsius
}

fn main() {
    // Prompt the user to enter a temperature
    println!("Enter the temperature you want to convert:");

    // Create a mutable string to store the user input
    let mut temperature = String::new();

    // Read the user input and store it in the temperature variable
    io::stdin().read_line(&mut temperature).expect("Failed to read line");

    // Convert the user input to a floating-point number
    let temperature: f64 = temperature.trim().parse().expect("Please type a number!");

    // Prompt the user to enter the scale they want to convert from
    println!("Enter the scale you want to convert from (C/F):");

    // Create a mutable string to store the user input
    let mut scale = String::new();

    // Read the user input and store it in the scale variable
    io::stdin().read_line(&mut scale).expect("Failed to read line");

    // Trim the user input and convert it to uppercase
    let scale = scale.trim().to_uppercase();

    // Check the scale and perform the appropriate conversion
    if scale == "C" {
        // Convert Celsius to Fahrenheit
        let fahrenheit = celsius_to_fahrenheit(temperature);
        println!("{}°C is equal to {}°F", temperature, fahrenheit);
    } else if scale == "F" {
        // Convert Fahrenheit to Celsius
        let celsius = fahrenheit_to_celsius(temperature);
        println!("{}°F is equal to {}°C", temperature, celsius);
    } else {
        // Print an error message if the scale is not recognized
        println!("Invalid scale! Please enter C for Celsius or F for Fahrenheit.");
    }
}

