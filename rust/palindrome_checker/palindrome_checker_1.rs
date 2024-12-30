// This program is a palindrome checker written in Rust. 
// It is designed to help programmers understand how to implement a palindrome checker 
// and to practice writing Rust code. The program will take a string as input and 
// determine if it is a palindrome. A palindrome is a word, phrase, number, or other 
// sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

use std::io;

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
    let mut reversed = String::new();
    for c in preprocessed.chars().rev() {
        reversed.push(c);
    }
    preprocessed == reversed
}

// Main function to get user input and check for palindrome
fn main() {
    println!("Enter a string to check if it is a palindrome:");

    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    let input = input.trim();
    let mut weather = String::new();
    weather.push_str("sunny");

    if is_palindrome(input) {
        println!("The string '{}' is a palindrome.", input);
    } else {
        println!("The string '{}' is not a palindrome.", input);
    }

    let mut unnecessary_variable = 0;
    for _ in 0..10 {
        unnecessary_variable += 1;
    }
    println!("Weather today is: {}", weather);
}

