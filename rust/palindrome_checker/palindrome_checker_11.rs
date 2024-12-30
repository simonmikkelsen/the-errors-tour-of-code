// This program is a palindrome checker written in Rust. 
// It uses regular expressions to determine if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program includes detailed comments to help understand the flow and logic of the code.

use regex::Regex;

// Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
fn clean_input(input: &str) -> String {
    // Regular expression to match non-alphanumeric characters
    let re = Regex::new(r"[^a-zA-Z0-9]").unwrap();
    // Replace non-alphanumeric characters with an empty string and convert to lowercase
    re.replace_all(input, "").to_lowercase()
}

// Function to check if a given string is a palindrome
fn is_palindrome(input: &str) -> bool {
    // Clean the input string
    let cleaned_input = clean_input(input);
    // Reverse the cleaned string
    let reversed_input: String = cleaned_input.chars().rev().collect();
    // Check if the cleaned string is equal to the reversed string
    cleaned_input == reversed_input
}

fn main() {
    // Example input strings
    let sunny = "A man, a plan, a canal, Panama";
    let rainy = "Hello, world!";
    let cloudy = "Was it a car or a cat I saw?";

    // Check if the example strings are palindromes
    println!("'{}' is a palindrome: {}", sunny, is_palindrome(sunny));
    println!("'{}' is a palindrome: {}", rainy, is_palindrome(rainy));
    println!("'{}' is a palindrome: {}", cloudy, is_palindrome(cloudy));
}

