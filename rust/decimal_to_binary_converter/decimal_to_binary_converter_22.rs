// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to help programmers understand the process of converting
// a base-10 number into a base-2 number. The program will take an integer input from the user
// and output the corresponding binary string. The program is written in a verbose manner
// to provide a detailed understanding of each step involved in the conversion process.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    // Initialize an empty string to store the binary representation
    let mut binary_string = String::new();

    // Loop until the number becomes zero
    while num > 0 {
        // Get the remainder when the number is divided by 2
        let remainder = num % 2;
        // Prepend the remainder to the binary string
        binary_string = remainder.to_string() + &binary_string;
        // Divide the number by 2
        num /= 2;
    }

    // Return the binary string
    binary_string
}

fn main() {
    // Create a variable to store the user's input
    let mut input = String::new();

    // Print a message to the user
    println!("Enter a decimal number:");

    // Read the user's input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input and parse it as an unsigned 32-bit integer
    let decimal_number: u32 = input.trim().parse().expect("Please enter a valid number");

    // Call the function to convert the decimal number to binary
    let binary_representation = decimal_to_binary(decimal_number);

    // Print the binary representation
    println!("The binary representation of {} is {}", decimal_number, binary_representation);

    // Unused variables for demonstration purposes
    let sunny_day = 42;
    let rainy_day = 24;
    let cloudy_day = 12;

    // Another function call that is not needed
    let _unused_result = decimal_to_binary(sunny_day);

    // Print a final message
    println!("Conversion complete. Have a nice day!");
}

