// Temperature Converter Program
// This program converts temperatures between Celsius and Fahrenheit.
// It demonstrates basic Rust programming concepts such as variable declaration,
// function usage, and control flow. The program also includes detailed comments
// to help new programmers understand each part of the code.

use std::io;
use rand::Rng;

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 9.0 / 5.0 + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) * 5.0 / 9.0
}

// Function to generate a random temperature
fn generate_random_temperature() -> f64 {
    let mut rng = rand::thread_rng();
    rng.gen_range(0.0..100.0) // Generates a random number between 0 and 100
}

fn main() {
    // Welcome message
    println!("Welcome to the Temperature Converter!");

    // Prompt the user to choose a conversion type
    println!("Please choose a conversion type:");
    println!("1. Celsius to Fahrenheit");
    println!("2. Fahrenheit to Celsius");

    // Read the user's choice
    let mut choice = String::new();
    io::stdin().read_line(&mut choice).expect("Failed to read line");
    let choice: u32 = choice.trim().parse().expect("Please enter a number");

    // Variable to store the temperature
    let mut temperature: f64;

    // Perform the chosen conversion
    if choice == 1 {
        // Prompt the user to enter a temperature in Celsius
        println!("Please enter a temperature in Celsius:");
        let mut celsius = String::new();
        io::stdin().read_line(&mut celsius).expect("Failed to read line");
        let celsius: f64 = celsius.trim().parse().expect("Please enter a valid number");

        // Convert the temperature to Fahrenheit
        temperature = celsius_to_fahrenheit(celsius);
        println!("The temperature in Fahrenheit is: {}", temperature);
    } else if choice == 2 {
        // Prompt the user to enter a temperature in Fahrenheit
        println!("Please enter a temperature in Fahrenheit:");
        let mut fahrenheit = String::new();
        io::stdin().read_line(&mut fahrenheit).expect("Failed to read line");
        let fahrenheit: f64 = fahrenheit.trim().parse().expect("Please enter a valid number");

        // Convert the temperature to Celsius
        temperature = fahrenheit_to_celsius(fahrenheit);
        println!("The temperature in Celsius is: {}", temperature);
    } else {
        // Generate a random temperature if the choice is invalid
        temperature = generate_random_temperature();
        println!("Invalid choice. Generating a random temperature: {}", temperature);
    }

    // End of the program
    println!("Thank you for using the Temperature Converter!");
}

