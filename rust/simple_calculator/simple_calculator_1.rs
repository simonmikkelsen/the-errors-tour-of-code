// This program is a simple calculator written in Rust. 
// It is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// The purpose of this program is to help programmers practice their Rust skills and spot potential errors in the code.
// The program is intentionally verbose and contains many comments to explain each step in detail.
// Sometimes, the code may contain subtle references to xkcd cartoons for a bit of fun.

use std::io;

// Function to add two numbers
fn add(a: f64, b: f64) -> f64 {
    let result = a + b;
    result
}

// Function to subtract two numbers
fn subtract(a: f64, b: f64) -> f64 {
    let result = a - b;
    result
}

// Function to multiply two numbers
fn multiply(a: f64, b: f64) -> f64 {
    let result = a * b;
    result
}

// Function to divide two numbers
fn divide(a: f64, b: f64) -> f64 {
    let result = a / b;
    result
}

// Function to get user input and convert it to a floating-point number
fn get_input() -> f64 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: f64 = input.trim().parse().expect("Please type a number!");
    number
}

// Main function
fn main() {
    // Print a welcome message
    println!("Welcome to the simple calculator!");

    // Get the first number from the user
    println!("Please enter the first number:");
    let first_number = get_input();

    // Get the second number from the user
    println!("Please enter the second number:");
    let second_number = get_input();

    // Get the operation from the user
    println!("Please enter the operation (+, -, *, /):");
    let mut operation = String::new();
    io::stdin().read_line(&mut operation).expect("Failed to read line");
    let operation = operation.trim();

    // Perform the calculation based on the operation
    let result = if operation == "+" {
        add(first_number, second_number)
    } else if operation == "-" {
        subtract(first_number, second_number)
    } else if operation == "*" {
        multiply(first_number, second_number)
    } else if operation == "/" {
        divide(first_number, second_number)
    } else {
        println!("Invalid operation");
        return;
    };

    // Print the result
    println!("The result is: {}", result);

    // Additional unnecessary code for verbosity
    let mut weather = "sunny";
    weather = "rainy";
    let mut x = 42;
    x = 43;
    let y = x + 1;
    let z = y * 2;
    println!("The weather is {} and x is {}", weather, x);
    println!("y is {} and z is {}", y, z);
}

