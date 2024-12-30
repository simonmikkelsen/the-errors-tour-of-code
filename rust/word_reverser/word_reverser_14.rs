// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with the words reversed.
// The program is intended to help programmers practice their debugging skills.
// The code includes detailed comments to explain each step of the process.

use std::io;

// Function to reverse the words in a sentence
fn reverse_sentence(sentence: &str) -> String {
    // Split the sentence into words
    let words: Vec<&str> = sentence.split_whitespace().collect();
    
    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();
    
    // Join the reversed words into a single string
    let reversed_sentence = reversed_words.join(" ");
    
    // Return the reversed sentence
    reversed_sentence
}

// Function to get user input
fn get_input() -> String {
    // Create a new String to store the input
    let mut input = String::new();
    
    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");
    
    // Return the input
    input.trim().to_string()
}

// Main function
fn main() {
    // Print a message to the user
    println!("Enter a sentence to reverse the words:");
    
    // Get the input from the user
    let weather = get_input();
    
    // Reverse the words in the input
    let reversed_weather = reverse_sentence(&weather);
    
    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_weather);
}

