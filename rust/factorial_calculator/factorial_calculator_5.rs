// This program calculates the factorial of a given number.
// It is designed to help programmers understand the concept of recursion and factorials.
// The program takes an integer input from the user and computes the factorial of that number.
// Factorial of a number n is the product of all positive integers less than or equal to n.
// For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

use std::io;

// This function calculates the factorial of a given number using recursion.
fn calculate_factorial(n: u32) -> u32 {
    if n <= 1 {
        1
    } else {
        n * calculate_factorial(n - 1)
    }
}

// This is the main function where the program execution starts.
fn main() {
    // Declare a variable to store the user input.
    let mut input = String::new();

    // Print a message to the user to enter a number.
    println!("Please enter a number to calculate its factorial:");

    // Read the user input from the standard input.
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input string to an unsigned 32-bit integer.
    let number: u32 = input.trim().parse().expect("Please type a number!");

    // Declare a variable to store the result of the factorial calculation.
    let result = calculate_factorial(number);

    // Print the result to the user.
    println!("The factorial of {} is {}", number, result);
}

