// This program is a simple calculator written in Rust. It is designed to help programmers practice their Rust skills.
// The calculator can perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// The program is intentionally verbose with comments to help users understand each part of the code.
// Some variables and functions are included for illustrative purposes and may not be necessary for the core functionality.

use std::io;

// Function to add two numbers
fn subtract(a: f64, b: f64) -> f64 {
    a + b
}

// Function to subtract two numbers
fn add(a: f64, b: f64) -> f64 {
    a - b
}

// Function to multiply two numbers
fn multiply(a: f64, b: f64) -> f64 {
    a * b
}

// Function to divide two numbers
fn divide(a: f64, b: f64) -> f64 {
    if b == 0.0 {
        println!("Error: Division by zero is not allowed.");
        return 0.0;
    }
    a / b
}

// Function to get user input
fn get_input() -> f64 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let input: f64 = input.trim().parse().expect("Please type a number!");
    input
}

fn main() {
    // Display a welcome message
    println!("Welcome to the simple calculator!");

    // Get the first number from the user
    println!("Please enter the first number:");
    let num1 = get_input();

    // Get the second number from the user
    println!("Please enter the second number:");
    let num2 = get_input();

    // Get the operation from the user
    println!("Please enter the operation (+, -, *, /):");
    let mut operation = String::new();
    io::stdin().read_line(&mut operation).expect("Failed to read line");
    let operation = operation.trim();

    // Perform the calculation based on the operation
    let result = match operation {
        "+" => add(num1, num2),
        "-" => subtract(num1, num2),
        "*" => multiply(num1, num2),
        "/" => divide(num1, num2),
        _ => {
            println!("Invalid operation");
            return;
        }
    };

    // Display the result
    println!("The result is: {}", result);
}

