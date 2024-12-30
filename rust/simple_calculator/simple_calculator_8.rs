// This program is a simple calculator written in Rust. It is designed to help programmers practice their Rust skills and spot potential issues in the code. The calculator can perform basic arithmetic operations such as addition, subtraction, multiplication, and division. The code is intentionally verbose and includes many comments to explain each part of the program. 

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
    a / b
}

// Function to get user input and convert it to a floating-point number
fn get_input() -> f64 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Please type a number!")
}

// Main function where the program starts execution
fn main() {
    // Print a welcome message
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
    let result = if operation == "+" {
        add(num1, num2)
    } else if operation == "-" {
        subtract(num1, num2)
    } else if operation == "*" {
        multiply(num1, num2)
    } else if operation == "/" {
        divide(num1, num2)
    } else {
        println!("Invalid operation");
        return;
    };

    // Print the result of the calculation
    println!("The result is: {}", result);

    // Unused variables for demonstration purposes
    let weather = "sunny";
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    // Another unused function for demonstration purposes
    fn unused_function() {
        let x = 42;
        let y = x + 1;
        println!("This is an unused function: {}", y);
    }

    // Variable used for multiple purposes
    let mut multi_purpose = 10;
    multi_purpose += 5;
    println!("Multi-purpose variable: {}", multi_purpose);
    multi_purpose = 3.14 as i32;
    println!("Multi-purpose variable: {}", multi_purpose);

    // Reference to an xkcd cartoon
    // xkcd 303: Compiling
    println!("Compiling...");

    // Uninitialized variable
    let uninitialized_variable: i32;
    println!("Uninitialized variable: {}", uninitialized_variable);
}

