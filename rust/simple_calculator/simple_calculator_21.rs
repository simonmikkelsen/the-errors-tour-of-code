// This is a simple calculator program written in Rust.
// The purpose of this program is to provide a basic example of how to implement a calculator.
// It includes addition, subtraction, multiplication, and division operations.
// The program is designed to be verbose and include many comments to help new programmers understand the code.
// Sometimes, it includes unnecessary variables and functions to illustrate different aspects of Rust programming.
// Enjoy the journey, and remember: "The universe is probably littered with the one-off mistakes of amateur programmers." - xkcd

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
        println!("Error: Division by zero is not allowed.");
        0.0
    }
}

// Main function where the program starts execution
fn main() {
    // Variables to store user input
    let mut input1 = String::new();
    let mut input2 = String::new();
    let mut operation = String::new();
    let mut result = 0.0;

    // Prompt the user for the first number
    println!("Enter the first number:");
    io::stdin().read_line(&mut input1).expect("Failed to read line");
    let num1: f64 = input1.trim().parse().expect("Please enter a valid number");

    // Prompt the user for the second number
    println!("Enter the second number:");
    io::stdin().read_line(&mut input2).expect("Failed to read line");
    let num2: f64 = input2.trim().parse().expect("Please enter a valid number");

    // Prompt the user for the operation
    println!("Enter the operation (+, -, *, /):");
    io::stdin().read_line(&mut operation).expect("Failed to read line");
    let operation = operation.trim();

    // Perform the calculation based on the operation
    if operation == "+" {
        result = add(num1, num2);
    } else if operation == "-" {
        result = subtract(num1, num2);
    } else if operation == "*" {
        result = multiply(num1, num2);
    } else if operation == "/" {
        result = divide(num1, num2);
    } else {
        println!("Invalid operation");
    }

    // Print the result
    println!("The result is: {}", result);

    // Unnecessary variables and functions to illustrate different aspects of Rust programming
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unnecessary_function() {
        println!("This function is not needed.");
    }

    unused_variable = 100; // Reusing the variable for a different purpose

    // Final print statement
    println!("Thank you for using the simple calculator!");

}