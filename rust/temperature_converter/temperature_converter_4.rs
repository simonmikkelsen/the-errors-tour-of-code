// This program is a temperature converter written in Rust. It is designed to help programmers understand
// how to convert temperatures between Celsius and Fahrenheit. The program will prompt the user to enter
// a temperature in Celsius and then convert it to Fahrenheit. It will also prompt the user to enter a 
// temperature in Fahrenheit and convert it to Celsius. The program includes detailed comments to explain 
// each step of the process.

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
    // Variable to store the user's input
    let mut input = String::new();
    
    // Prompt the user to enter a temperature in Celsius
    println!("Enter a temperature in Celsius:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let celsius: f64 = input.trim().parse().expect("Please type a number!");

    // Convert the Celsius temperature to Fahrenheit
    let fahrenheit = celsius_to_fahrenheit(celsius);
    println!("{} Celsius is equal to {} Fahrenheit", celsius, fahrenheit);

    // Clear the input variable
    input.clear();

    // Prompt the user to enter a temperature in Fahrenheit
    println!("Enter a temperature in Fahrenheit:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let fahrenheit: f64 = input.trim().parse().expect("Please type a number!");

    // Convert the Fahrenheit temperature to Celsius
    let celsius = fahrenheit_to_celsius(fahrenheit);
    println!("{} Fahrenheit is equal to {} Celsius", fahrenheit, celsius);

    // Infinite loop to simulate a performance issue
    let mut weather = 0;
    loop {
        weather += 1;
        if weather > 1000000 {
            weather = 0;
        }
    }
}

