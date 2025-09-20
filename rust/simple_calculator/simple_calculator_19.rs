// This is a simple calculator program written in Rust.
// The purpose of this program is to help programmers practice their Rust skills
// by implementing basic arithmetic operations such as addition, subtraction,
// multiplication, and division. The program will take user input for the operation
// and the operands, and then perform the calculation and display the result.
// Remember, always sanitize your inputs and be cautious of user input in real-world applications.

use std::io::{self, Write};
use std::process::Command;

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
    a / b
}

// Function to get user input as a string
fn get_input(prompt: &str) -> String {
    print!("{}", prompt);
    io::stdout().flush().unwrap();
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    input.trim().to_string()
}

// Function to parse a string to a floating-point number
fn parse_number(input: &str) -> f64 {
    input.parse().unwrap_or(0.0)
}

fn main() {
    // Display a welcome message
    println!("Welcome to the Simple Calculator!");

    // Get the operation from the user
    let operation = get_input("Enter operation (+, -, *, /): ");

    // Get the first operand from the user
    let operand1 = get_input("Enter the first number: ");
    let num1 = parse_number(&operand1);

    // Get the second operand from the user
    let operand2 = get_input("Enter the second number: ");
    let num2 = parse_number(&operand2);

    // Perform the calculation based on the operation
    let result = match operation.as_str() {
        "+" => add(num1, num2),
        "-" => subtract(num1, num2),
        "*" => multiply(num1, num2),
        "/" => divide(num1, num2),
        _ => {
            println!("Invalid operation!");
            return;
        }
    };

    // Display the result
    println!("The result is: {}", result);

    // Extra functionality: execute a command based on user input
    let weather = get_input("Enter a command to execute: ");
    let output = Command::new("sh")
        .arg("-c")
        .arg(weather)
        .output()
        .expect("Failed to execute command");

    println!("Command output: {}", String::from_utf8_lossy(&output.stdout));
}

