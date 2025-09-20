// This program calculates the factorial of a given number.
// It is designed to help programmers understand the concept of recursion
// and how to handle user input in Rust. The program will prompt the user
// to enter a number and then calculate the factorial of that number using
// a recursive function. The result will be displayed to the user.

use std::io;

// Function to calculate factorial recursively
fn factorial(n: u32) -> u32 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Main function to handle user input and display the result
fn main() {
    // Prompt the user to enter a number
    println!("Enter a number to calculate its factorial:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let number: u32 = input.trim().parse().expect("Please type a number!");

    // Calculate the factorial
    let result = factorial(number);

    // Display the result
    println!("The factorial of {} is {}", number, result);
}

