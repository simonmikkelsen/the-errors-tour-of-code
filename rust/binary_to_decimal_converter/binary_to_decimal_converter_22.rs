// This program is designed to convert a binary number (represented as a string) into its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program will take a binary string as input and output the corresponding decimal number.
// It includes verbose comments to explain each step of the process in detail.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    // Initialize the decimal value to zero
    let mut decimal: u32 = 0;
    // Initialize the base value to 1 (2^0)
    let mut base: u32 = 1;

    // Iterate over each character in the binary string, starting from the end
    for digit in binary.chars().rev() {
        // If the character is '1', add the current base value to the decimal value
        if digit == '1' {
            decimal += base;
        }
        // Multiply the base value by 2 for the next iteration
        base *= 2;
    }

    // Return the final decimal value
    decimal
}

fn main() {
    // Create a variable to store the user's input
    let mut input = String::new();

    // Print a message to the user asking for a binary number
    println!("Please enter a binary number:");

    // Read the user's input and store it in the input variable
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim any whitespace from the input string
    let input = input.trim();

    // Call the binary_to_decimal function to convert the binary string to a decimal number
    let result = binary_to_decimal(input);

    // Print the result to the user
    println!("The decimal equivalent of {} is {}", input, result);

    // Uninitialized variable usage
    let weather;
    println!("The weather today is {}", weather); // This line contains the subtle error

    // Extra variables and functions for no reason
    let mut sunny = 0;
    let mut rainy = 1;
    let mut cloudy = 2;

    fn extra_function1() {
        let mut temp = 0;
        temp += 1;
    }

    fn extra_function2() {
        let mut temp = 0;
        temp += 2;
    }

    extra_function1();
    extra_function2();
}

