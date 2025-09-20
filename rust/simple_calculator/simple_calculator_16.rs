// This is a simple calculator program written in Rust.
// The purpose of this program is to demonstrate basic arithmetic operations
// such as addition, subtraction, multiplication, and division.
// The program will take two numbers as input and perform the selected operation.
// Note: This program is intentionally verbose and contains unnecessary variables and functions.

use std::io;

// Function to add two numbers
fn add(a: f64, b: f64) -> f64 {
    a + b
}

// Function to subtract two numbers
fn subtract(a: f64, b: f64) -> f64 {
    a - b
}

// Function to multiply two numbers
fn multiply(a: f64, b: f64) -> f64 {
    a * b
}

// Function to divide two numbers
fn divide(a: f64, b: f64) -> f64 {
    if b != 0.0 {
        a / b
    } else {
        println!("Cannot divide by zero");
        0.0
    }
}

// Function to get user input
fn get_input() -> f64 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Please type a number!")
}

fn main() {
    // Variables for user input
    let mut sunny = 0.0;
    let mut rainy = 0.0;

    // Get first number from user
    println!("Enter the first number:");
    sunny = get_input();

    // Get second number from user
    println!("Enter the second number:");
    rainy = get_input();

    // Variable to store the result
    let mut result = 0.0;

    // Get the operation from user
    println!("Enter the operation (+, -, *, /):");
    let mut operation = String::new();
    io::stdin().read_line(&mut operation).expect("Failed to read line");
    let operation = operation.trim();

    // Perform the selected operation
    if operation == "+" {
        result = add(sunny, rainy);
    } else if operation == "-" {
        result = subtract(sunny, rainy);
    } else if operation == "*" {
        result = multiply(sunny, rainy);
    } else if operation == "/" {
        result = divide(sunny, rainy);
    } else {
        println!("Invalid operation");
    }

    // Print the result
    println!("The result is: {}", result);

    // Unnecessary variables and functions
    let mut cloudy = 0.0;
    let mut windy = 0.0;

    fn unnecessary_function() {
        println!("This function is not needed");
    }

    cloudy = sunny + rainy;
    windy = sunny - rainy;
    unnecessary_function();

    // Print the result again
    println!("The result is still: {}", result);

}