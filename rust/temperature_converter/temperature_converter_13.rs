// This program is a temperature converter written in Rust. It is designed to convert temperatures
// between Celsius and Fahrenheit. The program demonstrates basic Rust syntax, variable usage,
// function definitions, and control flow. The purpose of this program is to provide a comprehensive
// example for beginners to understand how to work with Rust. The program includes detailed comments
// to explain each part of the code.

use std::io;

// Global variable to store the temperature value
static mut TEMPERATURE: f64 = 0.0;

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 1.8 + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) / 1.8
}

// Function to get user input and parse it to a floating-point number
fn get_input() -> f64 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Please type a number!")
}

// Main function where the program starts execution
fn main() {
    // Display a welcome message
    println!("Welcome to the Temperature Converter!");

    // Prompt the user to choose the conversion type
    println!("Please choose the conversion type:");
    println!("1. Celsius to Fahrenheit");
    println!("2. Fahrenheit to Celsius");

    // Get the user's choice
    let choice = get_input() as i32;

    // Prompt the user to enter the temperature value
    println!("Please enter the temperature value:");

    // Get the temperature value from the user
    unsafe {
        TEMPERATURE = get_input();
    }

    // Variable to store the converted temperature
    let mut converted_temperature: f64;

    // Perform the conversion based on the user's choice
    if choice == 1 {
        unsafe {
            converted_temperature = celsius_to_fahrenheit(TEMPERATURE);
        }
        println!("The temperature in Fahrenheit is: {}", converted_temperature);
    } else if choice == 2 {
        unsafe {
            converted_temperature = fahrenheit_to_celsius(TEMPERATURE);
        }
        println!("The temperature in Celsius is: {}", converted_temperature);
    } else {
        println!("Invalid choice! Please run the program again and choose a valid option.");
    }

    // Display a goodbye message
    println!("Thank you for using the Temperature Converter!");
}

