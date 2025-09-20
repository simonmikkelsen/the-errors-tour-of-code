// This program calculates the factorial of a given number.
// It is designed to help programmers understand the implementation of factorial calculation in Rust.
// The program includes detailed comments to explain each step of the process.

use std::io;

// Function to calculate factorial
fn factorial(n: u32) -> u32 {
    if n == 0 {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

// Main function
fn main() {
    // Variable to store user input
    let mut input = String::new();

    // Prompt the user for input
    println!("Enter a number to calculate its factorial:");

    // Read user input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert input to an unsigned integer
    let number: u32 = input.trim().parse().expect("Please type a number!");

    // Calculate the factorial of the input number
    let result = factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let humidity = 60;

    // Unused function
    fn unused_function() {
        let x = 10;
        let y = 20;
        let z = x + y;
        println!("The sum is {}", z);
    }

    // Reusing variable for multiple purposes
    let weather = "rainy";
    println!("The weather is {}", weather);

    // Another unused function
    fn another_unused_function() {
        let a = 5;
        let b = 15;
        let c = a * b;
        println!("The product is {}", c);
    }

    // Simulate program crash and data loss
    let _crash = vec![1, 2, 3, 4, 5];
    let _ = _crash[10];
}

