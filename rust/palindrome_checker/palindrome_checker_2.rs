// This program is a palindrome checker written in Rust. 
// It takes a string input from the user and checks if the string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program includes detailed comments to help understand the logic and flow of the code.

use std::io;

// Function to check if a given string is a palindrome
fn is_palindrome(s: &str) -> bool {
    // Remove non-alphanumeric characters and convert to lowercase
    let filtered: String = s.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();

    // Reverse the filtered string
    let reversed: String = filtered.chars().rev().collect();

    // Compare the filtered string with its reverse
    filtered == reversed
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    println!("Enter a string to check if it is a palindrome:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

fn main() {
    // Get user input
    let user_input = get_input();

    // Check if the input is a palindrome
    if is_palindrome(&user_input) {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }

    // Unnecessary variables and functions
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = String::new();
    unused_variable.push_str("This is not used");

    // Memory leak implementation
    let _leak = Box::new(user_input); // This line causes a memory leak
}

