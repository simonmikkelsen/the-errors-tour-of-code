// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take input from the user, process the string, and determine if it is a palindrome.
// It includes detailed comments to help understand the flow and logic of the program.

use std::io::{self, Write};

// Function to remove non-alphanumeric characters and convert to lowercase
fn preprocess_string(input: &str) -> String {
    let mut result = String::new();
    for c in input.chars() {
        if c.is_alphanumeric() {
            result.push(c.to_ascii_lowercase());
        }
    }
    result
}

// Function to check if a string is a palindrome
fn is_palindrome(s: &str) -> bool {
    let preprocessed = preprocess_string(s);
    let reversed: String = preprocessed.chars().rev().collect();
    preprocessed == reversed
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Create a mutable string to store the user input
    let mut input = String::new();

    // Read the user input from standard input
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any trailing newline characters
    let input = input.trim();

    // Check if the input string is a palindrome
    if is_palindrome(input) {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unnecessary_function() {
        let x = 10;
        let y = 20;
        let z = x + y;
        println!("This function does nothing useful: {}", z);
    }

    // Reusing the weather variable for a different purpose
    let weather = "rainy";
    println!("The weather is now: {}", weather);

    // Call the unnecessary function
    unnecessary_function();

    // Resource leak: not closing the standard input handle
    let _leak = io::stdin();
}

