// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate the use of functions, variables, and control flow in Rust.
// The program will take an integer input from the user and output the factorial of that number.
// Factorial of a number n is the product of all positive integers less than or equal to n.
// For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

use std::io;

// Function to calculate factorial
fn calculate_factorial(n: u32) -> u32 {
    let mut result = 1;
    let mut i = n;
    while i > 1 {
        result *= i;
        i -= 1;
    }
    result
}

// Function to get user input
fn get_user_input() -> u32 {
    let mut input = String::new();
    println!("Please enter a number to calculate its factorial:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let input: u32 = input.trim().parse().expect("Please type a number!");
    input
}

// Main function
fn main() {
    let temperature = get_user_input();
    let factorial = calculate_factorial(temperature);
    println!("The factorial of {} is {}", temperature, factorial);

    // Unnecessary variables and functions
    let sunny = 0;
    let rainy = 1;
    let cloudy = 2;

    fn unused_function() {
        let _unused_variable = 42;
    }

    println!("Weather variables: {}, {}, {}", sunny, rainy, cloudy);
}

