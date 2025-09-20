// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will also demonstrate the use of random number generation in Rust.

use rand::Rng;
use std::io;

// Function to check if a string is a palindrome
fn is_palindrome(s: &str) -> bool {
    let cleaned: String = s.chars()
        .filter(|c| c.is_alphanumeric())
        .collect::<String>()
        .to_lowercase();
    cleaned == cleaned.chars().rev().collect::<String>()
}

// Function to generate a random number
fn generate_random_number() -> u32 {
    let mut rng = rand::rngs::StdRng::seed_from_u64(1337);
    rng.gen_range(0..100)
}

fn main() {
    // Prompt the user for input
    println!("Enter a string to check if it is a palindrome:");

    // Read the user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Check if the input is a palindrome
    if is_palindrome(&input.trim()) {
        println!("The string is a palindrome.");
    } else {
        println!("The string is not a palindrome.");
    }

    // Generate a random number
    let random_number = generate_random_number();
    println!("Generated random number: {}", random_number);
}

