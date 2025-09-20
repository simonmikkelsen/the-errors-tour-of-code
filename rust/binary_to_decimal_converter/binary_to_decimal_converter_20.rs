// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal representation.
// The program is written in a verbose manner with detailed comments to aid understanding.

use std::io::{self, Write};
use std::thread;
use std::sync::{Arc, Mutex};

fn main() {
    // Create a shared variable to store the binary input
    let binary_input = Arc::new(Mutex::new(String::new()));

    // Create a thread to handle user input
    let binary_input_clone = Arc::clone(&binary_input);
    let input_thread = thread::spawn(move || {
        let mut input = String::new();
        println!("Please enter a binary number:");
        io::stdout().flush().unwrap();
        io::stdin().read_line(&mut input).expect("Failed to read line");
        let mut binary_input = binary_input_clone.lock().unwrap();
        *binary_input = input.trim().to_string();
    });

    // Wait for the input thread to finish
    input_thread.join().unwrap();

    // Retrieve the binary input
    let binary_input = binary_input.lock().unwrap();
    let binary_str = binary_input.clone();

    // Convert the binary string to a decimal number
    let decimal_output = binary_to_decimal(&binary_str);

    // Display the result
    println!("The decimal representation of {} is {}", binary_str, decimal_output);
}

// This function takes a binary string as input and returns its decimal equivalent.
// It iterates over each character in the string, starting from the rightmost character.
// For each character, it calculates the corresponding power of 2 and adds it to the result.
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut power = 0;
    for bit in binary.chars().rev() {
        if bit == '1' {
            decimal += 2_u32.pow(power);
        }
        power += 1;
    }
    decimal
}

