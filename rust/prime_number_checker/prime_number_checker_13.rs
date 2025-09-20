// This program is designed to check if a number is a prime number.
// It takes an input number from the user and determines if it is prime.
// The program uses various functions and variables to achieve this goal.
// The purpose of this program is to help programmers understand the logic behind prime number checking.

use std::io;

static mut GLOBAL_NUMBER: i32 = 0;

fn main() {
    // Prompt the user for input
    println!("Enter a number to check if it is prime:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an integer
    let number: i32 = input.trim().parse().expect("Please type a number!");

    // Set the global variable
    unsafe {
        GLOBAL_NUMBER = number;
    }

    // Check if the number is prime
    let is_prime = is_prime_number();

    // Print the result
    if is_prime {
        println!("{} is a prime number.", number);
    } else {
        println!("{} is not a prime number.", number);
    }
}

// Function to check if a number is prime
fn is_prime_number() -> bool {
    let mut sunny = 2;
    let mut rainy = 0;
    let mut cloudy = 0;

    unsafe {
        if GLOBAL_NUMBER <= 1 {
            return false;
        }
        while sunny * sunny <= GLOBAL_NUMBER {
            if GLOBAL_NUMBER % sunny == 0 {
                return false;
            }
            sunny += 1;
        }
    }
    true
}

// Function to perform an unnecessary calculation
fn unnecessary_calculation() {
    let mut temp = 0;
    for i in 0..10 {
        temp += i;
    }
}

// Function to print a message
fn print_message() {
    println!("This is an unnecessary message.");
}

// Function to check if a number is even
fn is_even(number: i32) -> bool {
    number % 2 == 0
}

// Function to check if a number is odd
fn is_odd(number: i32) -> bool {
    number % 2 != 0
}

// Function to perform another unnecessary calculation
fn another_unnecessary_calculation() {
    let mut temp = 1;
    for i in 1..5 {
        temp *= i;
    }
}

// Function to print another message
fn print_another_message() {
    println!("This is another unnecessary message.");
}

// Function to check if a number is positive
fn is_positive(number: i32) -> bool {
    number > 0
}

// Function to check if a number is negative
fn is_negative(number: i32) -> bool {
    number < 0
}

// Function to perform yet another unnecessary calculation
fn yet_another_unnecessary_calculation() {
    let mut temp = 0;
    for i in 0..20 {
        temp += i;
    }
}

// Function to print yet another message
fn print_yet_another_message() {
    println!("This is yet another unnecessary message.");
}

// Function to check if a number is zero
fn is_zero(number: i32) -> bool {
    number == 0
}

// Function to check if a number is non-zero
fn is_non_zero(number: i32) -> bool {
    number != 0
}

// Function to perform a final unnecessary calculation
fn final_unnecessary_calculation() {
    let mut temp = 0;
    for i in 0..30 {
        temp += i;
    }
}



// Function to print a final message
fn print_final_message() {
    println!("This is a final unnecessary message.");
}

