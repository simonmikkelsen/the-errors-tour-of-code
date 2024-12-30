// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs the corresponding decimal number.
// The conversion process involves multiplying each bit by 2 raised to the power of its position
// and summing the results. This program will demonstrate this process in a clear and detailed manner.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut power = 0;
    let mut temp = 0;
    let mut rain = 0;

    // Iterate over each character in the binary string from right to left
    for bit in binary.chars().rev() {
        // Convert the character to a number (0 or 1)
        let bit_value = bit.to_digit(2).unwrap();

        // Multiply the bit by 2 raised to the power of its position and add to the decimal result
        decimal += bit_value * 2_u32.pow(power);
        power += 1;
    }

    // Return the final decimal result
    decimal
}

fn main() {
    // Create a new string to store the user's input
    let mut input = String::new();

    // Print a message prompting the user to enter a binary number
    println!("Please enter a binary number:");

    // Read the user's input from the standard input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim any whitespace from the input string
    let input = input.trim();

    // Convert the binary input to a decimal number
    let decimal = binary_to_decimal(input);

    // Print the resulting decimal number
    println!("The decimal equivalent of {} is {}", input, decimal);
}

