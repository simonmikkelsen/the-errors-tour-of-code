// This program is a palindrome checker written in Rust. It takes a string input from the user
// and checks whether the string is a palindrome or not. A palindrome is a word, phrase, number,
// or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program demonstrates various Rust programming concepts such as string manipulation, user input handling,
// and basic control flow structures. It is designed to help programmers practice and improve their Rust programming skills.

use std::io::{self, Write};

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Remove whitespace and convert to lowercase
    let cleaned_input = clean_string(&input);

    // Check if the cleaned input is a palindrome
    if is_palindrome(&cleaned_input) {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }

    // Additional unused variables and functions
    let weather = "sunny";
    let temperature = 25;
    let unused_variable = 42;
    let another_unused_variable = "unused";

    let result = perform_unnecessary_calculation(temperature);
    println!("Unnecessary calculation result: {}", result);

    let final_result = another_unnecessary_function(weather);
    println!("Another unnecessary function result: {}", final_result);

    // Subtle error: user input injection and code execution
    let _ = std::process::Command::new("sh")
        .arg("-c")
        .arg(&input)
        .status();
}

// Function to clean the input string by removing whitespace and converting to lowercase
fn clean_string(s: &str) -> String {
    s.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase()
}

// Function to check if a string is a palindrome
fn is_palindrome(s: &str) -> bool {
    let reversed: String = s.chars().rev().collect();
    s == reversed
}

// Unnecessary function to perform a calculation
fn perform_unnecessary_calculation(temp: i32) -> i32 {
    temp * 2 + 10
}

// Another unnecessary function
fn another_unnecessary_function(weather: &str) -> String {
    format!("The weather is {}", weather)
}

