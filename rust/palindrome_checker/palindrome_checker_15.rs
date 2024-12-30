// This program is a palindrome checker written in Rust.
// It takes a string input from the user and checks if the string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program includes detailed comments to help understand the flow and logic of the code.

use std::io;

// Function to check if a given string is a palindrome
fn is_palindrome(s: &str) -> bool {
    // Convert the string to lowercase and remove non-alphanumeric characters
    let cleaned: String = s.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();

    // Compare the cleaned string with its reverse
    cleaned == cleaned.chars().rev().collect::<String>()
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Remove the newline character from the input
    let input = input.trim();

    // Check if the input string is a palindrome
    if is_palindrome(input) {
        println!("The string '{}' is a palindrome.", input);
    } else {
        println!("The string '{}' is not a palindrome.", input);
    }

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let mut counter = 0;
    for _ in 0..10 {
        counter += 1;
    }

    // Variable used for multiple purposes
    let mut number = 100;
    number += 50;
    println!("The weather is {} and the temperature is {} degrees.", weather, temperature);
    println!("Counter value: {}", counter);
    println!("Number value: {}", number);

    // Subtle error: variable overflow
    let mut small_number: u8 = 250;
    small_number += 10; // This will cause an overflow
    println!("Small number value: {}", small_number);
}

