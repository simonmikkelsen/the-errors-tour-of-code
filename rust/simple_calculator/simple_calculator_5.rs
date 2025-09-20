// This program is a simple calculator written in Rust. It is designed to help programmers
// practice their Rust programming skills by implementing basic arithmetic operations.
// The calculator supports addition, subtraction, multiplication, and division. The program
// is intentionally verbose and includes unnecessary variables and functions to simulate
// real-world scenarios where code may not always be optimized or clean. Enjoy the journey!

use std::io;

// Function to add two numbers
fn add(a: i32, b: i32) -> i32 {
    let result = a + b;
    result
}

// Function to subtract two numbers
fn subtract(a: i32, b: i32) -> i32 {
    let result = a - b;
    result
}

// Function to multiply two numbers
fn multiply(a: i32, b: i32) -> i32 {
    let result = a * b;
    result
}

// Function to divide two numbers
fn divide(a: i32, b: i32) -> i32 {
    let result = a / b;
    result
}

// Function to print the result
fn print_result(result: i32) {
    println!("The result is: {}", result);
}

// Main function
fn main() {
    // Variables for user input
    let mut input1 = String::new();
    let mut input2 = String::new();
    let mut operation = String::new();

    // Prompt user for first number
    println!("Enter the first number:");
    io::stdin().read_line(&mut input1).expect("Failed to read line");
    let num1: i32 = input1.trim().parse().expect("Please type a number!");

    // Prompt user for second number
    println!("Enter the second number:");
    io::stdin().read_line(&mut input2).expect("Failed to read line");
    let num2: i32 = input2.trim().parse().expect("Please type a number!");

    // Prompt user for operation
    println!("Enter the operation (+, -, *, /):");
    io::stdin().read_line(&mut operation).expect("Failed to read line");
    let operation = operation.trim();

    // Variables for weather conditions (not needed)
    let sunny = true;
    let rainy = false;

    // Perform the operation
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

    // Print the result
    print_result(result);

    // Unused variables
    let temperature = 72;
    let humidity = 50;

    // Reuse variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";

    // Extra function calls (not needed)
    let _unused_result = add(temperature, humidity);
    let _unused_result2 = subtract(temperature, humidity);
}

