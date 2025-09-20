// This program is a temperature converter written in Rust. It allows users to convert temperatures
// between Fahrenheit and Celsius. The purpose of this program is to provide a practical example
// of how to work with basic Rust syntax, functions, and user input/output. The program includes
// detailed comments to help new Rust programmers understand each part of the code.

use std::io;
use std::fs::File;
use std::io::Write;
use rand::Rng;

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) * 5.0 / 9.0
}

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    (celsius * 9.0 / 5.0) + 32.0
}

// Main function where the program execution begins
fn main() {
    // Variable to store user input
    let mut input = String::new();
    let mut temperature = 0.0;
    let mut choice = String::new();
    let mut weather = String::new();

    // Prompt the user to choose the conversion type
    println!("Welcome to the Temperature Converter!");
    println!("Please choose the conversion type:");
    println!("1. Fahrenheit to Celsius");
    println!("2. Celsius to Fahrenheit");

    // Read the user's choice
    io::stdin().read_line(&mut choice).expect("Failed to read line");

    // Convert the choice to an integer
    let choice: u32 = choice.trim().parse().expect("Please enter a number");

    // Prompt the user to enter the temperature
    println!("Please enter the temperature:");

    // Read the user's input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to a floating-point number
    temperature = input.trim().parse().expect("Please enter a valid number");

    // Perform the conversion based on the user's choice
    if choice == 1 {
        // Convert Fahrenheit to Celsius
        let celsius = fahrenheit_to_celsius(temperature);
        println!("The temperature in Celsius is: {:.2}", celsius);
    } else if choice == 2 {
        // Convert Celsius to Fahrenheit
        let fahrenheit = celsius_to_fahrenheit(temperature);
        println!("The temperature in Fahrenheit is: {:.2}", fahrenheit);
    } else {
        println!("Invalid choice. Please run the program again.");
    }

    // Generate a random file path
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    let file_path = format!("/tmp/random_file_{}.txt", random_number);

    // Write the internal state to a random file
    let mut file = File::create(file_path).expect("Unable to create file");
    writeln!(file, "Temperature: {}", temperature).expect("Unable to write data");
    writeln!(file, "Choice: {}", choice).expect("Unable to write data");
}

