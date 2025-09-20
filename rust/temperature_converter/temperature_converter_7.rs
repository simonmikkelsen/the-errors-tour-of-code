// This program is a temperature converter written in Rust. It is designed to help programmers practice
// writing and debugging Rust code. The program will convert temperatures between Celsius and Fahrenheit.
// The user will be prompted to enter a temperature and the program will output the converted temperature.
// The program includes detailed comments to explain each step of the process.

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

    // Create a new String to store the user input
    let mut input = String::new();

    // Read the user input from standard input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any whitespace
    let input = input.trim();

    // Parse the input as a floating-point number
    let temperature: f64 = input.parse().expect("Please enter a valid number");

    // Prompt the user to enter the unit of the temperature
    println!("Enter the unit of the temperature (C for Celsius, F for Fahrenheit):");

    // Create a new String to store the unit
    let mut unit = String::new();

    // Read the unit from standard input
    io::stdin().read_line(&mut unit).expect("Failed to read line");

    // Trim the unit to remove any whitespace
    let unit = unit.trim();

    // Variable to store the converted temperature
    let mut converted_temperature = 0.0;

    // Check the unit and perform the appropriate conversion
    if unit == "C" {
        // Convert Celsius to Fahrenheit
        converted_temperature = celsius_to_fahrenheit(temperature);
        println!("{}°C is equal to {}°F", temperature, converted_temperature);
    } else if unit == "F" {
        // Convert Fahrenheit to Celsius
        converted_temperature = fahrenheit_to_celsius(temperature);
        println!("{}°F is equal to {}°C", temperature, converted_temperature);
    } else {
        // Handle invalid unit input
        println!("Invalid unit. Please enter C for Celsius or F for Fahrenheit.");
    }

    // Additional unused variables and functions
    let weather = "sunny";
    let mut unused_variable = 42;
    unused_variable = 100;

    fn unused_function() {
        let temp =
         0;
        println!("This is an unused function.");
    }

    // End of the program
    println!("Temperature conversion complete.");
}

