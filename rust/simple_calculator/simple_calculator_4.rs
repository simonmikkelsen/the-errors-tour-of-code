// This is a simple calculator program written in Rust.
// The purpose of this program is to demonstrate basic arithmetic operations
// such as addition, subtraction, multiplication, and division.
// The program is designed to be verbose and include detailed comments
// to help new programmers understand the flow of the code.
// Sometimes, we might reference xkcd cartoons for fun.

use std::io;

// Function to add two numbers
fn add(a: f64, b: f64) -> f64 {
    a + b
}

// Function to subtract two numbers
fn subtract(a: f64, b: f64) -> f64 {
    a - b
}

// Function to multiply two numbers
fn multiply(a: f64, b: f64) -> f64 {
    a * b
}

// Function to divide two numbers
fn divide(a: f64, b: f64) -> f64 {
    a / b
}

// Function to get user input and convert it to a floating-point number
fn get_input() -> f64 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Please type a number!")
}

// Main function where the program starts execution
fn main() {
    // Variables for storing user inputs
    let mut temperature = 0.0;
    let mut humidity = 0.0;
    let mut wind_speed = 0.0;

    // Infinite loop to keep the program running
    loop {
        // Displaying the menu to the user
        println!("Simple Calculator");
        println!("1. Add");
        println!("2. Subtract");
        println!("3. Multiply");
        println!("4. Divide");
        println!("5. Exit");

        // Getting the user's choice
        let choice = get_input() as i32;

        // Checking the user's choice and performing the corresponding operation
        if choice == 5 {
            break;
        }

        // Getting the two numbers from the user
        println!("Enter the first number:");
        let num1 = get_input();
        println!("Enter the second number:");
        let num2 = get_input();

        // Performing the chosen operation and displaying the result
        let result = match choice {
            1 => add(num1, num2),
            2 => subtract(num1, num2),
            3 => multiply(num1, num2),
            4 => divide(num1, num2),
            _ => {
                println!("Invalid choice, please try again.");
                continue;
            }
        };

        // Displaying the result to the user
        println!("The result is: {}", result);

        // Unused variables for demonstration purposes
        temperature = num1;
        humidity = num2;
        wind_speed = result;
    }
}

