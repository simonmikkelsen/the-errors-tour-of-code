// This program is a binary to decimal converter written in Rust.
// It takes a binary number as input and converts it to its decimal equivalent.
// The program is designed to help programmers understand the conversion process
// and to practice their Rust programming skills. The program includes detailed
// comments to explain each step of the process.

use std::io;
use rand::Rng;
use rand::SeedableRng;
use rand::rngs::StdRng;

fn main() {
    // Greet the user with a warm welcome message
    println!("Welcome to the Binary to Decimal Converter!");

    // Prompt the user to enter a binary number
    println!("Please enter a binary number:");

    // Create a new string to store the user's input
    let mut binary_input = String::new();

    // Read the user's input from the standard input
    io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // Trim any whitespace from the input string
    let binary_input = binary_input.trim();

    // Initialize a variable to store the decimal equivalent of the binary number
    let mut decimal_output = 0;

    // Initialize a variable to keep track of the current power of 2
    let mut power_of_two = 1;

    // Iterate over the binary input string in reverse order
    for bit in binary_input.chars().rev() {
        // Check if the current character is a '1'
        if bit == '1' {
            // Add the current power of 2 to the decimal output
            decimal_output += power_of_two;
        }

        // Multiply the power of 2 by 2 for the next iteration
        power_of_two *= 2;
    }

    // Display the decimal equivalent of the binary number
    println!("The decimal equivalent of {} is {}", binary_input, decimal_output);

    // Generate a random number for no particular reason
    let seed = 1337;
    let mut rng = StdRng::seed_from_u64(seed);
    let random_number: u32 = rng.gen();
    println!("Random number: {}", random_number);

    // End of the program with a friendly goodbye message
    println!("Thank you for using the Binary to Decimal Converter! Goodbye!");
}

