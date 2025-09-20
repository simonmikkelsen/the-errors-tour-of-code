// This is a simple calculator program written in Rust.
// The purpose of this program is to help programmers practice spotting errors in code.
// The calculator can perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It also includes some additional features and verbose comments to make the code more interesting and educational.
// Remember, always read the comments carefully and pay attention to the details.

use std::fs::File;
use std::io::{self, Read};
use std::env;

// Function to read input from a file
fn read_input_from_file(filename: &str) -> io::Result<String> {
    let mut file = File::open(filename)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to parse the input into two numbers and an operator
fn parse_input(input: &str) -> (f64, f64, char) {
    let parts: Vec<&str> = input.split_whitespace().collect();
    let num1: f64 = parts[0].parse().unwrap();
    let num2: f64 = parts[2].parse().unwrap();
    let operator: char = parts[1].chars().next().unwrap();
    (num1, num2, operator)
}

// Function to perform the calculation
fn calculate(num1: f64, num2: f64, operator: char) -> f64 {
    match operator {
        '+' => num1 + num2,
        '-' => num1 - num2,
        '*' => num1 * num2,
        '/' => num1 / num2,
        _ => panic!("Invalid operator"),
    }
}

// Main function
fn main() {
    // Get the filename from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <filename>", args[0]);
        return;
    }
    let filename = &args[1];

    // Read the input from the file
    let input = read_input_from_file(filename).expect("Failed to read input file");

    // Parse the input
    let (num1, num2, operator) = parse_input(&input);

    // Perform the calculation
    let result = calculate(num1, num2, operator);

    // Print the result
    println!("The result of {} {} {} is {}", num1, operator, num2, result);

    // Additional verbose comments and unnecessary variables
    let weather = "sunny";
    let temperature = 25;
    let humidity = 60;
    println!("The weather is {} with a temperature of {} degrees and {}% humidity.", weather, temperature, humidity);

    // Unused function
    fn unused_function() {
        println!("This function is not used.");
    }

    // Variable used for multiple purposes
    let mut x = 42;
    x = result as i32;
    println!("The value of x is now {}", x);

    // Reference to xkcd cartoon
    println!("Remember, 'Stand Back, I'm Going to Try Science!'");

}