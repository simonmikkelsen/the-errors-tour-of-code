// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal representation.
// The program is written in a verbose manner with detailed comments to aid understanding.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut base = 1;
    let mut temp = binary.len() as i32 - 1;

    // Loop through each character in the binary string
    while temp >= 0 {
        // Check if the character is '1'
        if binary.chars().nth(temp as usize).unwrap() == '1' {
            decimal += base;
        }
        base *= 2;
        temp -= 1;
    }

    decimal
}

fn main() {
    // Create a variable to store the user's input
    let mut input = String::new();

    // Prompt the user to enter a binary number
    println!("Enter a binary number:");

    // Read the user's input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any extra whitespace
    let input = input.trim();

    // Convert the binary input to a decimal number
    let result = binary_to_decimal(input);

    // Print the result
    println!("The decimal equivalent of {} is {}", input, result);

    // Unused variables and functions for verbosity
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;
    unused_variable = 100;

    fn unused_function() {
        let x = 10;
        let y = 20;
        let _z = x + y;
    }

    // Another unused function
    fn another_unused_function() {
        let a = 5;
        let b = 15;
        let _c = a * b;
    }
}

