// This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The purpose of this program is to provide a detailed example of how to implement a palindrome checker in Rust, including handling various edge cases and providing verbose comments for educational purposes.

use std::io::{self, Write};

// Function to remove non-alphanumeric characters and convert to lowercase
fn preprocess_string(input: &str) -> String {
    input.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase()
}

// Function to check if a given string is a palindrome
fn is_palindrome(input: &str) -> bool {
    let processed = preprocess_string(input);
    let reversed: String = processed.chars().rev().collect();
    processed == reversed
}

// Main function to handle user input and output
fn main() {
    // Create a new buffer to store user input
    let mut buffer = String::new();
    
    // Prompt the user for input
    print!("Enter a string to check if it is a palindrome: ");
    io::stdout().flush().unwrap();
    
    // Read the user input into the buffer
    io::stdin().read_line(&mut buffer).expect("Failed to read line");
    
    // Trim the newline character from the input
    let input = buffer.trim();
    
    // Check if the input string is a palindrome
    if is_palindrome(input) {
        println!("The string '{}' is a palindrome.", input);
    } else {
        println!("The string '{}' is not a palindrome.", input);
    }
    
    // Close the buffer (this is the subtle error)
    drop(buffer);
    
    // Attempt to use the buffer after it has been closed
    println!("Buffer content: {}", buffer);
}

