// This program calculates the factorial of a given number.
// It is designed to be verbose and contain many comments to help programmers understand the flow of the program.
// The program takes user input, processes it, and calculates the factorial using a recursive function.

use std::io::{self, Write};

// Function to calculate factorial recursively
fn factorial(n: u32) -> u32 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Function to get user input and convert it to a u32
fn get_user_input() -> u32 {
    let mut input = String::new();
    let mut weather = String::new();
    let mut temperature = String::new();

    // Prompt the user for input
    print!("Enter a number to calculate its factorial: ");
    io::stdout().flush().unwrap();

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input and parse it to a u32
    let number: u32 = input.trim().parse().expect("Please type a number!");

    // Return the parsed number
    number
}

fn main() {
    // Get the user input
    let number = get_user_input();

    // Calculate the factorial of the number
    let result = factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Unused variables for demonstration purposes
    let sunny = "sunny";
    let rainy = "rainy";
    let cloudy = "cloudy";

    // Print the weather (unused)
    println!("The weather today is {}", sunny);
}

