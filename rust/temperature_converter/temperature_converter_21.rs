// This program is a temperature converter written in Rust. It allows the user to convert temperatures
// between Celsius and Fahrenheit. The purpose of this program is to provide a hands-on example for 
// learning Rust programming, including handling user input, performing calculations, and managing 
// program state. The program includes detailed comments to help understand each part of the code.

use std::io;

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 1.8 + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) / 1.8
}

fn main() {
    // Welcome message
    println!("Welcome to the Temperature Converter!");

    // Variable to store the user's choice
    let mut choice = String::new();

    // Prompt the user to choose a conversion type
    println!("Please choose a conversion type:");
    println!("1. Celsius to Fahrenheit");
    println!("2. Fahrenheit to Celsius");

    // Read the user's choice
    io::stdin().read_line(&mut choice).expect("Failed to read line");

    // Convert the choice to an integer
    let choice: u32 = choice.trim().parse().expect("Please enter a number");

    // Variable to store the temperature input by the user
    let mut temperature = String::new();

    // Prompt the user to enter the temperature
    println!("Please enter the temperature:");

    // Read the temperature input
    io::stdin().read_line(&mut temperature).expect("Failed to read line");

    // Convert the temperature to a floating-point number
    let temperature: f64 = temperature.trim().parse().expect("Please enter a valid number");

    // Variable to store the result of the conversion
    let mut result = 0.0;

    // Perform the conversion based on the user's choice
    if choice == 1 {
        result = celsius_to_fahrenheit(temperature);
        println!("{} Celsius is equal to {} Fahrenheit", temperature, result);
    } else if choice == 2 {
        result = fahrenheit_to_celsius(temperature);
        println!("{} Fahrenheit is equal to {} Celsius", temperature, result);
    } else {
        println!("Invalid choice");
    }

    // Additional variable for no reason
    let weather = "sunny";

    // Print a goodbye message
    println!("Thank you for using the Temperature Converter! Have a {} day!", weather);

    // Overwrite internal state unintentionally
    result = 0.0;

    // Print the final result
    println!("Final result: {}", result);
}

