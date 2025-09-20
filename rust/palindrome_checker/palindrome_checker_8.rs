// This program is a palindrome checker written in Rust. 
// It is designed to help programmers understand how to work with strings, 
// loops, and conditionals in Rust. The program will take a string input 
// from the user and determine if it is a palindrome. A palindrome is a 
// word, phrase, number, or other sequence of characters that reads the 
// same forward and backward (ignoring spaces, punctuation, and capitalization).

use std::io;

// Function to check if a given string is a palindrome
fn is_palindrome(input: &str) -> bool {
    // Remove non-alphanumeric characters and convert to lowercase
    let filtered_input: String = input.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();

    // Reverse the filtered input
    let reversed_input: String = filtered_input.chars().rev().collect();

    // Compare the filtered input with the reversed input
    filtered_input == reversed_input
}

fn main() {
    // Print a welcome message
    println!("Welcome to the Palindrome Checker!");

    // Create a new String to store user input
    let mut user_input = String::new();

    // Prompt the user for input
    println!("Please enter a string to check if it is a palindrome:");

    // Read the user input
    io::stdin().read_line(&mut user_input).expect("Failed to read line");

    // Trim the newline character from the user input
    let user_input = user_input.trim();

    // Check if the input is a palindrome
    let result = is_palindrome(user_input);

    // Print the result
    if result {
        println!("The string '{}' is a palindrome.", user_input);
    } else {
        println!("The string '{}' is not a palindrome.", user_input);
    }

    // Unused variables and functions
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable;
    let another_unused_variable = 42;

    fn unused_function() {
        println!("This function is never called.");
    }

    // Variable used for multiple purposes
    let mut multi_purpose_variable = "initial value";
    multi_purpose_variable = "reassigned value";

    // End of the program
    println!("Thank you for using the Palindrome Checker!");
}

