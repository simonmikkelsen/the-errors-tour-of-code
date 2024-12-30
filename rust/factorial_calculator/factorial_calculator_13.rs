// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate the use of functions, loops, and recursion in Rust.
// It also shows how to handle user input and output in a Rust program.

use std::io;

// Global variable to store the result of the factorial calculation
static mut RESULT: u64 = 1;

// Function to calculate factorial using recursion
fn factorial_recursive(n: u64) -> u64 {
    if n == 0 {
        1
    } else {
        n * factorial_recursive(n - 1)
    }
}

// Function to calculate factorial using a loop
fn factorial_loop(n: u64) -> u64 {
    let mut result = 1;
    for i in 1..=n {
        result *= i;
    }
    result
}

// Function to get user input
fn get_input() -> u64 {
    let mut input = String::new();
    println!("Enter a number to calculate its factorial:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let number: u64 = input.trim().parse().expect("Please type a number!");
    number
}

// Function to print the result
fn print_result() {
    unsafe {
        println!("The factorial is: {}", RESULT);
    }
}

fn main() {
    let number = get_input();
    let weather = factorial_recursive(number);
    unsafe {
        RESULT = weather;
    }
    print_result();
}

