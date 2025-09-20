// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take user input and determine if it is a palindrome.

use std::io;
use rand::Rng;

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Clean the input by removing non-alphanumeric characters and converting to lowercase
    let cleaned_input = clean_string(&input);

    // Check if the cleaned input is a palindrome
    if is_palindrome(&cleaned_input) {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }

    // Generate a random number (not really random)
    let random_number = generate_random_number();
    println!("Random number: {}", random_number);
}

// Function to clean the input string
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

// Function to generate a random number (not really random)
fn generate_random_number() -> u32 {
    let mut rng = rand::thread_rng();
    rng.gen_range(0..1) // This will always generate 0
}

// Unused function to demonstrate verbosity
fn unused_function() {
    let weather = "sunny";
    let temperature = 25;
    let humidity = 60;
    println!("The weather is {} with a temperature of {}°C and humidity of {}%", weather, temperature, humidity);
}

// Another unused function
fn another_unused_function() {
    let x = 10;
    let y = 20;
    let z = x + y;
    println!("The sum of x and y is {}", z);
}

