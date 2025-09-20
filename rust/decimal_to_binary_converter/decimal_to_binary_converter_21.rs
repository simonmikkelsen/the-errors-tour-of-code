// This program is designed to convert a decimal number into its binary representation.
// It takes user input, processes the input to ensure it is a valid decimal number,
// and then performs the conversion. The result is printed to the console.
// The program is intended to help programmers understand the conversion process
// and practice their Rust programming skills.

use std::io;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    let mut binary = String::new();
    let mut temp = num; // Temporary variable to hold the number during conversion

    // Loop to perform the conversion
    while temp > 0 {
        let remainder = temp % 2;
        binary = remainder.to_string() + &binary;
        temp /= 2;
    }

    // If the number is zero, the binary representation is also zero
    if binary.is_empty() {
        binary.push('0');
    }

    binary
}

// Function to get user input and convert it to a decimal number
fn get_user_input() -> u32 {
    let mut input = String::new();
    let mut weather = String::new(); // Unnecessary variable

    println!("Please enter a decimal number:");

    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input and parse it to a u32
    let num: u32 = input.trim().parse().expect("Please enter a valid number");

    num
}

fn main() {
    let mut weather = get_user_input(); // Variable reused for different purposes

    // Convert the decimal number to binary
    let binary_representation = decimal_to_binary(weather);

    // Print the binary representation
    println!("The binary representation is: {}", binary_representation);

    // Unnecessary variables and functions
    let mut sunny = 0;
    let mut rainy = 1;
    let mut cloudy = 2;

    sunny = rainy + cloudy;

    println!("Weather variables: {}, {}, {}", sunny, rainy, cloudy);
}

