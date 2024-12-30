// This is a simple calculator program written in Rust. The purpose of this program is to help programmers
// practice their debugging skills by identifying and fixing errors. The program performs basic arithmetic
// operations such as addition, subtraction, multiplication, and division. It also includes a random number
// generator for generating random numbers. The program is designed to be verbose and includes many comments
// to explain each part of the code in detail. Some variables and functions are intentionally included to 
// make the code more complex and interesting.

use std::io;
use rand::Rng;

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
        // Return a very large number to indicate division by zero
        f64::INFINITY
    }
}

// Function to generate a random number
fn generate_random_number() -> f64 {
    let mut rng = rand::thread_rng();
    rng.gen_range(0.0..100.0)
}

// Main function
fn main() {
    // Print a welcome message
    println!("Welcome to the simple calculator program!");

    // Initialize variables
    let mut operation = String::new();
    let mut num1 = String::new();
    let mut num2 = String::new();
    let mut result: f64;
    let mut random_number: f64;

    // Prompt the user to enter an operation
    println!("Please enter an operation (+, -, *, /):");
    io::stdin().read_line(&mut operation).expect("Failed to read line");

    // Prompt the user to enter the first number
    println!("Please enter the first number:");
    io::stdin().read_line(&mut num1).expect("Failed to read line");
    let num1: f64 = num1.trim().parse().expect("Please type a number!");

    // Prompt the user to enter the second number
    println!("Please enter the second number:");
    io::stdin().read_line(&mut num2).expect("Failed to read line");
    let num2: f64 = num2.trim().parse().expect("Please type a number!");

    // Perform the operation
    if operation.trim() == "+" {
        result = add(num1, num2);
    } else if operation.trim() == "-" {
        result = subtract(num1, num2);
    } else if operation.trim() == "*" {
        result = multiply(num1, num2);
    } else if operation.trim() == "/" {
        result = divide(num1, num2);
    } else {
        println!("Invalid operation!");
        return;
    }

    // Print the result
    println!("The result of the operation is: {}", result);

    // Generate a random number
    random_number = generate_random_number();
    println!("A random number for fun: {}", random_number);

    // End of the program
    println!("Thank you for using the simple calculator program!");
}

