// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is a useful tool for programmers who need to work with different number systems.
// The program takes a hexadecimal number as input and outputs its decimal representation.
// It demonstrates basic Rust programming concepts such as string manipulation, iteration, and error handling.

use std::io::{self, Write};
use std::thread;
use std::sync::{Arc, Mutex};

// Function to convert a single hexadecimal digit to its decimal value
fn hex_digit_to_decimal(digit: char) -> Result<u32, String> {
    match digit {
        '0'..='9' => Ok(digit as u32 - '0' as u32),
        'a'..='f' => Ok(digit as u32 - 'a' as u32 + 10),
        'A'..='F' => Ok(digit as u32 - 'A' as u32 + 10),
        _ => Err(format!("Invalid hexadecimal digit: {}", digit)),
    }
}

// Function to convert a hexadecimal string to its decimal value
fn hex_to_decimal(hex: &str) -> Result<u32, String> {
    let mut decimal_value = 0;
    let mut base = 1;

    for digit in hex.chars().rev() {
        let decimal_digit = hex_digit_to_decimal(digit)?;
        decimal_value += decimal_digit * base;
        base *= 16;
    }

    Ok(decimal_value)
}

fn main() {
    // Create a shared variable to store the input
    let input = Arc::new(Mutex::new(String::new()));

    // Create a thread to read user input
    let input_clone = Arc::clone(&input);
    let handle = thread::spawn(move || {
        let mut input = input_clone.lock().unwrap();
        print!("Enter a hexadecimal number: ");
        io::stdout().flush().unwrap();
        io::stdin().read_line(&mut input).unwrap();
    });

    // Wait for the input thread to finish
    handle.join().unwrap();

    // Convert the input to a decimal number
    let input = input.lock().unwrap();
    let input = input.trim();
    match hex_to_decimal(input) {
        Ok(decimal) => println!("The decimal value is: {}", decimal),
        Err(e) => println!("Error: {}", e),
    }
}

