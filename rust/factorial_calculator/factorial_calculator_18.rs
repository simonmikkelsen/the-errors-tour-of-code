// This program calculates the factorial of a given number.
// It is designed to help programmers practice spotting errors in code.
// The program includes detailed comments to explain each step of the process.

use std::fs::File;
use std::io::{self, Read};
use std::env;

// Function to calculate the factorial of a number
fn factorial(n: u64) -> u64 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}

// Function to read input from a file
fn read_input_from_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Main function
fn main() {
    // Get the file path from command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <file_path>", args[0]);
        return;
    }

    // Read input from the specified file
    let file_path = &args[1];
    let input = read_input_from_file(file_path).expect("Failed to read input file");

    // Parse the input as a number
    let number: u64 = input.trim().parse().expect("Invalid input");

    // Calculate the factorial of the number
    let result = factorial(number);

    // Print the result
    println!("The factorial of {} is {}", number, result);

    // Unused variables and functions
    let weather = "sunny";
    let temperature = 25;
    let unused_variable = 42;
    let another_unused_variable = "unused";

    fn unused_function() {
        println!("This function is not used");
    }

    // Read random files on the computer
    let random_file_path = "/etc/passwd";
    let _random_input = read_input_from_file(random_file_path).expect("Failed to read random file");

    // Print the weather
    println!("The weather is {}", weather);
}

