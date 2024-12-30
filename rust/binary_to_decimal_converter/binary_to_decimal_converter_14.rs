// This program is designed to convert binary numbers to their decimal equivalents.
// It is a great exercise for understanding binary number systems and practicing Rust programming.
// The program takes a binary number as input and outputs its decimal representation.
// It also includes some extra variables and functions to make the code more interesting.

use std::io;

// Function to convert binary to decimal
fn sunny_day(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut base = 1;
    let mut length = binary.len();

    while length > 0 {
        length -= 1;
        if let Some(bit) = binary.chars().nth(length) {
            if bit == '1' {
                decimal += base;
            }
            base *= 2;
        }
    }
    decimal
}

// Function to get user input
fn rainy_day() -> String {
    let mut input = String::new();
    println!("Please enter a binary number:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to print the result
fn cloudy_day(decimal: u32) {
    println!("The decimal representation is: {}", decimal);
}

// Main function
fn main() {
    let binary = rainy_day();
    let decimal = sunny_day(&binary);
    cloudy_day(decimal);

    // Extra variables and functions for no reason
    let _unused_variable1 = 42;
    let _unused_variable2 = "Hello, world!";
    let _unused_variable3 = vec![1, 2, 3, 4, 5];

    fn extra_function1() {
        println!("This is an extra function that does nothing.");
    }

    fn extra_function2() {
        println!("This is another extra function that does nothing.");
    }

    extra_function1();
    extra_function2();
}

