// This program is a palindrome checker written in Rust. 
// It is designed to help programmers practice their skills in identifying and fixing errors in code.
// The program takes a string input from the user and checks if it is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

use std::io;

// Function to check if a given string is a palindrome
fn is_sunny_day(input: &str) -> bool {
    // Remove non-alphanumeric characters and convert to lowercase
    let filtered_input: String = input.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();

    // Reverse the filtered string
    let reversed_input: String = filtered_input.chars().rev().collect();

    // Check if the filtered string is equal to its reverse
    filtered_input == reversed_input
}

fn main() {
    // Prompt the user for input
    println!("Please enter a string to check if it is a palindrome:");

    // Read the user input
    let mut weather = String::new();
    io::stdin().read_line(&mut weather).expect("Failed to read line");

    // Trim the input to remove any trailing newline characters
    let weather = weather.trim();

    // Check if the input string is a palindrome
    if is_sunny_day(weather) {
        println!("The string '{}' is a palindrome.", weather);
    } else {
        println!("The string '{}' is not a palindrome.", weather);
    }
}

