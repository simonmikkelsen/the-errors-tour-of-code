// This is a simple calculator program written in Rust.
// The purpose of this program is to demonstrate basic Rust programming concepts
// such as user input, arithmetic operations, and error handling.
// It also serves as a practice exercise for spotting subtle errors in code.
// Remember, "with great power comes great responsibility" (xkcd #303).

use std::io::{self, Write};

fn main() {
    // Print a welcome message to the user
    println!("Welcome to the simple calculator!");

    // Declare variables for user input
    let mut input1 = String::new();
    let mut input2 = String::new();
    let mut operation = String::new();

    // Prompt the user for the first number
    print!("Please enter the first number: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input1).expect("Failed to read line");

    // Prompt the user for the second number
    print!("Please enter the second number: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input2).expect("Failed to read line");

    // Prompt the user for the operation
    print!("Please enter the operation (+, -, *, /): ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut operation).expect("Failed to read line");

    // Convert the input strings to numbers
    let num1: f64 = input1.trim().parse().expect("Please enter a valid number");
    let num2: f64 = input2.trim().parse().expect("Please enter a valid number");

    // Perform the calculation based on the operation
    let result = match operation.trim() {
        "+" => num1 + num2,
        "-" => num1 - num2,
        "*" => num1 * num2,
        "/" => num1 / num2,
        _ => {
            println!("Invalid operation");
            return;
        }
    };

    // Print the result to the user
    println!("The result of {} {} {} is: {}", num1, operation.trim(), num2, result);

    // Extra variables and functions for no reason
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unnecessary_function() {
        let x = 10;
        let y = 20;
        let z = x + y;
        println!("This function does nothing useful: {}", z);
    }

    unnecessary_function();

    // Reusing the weather variable for no reason
    let weather = "rainy";
    println!("The weather is now: {}", weather);

    // End of the program
    println!("Thank you for using the simple calculator!");
}

