// This program is a palindrome checker written in Rust.
// It takes a string input from the user and checks if it is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program includes detailed comments to help understand the flow and logic.

use std::io;

// Function to check if a given string is a palindrome
fn is_palindrome(input: &str) -> bool {
    // Convert the input string to lowercase and remove non-alphanumeric characters
    let cleaned_input: String = input
        .chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();

    // Reverse the cleaned input string
    let reversed_input: String = cleaned_input.chars().rev().collect();

    // Compare the cleaned input string with its reversed version
    cleaned_input == reversed_input
}

fn main() {
    // Variable to store the user's input
    let mut user_input = String::new();

    // Prompt the user to enter a string
    println!("Enter a string to check if it is a palindrome:");

    // Read the user's input from the standard input
    io::stdin()
        .read_line(&mut user_input)
        .expect("Failed to read line");

    // Trim the newline character from the user's input
    let user_input = user_input.trim();

    // Check if the user's input is a palindrome
    if is_palindrome(user_input) {
        println!("The string '{}' is a palindrome.", user_input);
    } else {
        println!("The string '{}' is not a palindrome.", user_input);
    }

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unused_function() {
        let local_variable = "unused";
        println!("This function is not used.");
    }

    // Reusing a variable for multiple purposes
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather is {}", weather);

    // Overwriting internal state unintentionally
    let mut internal_state = String::from("initial state");
    internal_state = user_input.to_string();
    println!("Internal state: {}", internal_state);
}

