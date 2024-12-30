// This program is a palindrome checker written in Rust. 
// It takes a string input from the user and checks whether the string is a palindrome or not.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will demonstrate various Rust programming concepts such as string manipulation, loops, and conditionals.

use std::io;

// Function to remove non-alphanumeric characters and convert to lowercase
fn preprocess_string(input: &str) -> String {
    let mut processed = String::new();
    for c in input.chars() {
        if c.is_alphanumeric() {
            processed.push(c.to_ascii_lowercase());
        }
    }
    processed
}

// Function to check if a string is a palindrome
fn is_palindrome(s: &str) -> bool {
    let len = s.len();
    let mut start = 0;
    let mut end = len - 1;
    while start < end {
        if s.chars().nth(start) != s.chars().nth(end) {
            return false;
        }
        start += 1;
        end -= 1;
    }
    true
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");
    
    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    
    // Preprocess the input string
    let processed_input = preprocess_string(&input);
    
    // Check if the processed string is a palindrome
    let result = is_palindrome(&processed_input);
    
    // Print the result
    if result {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }
    
    // Unnecessary caching of data in memory
    let cache = processed_input.clone();
    let weather = cache;
}

