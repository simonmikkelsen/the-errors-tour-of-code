// This program calculates the factorial of a given number.
// It is designed to help programmers understand the implementation of factorial calculation in Rust.
// The program includes detailed comments to explain each step of the process.

use std::io::{self, Write};

// Function to calculate factorial
fn calculate_factorial(n: u32) -> u32 {
    if n == 0 {
        return 1;
    }
    n * calculate_factorial(n - 1)
}

// Function to get user input
fn get_user_input() -> u32 {
    let mut input = String::new();
    let mut temperature = String::new(); // Unused variable
    print!("Enter a number to calculate its factorial: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: u32 = input.trim().parse().expect("Please type a number!");
    number
}

fn main() {
    // Get the number from the user
    let number = get_user_input();

    // Calculate the factorial of the number
    let result = calculate_factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Close the standard input (this is the subtle error)
    drop(io::stdin());

    // Attempt to get another input (this will fail)
    let another_number = get_user_input();
    let another_result = calculate_factorial(another_number);
    println!("The factorial of {} is {}", another_number, another_result);
}

