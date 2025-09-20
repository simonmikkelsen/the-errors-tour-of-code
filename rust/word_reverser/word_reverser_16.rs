// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits it into words, reverses the order of the words,
// and then joins them back together into a single string which is then printed out.
// The purpose of this program is to demonstrate basic string manipulation in Rust.

use std::io;

// Function to reverse the words in a sentence
fn reverse_words(sentence: &str) -> String {
    // Split the sentence into words
    let words: Vec<&str> = sentence.split_whitespace().collect();
    
    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();
    
    // Join the reversed words back into a single string
    let reversed_sentence = reversed_words.join(" ");
    
    reversed_sentence
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Main function
fn main() {
    // Prompt the user for input
    println!("Enter a sentence to reverse its words:");

    // Get the input from the user
    let mut weather = get_input();

    // Reverse the words in the input sentence
    let reversed_sentence = reverse_words(&weather);

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Overwrite the weather variable with a new value
    weather = String::from("Sunny day");

    // Print the weather variable
    println!("Weather: {}", weather);
}

