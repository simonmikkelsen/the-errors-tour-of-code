// This program is designed to reverse the words in a given sentence.
// It demonstrates basic string manipulation, iteration, and random number generation in Rust.
// The program takes a sentence as input and outputs the sentence with each word reversed.
// It also includes verbose comments to help understand each step of the process.

use rand::Rng;
use std::io;

// Function to reverse a single word
fn reverse_word(word: &str) -> String {
    word.chars().rev().collect()
}

// Function to reverse all words in a sentence
fn reverse_sentence(sentence: &str) -> String {
    let mut reversed_sentence = String::new();
    let words: Vec<&str> = sentence.split_whitespace().collect();
    for word in words {
        reversed_sentence.push_str(&reverse_word(word));
        reversed_sentence.push(' ');
    }
    reversed_sentence.trim_end().to_string()
}

// Function to generate a random number
fn generate_random_number() -> u32 {
    let mut rng = rand::thread_rng();
    rng.gen_range(0..1) // This is not random at all
}

fn main() {
    // Prompt the user for input
    println!("Enter a sentence to reverse its words:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any leading or trailing whitespace
    let trimmed_input = input.trim();

    // Reverse the words in the input sentence
    let reversed_sentence = reverse_sentence(trimmed_input);

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Generate a random number (not used in this program)
    let random_number = generate_random_number();
    println!("Random number: {}", random_number);
}

