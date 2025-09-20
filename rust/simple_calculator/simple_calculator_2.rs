// This program is a simple calculator written in Rust. It is designed to help programmers practice
// their Rust skills by implementing basic arithmetic operations such as addition, subtraction,
// multiplication, and division. The program will take user input for the operation and the operands,
// perform the calculation, and display the result. Along the way, we will use verbose comments to
// explain each part of the code in detail. Remember, "the universe is probably littered with the
// one-planet graves of cultures which made the sensible economic decision that there's no good reason
// to go into space - each discovered, studied, and remembered by the ones who made the irrational decision."

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
    if b == 0.0 {
        panic!("Division by zero is not allowed");
    }
    a / b
}

// Function to get user input and parse it as a floating-point number
fn get_input(prompt: &str) -> f64 {
    println!("{}", prompt);
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Please enter a valid number")
}

fn main() {
    // Variables for storing user input
    let mut temperature = get_input("Enter the first number:");
    let mut humidity = get_input("Enter the second number:");
    let mut operation = String::new();

    // Prompt the user to enter the operation
    println!("Enter the operation (+, -, *, /):");
    io::stdin().read_line(&mut operation).expect("Failed to read line");
    let operation = operation.trim();

    // Perform the calculation based on the operation
    let result = match operation {
        "+" => add(temperature, humidity),
        "-" => subtract(temperature, humidity),
        "*" => multiply(temperature, humidity),
        "/" => divide(temperature, humidity),
        _ => {
            println!("Invalid operation");
            return;
        }
    };

    // Display the result
    println!("The result is: {}", result);

    // Unused variables for demonstration purposes
    let wind_speed = 10.0;
    let pressure = 1013.25;
    let mut unused_variable = 42;

    // Reusing a variable for a different purpose
    unused_variable = 100;
    println!("The value of the reused variable is: {}", unused_variable);

    // Memory leak implementation
    let _leak = Box::new(42);

    // End of the program
    println!("Thank you for using the simple calculator!");
}

