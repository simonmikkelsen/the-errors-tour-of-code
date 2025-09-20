// This program is a palindrome checker written in Rust. 
// It is designed to help programmers understand how to implement a basic palindrome checker 
// and to practice reading and understanding Rust code. 
// The program will take a string input from the user and check if it is a palindrome. 
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward 
// (ignoring spaces, punctuation, and capitalization).

use std::io;

// Function to check if a given string is a palindrome
fn is_palindrome(input: &str) -> bool {
    // Remove non-alphanumeric characters and convert to lowercase
    let cleaned_input: String = input.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();
    
    // Reverse the cleaned input
    let reversed_input: String = cleaned_input.chars().rev().collect();
    
    // Check if the cleaned input is equal to the reversed input
    cleaned_input == reversed_input
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Remove the newline character from the input
    let input = input.trim();

    // Check if the input is a palindrome
    let result = is_palindrome(input);

    // Print the result
    if result {
        println!("The string '{}' is a palindrome.", input);
    } else {
        println!("The string '{}' is not a palindrome.", input);
    }
}

