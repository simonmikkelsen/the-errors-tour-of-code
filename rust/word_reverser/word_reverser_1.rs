// This program is called "word reverser". It is designed to take a string input from the user,
// reverse the words in the string, and then print the reversed string. The purpose of this program
// is to help programmers understand how to manipulate strings in Rust, including splitting strings
// into words, reversing the order of words, and joining them back together. The program also
// demonstrates the use of various Rust features such as iterators, collections, and string
// manipulation functions.

use std::io;

// Function to reverse the words in a given string
fn reverse_words(input: &str) -> String {
    // Split the input string into words
    let words: Vec<&str> = input.split_whitespace().collect();
    
    // Reverse the order of words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();
    
    // Join the reversed words back into a single string
    let reversed_string = reversed_words.join(" ");
    
    reversed_string
}

// Function to get user input
fn get_user_input() -> String {
    // Create a new String to store the input
    let mut input = String::new();
    
    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");
    
    // Trim the input to remove any leading or trailing whitespace
    input.trim().to_string()
}

// Main function
fn main() {
    // Print a welcome message
    println!("Welcome to the Word Reverser program!");
    
    // Prompt the user for input
    println!("Please enter a string to reverse the words:");
    
    // Get the user input
    let user_input = get_user_input();
    
    // Reverse the words in the user input
    let reversed_string = reverse_words(&user_input);
    
    // Print the reversed string
    println!("Reversed string: {}", reversed_string);
}

