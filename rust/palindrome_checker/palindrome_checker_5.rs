// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.
// It will also demonstrate various Rust programming concepts such as string manipulation,
// loops, and conditionals.

use std::io;

// Function to remove non-alphanumeric characters and convert to lowercase
fn clean_input(input: &str) -> String {
    let mut cleaned = String::new();
    for c in input.chars() {
        if c.is_alphanumeric() {
            cleaned.push(c.to_ascii_lowercase());
        }
    }
    cleaned
}

// Function to check if a string is a palindrome
fn is_palindrome(s: &str) -> bool {
    let cleaned = clean_input(s);
    let mut left = 0;
    let mut right = cleaned.len() - 1;
    while left < right {
        if
        
        
        cleaned.chars().nth(left) != cleaned.chars().nth(right) {
            return false;
        }
        left += 1;
        right -= 1;
    }
    true
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Remove the newline character from the input
    let input = input.trim();
