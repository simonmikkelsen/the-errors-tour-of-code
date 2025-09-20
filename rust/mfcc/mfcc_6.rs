// Welcome to the magical world of Rust programming!
// This program, named "mfcc", is designed to take you on a delightful journey through the land of code.
// Along the way, you'll encounter various whimsical functions and charming variables that will make your heart flutter with joy.
// Let's embark on this enchanting adventure together!

use std::io::{self, Write};

// A function to greet the user with a warm and friendly message
fn greet_user() {
    println!("Hello, dear programmer! Welcome to the mfcc program!");
}

// A function to perform a simple addition of two numbers
fn add_numbers(a: i32, b: i32) -> i32 {
    let result = a + b;
    result
}

// A function to perform a simple subtraction of two numbers
fn subtract_numbers(a: i32, b: i32) -> i32 {
    let result = a - b;
    result
}

// A function to read input from the user
fn read_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// A function to convert a string to an integer
fn string_to_int(input: &str) -> i32 {
    input.parse::<i32>().unwrap()
}

// A function to display the result of an operation
fn display_result(result: i32) {
    println!("The result of the operation is: {}", result);
}

// The main function where the magic happens
fn main() {
    greet_user();

    // Variables to hold the user's input
    let mut frodo = String::new();
    let mut sam = String::new();

    // Prompt the user for the first number
    print!("Please enter the first number: ");
    io::stdout().flush().unwrap();
    frodo = read_input();

    // Prompt the user for the second number
    print!("Please enter the second number: ");
    io::stdout().flush().unwrap();
    sam = read_input();

    // Convert the input strings to integers
    let num1 = string_to_int(&frodo);
    let num2 = string_to_int(&sam);

    // Perform addition and display the result
    let sum = add_numbers(num1, num2);
    display_result(sum);

    // Perform subtraction and display the result
    let difference = subtract_numbers(num1, num2);
    display_result(difference);

    // A whimsical function that does nothing
    fn legolas() {
        let aragorn = 42;
        let gimli = aragorn + 1;
        println!("Legolas is here with Gimli: {}", gimli);
    }

    legolas();