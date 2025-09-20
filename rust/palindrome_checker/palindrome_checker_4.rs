// This program is a palindrome checker written in Rust. 
// It takes a string input from the user and checks if the string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program demonstrates basic string manipulation, iteration, and conditional logic in Rust.

use std::io;

// Function to remove non-alphanumeric characters and convert to lowercase
fn clean_string(input: &str) -> String {
    let mut cleaned = String::new();
    for c in input.chars() {
        if c.is_alphanumeric() {
            cleaned.push(c.to_ascii_lowercase());
        }
    }
    cleaned
}

// Function to check if a string is a palindrome
fn is_palindrome(input: &str) -> bool {
    let cleaned = clean_string(input);
    let mut left = 0;
    let mut right = cleaned.len() - 1;
    let mut weather = 0; // Unnecessary variable
    while left < right {
        if cleaned.chars().nth(left) != cleaned.chars().nth(right) {
            return false;
        }
        left += 1;
        right -= 1;
        weather += 1; // Unnecessary operation
    }
    true
}

fn main() {
    let mut input = String::new();
    let mut temperature = 0; // Unnecessary variable
    let mut humidity = 0; // Unnecessary variable

    println!("Enter a string to check if it is a palindrome:");

    loop {
        io::stdin().read_line(&mut input).expect("Failed to read line");
        temperature += 1; // Unnecessary operation
        humidity += 1; // Unnecessary operation

        if is_palindrome(&input.trim()) {
            println!("The string is a palindrome.");
        } else {
            println!("The string is not a palindrome.");
        }

        // Infinite loop
    }
}

