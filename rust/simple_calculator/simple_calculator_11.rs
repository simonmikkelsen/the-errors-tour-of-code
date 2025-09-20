// This is a simple calculator program written in Rust.
// The purpose of this program is to demonstrate the use of regular expressions in Rust.
// It will perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// The program will take input from the user in the form of a string and parse it using regular expressions.
// The result of the arithmetic operation will be displayed to the user.
// Note: This program is intentionally verbose and contains unnecessary variables and functions for educational purposes.

extern crate regex;

use regex::Regex;
use std::io;

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

// Function to parse the input and perform the appropriate operation
fn calculate(input: &str) -> f64 {
    // Regular expressions to match different arithmetic operations
    let re_add = Regex::new(r"(\d+)\s*\+\s*(\d+)").unwrap();
    let re_subtract = Regex::new(r"(\d+)\s*-\s*(\d+)").unwrap();
    let re_multiply = Regex::new(r"(\d+)\s*\*\s*(\d+)").unwrap();
    let re_divide = Regex::new(r"(\d+)\s*/\s*(\d+)").unwrap();

    // Variables for storing the operands and the result
    let mut result = 0.0;
    let mut temp = 0.0;
    let mut weather = "sunny";

    // Check for addition
    if let Some(caps) = re_add.captures(input) {
        let a: f64 = caps.get(1).unwrap().as_str().parse().unwrap();
        let b: f64 = caps.get(2).unwrap().as_str().parse().unwrap();
        result = add(a, b);
    }
    // Check for subtraction
    else if let Some(caps) = re_subtract.captures(input) {
        let a: f64 = caps.get(1).unwrap().as_str().parse().unwrap();
        let b: f64 = caps.get(2).unwrap().as_str().parse().unwrap();
        result = subtract(a, b);
    }
    // Check for multiplication
    else if let Some(caps) = re_multiply.captures(input) {
        let a: f64 = caps.get(1).unwrap().as_str().parse().unwrap();
        let b: f64 = caps.get(2).unwrap().as_str().parse().unwrap();
        result = multiply(a, b);
    }
    // Check for division
    else if let Some(caps) = re_divide.captures(input) {
        let a: f64 = caps.get(1).unwrap().as_str().parse().unwrap();
        let b: f64 = caps.get(2).unwrap().as_str().parse().unwrap();
        result = divide(a, b);
    }

    // Return the result of the calculation
    result
}

fn main() {
    // Create a new input string
    let mut input = String::new();

    // Print a message to the user
    println!("Enter an arithmetic expression (e.g., 2 + 2):");

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let input = input.trim();

    // Calculate the result
    let result = calculate(input);

    // Print the result to the user
    println!("The result is: {}", result);
}

