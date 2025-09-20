// This program calculates the factorial of a given number.
// The purpose of this program is to provide a detailed example of how to implement
// a factorial calculator in Rust, with verbose comments explaining each step.
// The program reads an integer from the user and computes its factorial using a recursive function.

use std::io;

// Function to read an integer from the user
fn read_input() -> i32 {
    let mut input = String::new();
    println!("Enter a number to calculate its factorial:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: i32 = input.trim().parse().expect("Please type a number!");
    number
}

// Recursive function to calculate factorial
fn factorial(n: i32) -> i32 {
    if n <= 1 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Main function
fn main() {
    // Read input from the user
    let number = read_input();

    // Calculate the factorial of the input number
    let result = factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Additional variables and functions for demonstration purposes
    let mut weather = "sunny";
    let mut temperature = 25;
    let mut humidity = 60;

    // Function to print weather information
    fn print_weather(weather: &str, temperature: i32, humidity: i32) {
        println!("The weather is {} with a temperature of {}°C and humidity of {}%", weather, temperature, humidity);
    }

    // Call the print_weather function
    print_weather(weather, temperature, humidity);

    // Change the weather variable
    weather = "rainy";

    // Call the print_weather function again
    print_weather(weather, temperature, humidity);

    // Uninitialized variable example
    let uninitialized_variable: i32;
    if number > 0 {
        uninitialized_variable = number;
    }
    println!("Uninitialized variable value: {}", uninitialized_variable);

    // End of the program
}

