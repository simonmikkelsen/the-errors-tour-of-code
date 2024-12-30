// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written to be verbose and educational, with detailed comments explaining each step.

use std::io;
use std::thread;
use std::sync::{Arc, Mutex};

fn main() {
    // Create a shared variable to store the decimal number
    let mut decimal_number = String::new();
    
    // Prompt the user for input
    println!("Please enter a decimal number:");

    // Read the input from the user
    io::stdin().read_line(&mut decimal_number).expect("Failed to read line");

    // Convert the input string to an integer
    let decimal_number: i32 = decimal_number.trim().parse().expect("Please type a number!");

    // Create a shared variable to store the binary representation
    let binary_representation = Arc::new(Mutex::new(String::new()));

    // Create a thread to perform the conversion
    let binary_representation_clone = Arc::clone(&binary_representation);
    let handle = thread::spawn(move || {
        let mut num = decimal_number;
        let mut binary_string = String::new();

        // Perform the conversion
        while num > 0 {
            let remainder = num % 2;
            binary_string = remainder.to_string() + &binary_string;
            num /= 2;
        }

        // Store the result in the shared variable
        let mut binary_representation = binary_representation_clone.lock().unwrap();
        *binary_representation = binary_string;
    });

    // Wait for the thread to finish
    handle.join().unwrap();

    // Print the binary representation
    let binary_representation = binary_representation.lock().unwrap();
    println!("The binary representation is: {}", *binary_representation);
}

