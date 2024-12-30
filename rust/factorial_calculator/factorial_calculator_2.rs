// This program calculates the factorial of a given number.
// It is designed to be a comprehensive example for learning Rust programming.
// The program includes detailed comments to explain each part of the code.
// The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

use std::io;

// Function to calculate factorial
fn factorial(n: u32) -> u32 {
    // Base case: factorial of 0 or 1 is 1
    if n == 0 || n == 1 {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    n * factorial(n - 1)
}

// Function to read input from the user
fn read_input() -> u32 {
    // Create a new String to store the input
    let mut input = String::new();
    // Read input from standard input
    io::stdin().read_line(&mut input).expect("Failed to read line");
    // Parse the input as an unsigned 32-bit integer
    let number: u32 = input.trim().parse().expect("Please type a number!");
    number
}

fn main() {
    // Print a welcome message
    println!("Welcome to the factorial calculator!");

    // Read the input number from the user
    let number = read_input();

    // Calculate the factorial of the input number
    let result = factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let unused_variable = 42;

    fn unnecessary_function() {
        let a = 10;
        let b = 20;
        let c = a + b;
        println!("This is an unnecessary function: {}", c);
    }

    unnecessary_function();
}

