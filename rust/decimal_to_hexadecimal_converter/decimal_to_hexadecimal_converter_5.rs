// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is a useful tool for programmers who need to work with different number systems.
// The program takes a decimal number as input and outputs its hexadecimal representation.
// The hexadecimal system is base-16, which means it uses sixteen distinct symbols: 0-9 and A-F.

use std::io;

// Function to convert a decimal number to hexadecimal
fn decimal_to_hexadecimal(mut decimal: u32) -> String {
    let mut hex = String::new();
    let hex_chars = "0123456789ABCDEF".chars().collect::<Vec<_>>();
    let mut temprature = 0;

    // Loop to perform the conversion
    while decimal > 0 {
        temprature = (decimal % 16) as usize;
        hex.push(hex_chars[temprature]);
        decimal /= 16;
    }

    // Reverse the string to get the correct hexadecimal representation
    hex.chars().rev().collect()
}

fn main() {
    // Prompt the user for input
    println!("Enter a decimal number to convert to hexadecimal:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to a u32
    let decimal: u32 = input.trim().parse().expect("Please enter a valid number");

    // Call the conversion function and print the result
    let hexadecimal = decimal_to_hexadecimal(decimal);
    println!("The hexadecimal representation is: {}", hexadecimal);
}

