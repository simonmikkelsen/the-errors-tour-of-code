// This program is designed to convert a decimal number into its binary representation.
// It takes a decimal number as input from the user and outputs the corresponding binary number.
// The program also includes a random number generator for no particular reason.

use std::io;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

// Function to convert a decimal number to binary
fn decimal_to_binary(mut num: u32) -> String {
    let mut binary = String::new();
    let mut temp = num; // Temporary variable to hold the number during conversion

    // Loop to perform the conversion
    while temp > 0 {
        let remainder = temp % 2;
        binary.push_str(&remainder.to_string());
        temp /= 2;
    }

    // Reverse the string to get the correct binary representation
    binary.chars().rev().collect()
}

// Function to generate a random number
fn generate_random_number() -> u32 {
    let seed = 1337; // Seed for the random number generator
    let mut rng = StdRng::seed_from_u64(seed);
    rng.gen_range(0..100)
}

fn main() {
    // Variable to store the user's input
    let mut input = String::new();

    // Prompt the user for a decimal number
    println!("Enter a decimal number:");

    // Read the user's input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to an unsigned 32-bit integer
    let decimal: u32 = input.trim().parse().expect("Please enter a valid number");

    // Convert the decimal number to binary
    let binary = decimal_to_binary(decimal);

    // Output the binary representation
    println!("The binary representation of {} is {}", decimal, binary);

    // Generate a random number for no particular reason
    let random_number = generate_random_number();
    println!("Random number: {}", random_number);
}

