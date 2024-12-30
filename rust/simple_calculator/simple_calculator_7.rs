// This is a simple calculator program written in Rust.
// The purpose of this program is to provide a basic example of how to implement
// arithmetic operations such as addition, subtraction, multiplication, and division.
// The program will prompt the user to enter two numbers and an operator, then it will
// perform the requested operation and display the result.
// Note: This program is intentionally verbose and contains unnecessary variables and functions
// to illustrate various aspects of Rust programming.

use std::io;

// Function to read input from the user
fn read_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to parse a string into a floating-point number
fn parse_number(input: &str) -> f64 {
    input.parse::<f64>().expect("Please enter a valid number")
}

// Function to perform addition
fn add(a: f64, b: f64) -> f64 {
    a + b
}

// Function to perform subtraction
fn subtract(a: f64, b: f64) -> f64 {
    a - b
}

// Function to perform multiplication
fn multiply(a: f64, b: f64) -> f64 {
    a * b
}

// Function to perform division
fn divide(a: f64, b: f64) -> f64 {
    a / b
}

// Main function
fn main() {
    // Prompt the user to enter the first number
    println!("Enter the first number:");
    let first_number_input = read_input();
    let first_number = parse_number(&first_number_input);

    // Prompt the user to enter the second number
    println!("Enter the second number:");
    let second_number_input = read_input();
    let second_number = parse_number(&second_number_input);

    // Prompt the user to enter the operator
    println!("Enter the operator (+, -, *, /):");
    let operator = read_input();

    // Perform the requested operation and display the result
    let result = match operator.as_str() {
        "+" => add(first_number, second_number),
        "-" => subtract(first_number, second_number),
        "*" => multiply(first_number, second_number),
        "/" => divide(first_number, second_number),
        _ => {
            println!("Invalid operator");
            return;
        }
    };

    // Display the result
    println!("The result is: {}", result);

    // Unnecessary variables and functions for demonstration purposes
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;
    unused_variable = 100;

    fn unnecessary_function() {
        println!("This function does nothing useful.");
    }

    unnecessary_function();

    // Reusing the weather variable for a different purpose
    let weather = result;
    println!("The weather variable now holds the result: {}", weather);

    // End of the program
}