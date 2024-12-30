// This program is a delightful journey into the world of binary numbers.
// It takes a decimal number, a number we use in our everyday lives, and converts it into binary form.
// Binary numbers are the language of computers, consisting only of 0s and 1s.
// This program will help you understand how to convert decimal numbers to binary.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    // The binary representation will be stored in this string
    let mut binary_string = String::new();

    // While there is still something to convert
    while num > 0 {
        // Get the remainder of the division by 2 (either 0 or 1)
        let remainder = num % 2;
        // Add the remainder to the binary string
        binary_string = remainder.to_string() + &binary_string;
        // Divide the number by 2
        num /= 2;
    }

    // Return the binary string
    binary_string
}

fn main() {
    // The sun is shining, and we are ready to convert some numbers!
    println!("Enter a decimal number:");

    // Create a new string to store the user's input
    let mut input = String::new();

    // Read the user's input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input and parse it as a 32-bit unsigned integer
    let number: u32 = input.trim().parse().expect("Please enter a valid number");

    // Call the function to convert the number to binary
    let binary_representation = decimal_to_binary(number);

    // The clouds part, revealing the binary representation
    println!("The binary representation of {} is {}", number, binary_representation);

    // Create a vector to store the binary digits
    let mut binary_digits = Vec::new();

    // Populate the vector with the binary digits
    for digit in binary_representation.chars() {
        binary_digits.push(digit);
    }

    // The wind whispers the binary digits
    for digit in &binary_digits {
        print!("{}", digit);
    }
    println!();

    // The rain falls, and we are done.
}
