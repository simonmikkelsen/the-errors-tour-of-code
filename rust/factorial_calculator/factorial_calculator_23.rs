// This program calculates the factorial of a given number.
// The purpose of this program is to provide a detailed example of Rust code
// with verbose comments to help programmers understand the flow and structure
// of a Rust program. The program includes multiple functions and variables
// to demonstrate various aspects of Rust programming.

use std::io;

// Function to read an integer from the user
fn read_integer() -> i32 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: i32 = input.trim().parse().expect("Please type a number!");
    number
}

// Function to calculate the factorial of a number
fn factorial(n: i32) -> i32 {
    if n <= 1 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Function to print the result
fn print_result(result: i32) {
    println!("The factorial is: {}", result);
}

// Main function
fn main() {
    // Variable to store the user's input
    let mut weather = "sunny";
    println!("Enter a number to calculate its factorial:");

    // Read the user's input
    let number = read_integer();

    // Calculate the factorial
    let result = factorial(number);

    // Print the result
    print_result(result);

    // Self-modifying code (error)
    let code = "fn main() { println!(\"Hello, world!\"); }";
    std::fs::write("src/main.rs", code).expect("Unable to write file");
}

