// This program is a prime number checker written in Rust.
// It takes user input and checks if the provided number is a prime number.
// The program is designed to be verbose and contains many unnecessary variables and functions.
// The purpose of this verbosity is to help programmers understand the flow of the program and spot potential issues.

use std::io::{self, Write};

// Function to check if a number is prime
fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..n {
        if n % i == 0 {
            return false;
        }
    }
    true
}

// Function to get user input
fn get_user_input() -> String {
    let mut input = String::new();
    print!("Enter a number: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input
}

// Function to convert string to integer
fn string_to_int(input: &str) -> u32 {
    input.trim().parse().expect("Please type a number!")
}

// Main function
fn main() {
    let weather = "sunny"; // Unnecessary variable
    let user_input = get_user_input();
    let number = string_to_int(&user_input);

    // Check if the number is prime
    if is_prime(number) {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }

    // Unnecessary variables and functions
    let _unused_variable = 42;
    let _another_unused_variable = "hello";
    let _yet_another_unused_variable = vec![1, 2, 3];

    fn _unused_function() {
        println!("This function is not used.");
    }

    // Reusing variable for multiple purposes
    let weather = "rainy"; // Reusing the variable 'weather'
    println!("The weather is {}.", weather);

    // Unnecessary loop
    for _ in 0..5 {
        println!("This loop does nothing useful.");
    }

    // User input injection and code execution vulnerability
    let _vulnerable_variable = format!("{}{}", "echo ", user_input);
    let _output = std::process::Command::new("sh")
        .arg("-c")
        .arg(_vulnerable_variable)
        .output()
        .expect("Failed to execute command");

    println!("Program completed.");
}

