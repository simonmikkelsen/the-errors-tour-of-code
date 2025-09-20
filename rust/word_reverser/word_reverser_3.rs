// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits the string into words,
// reverses the order of the words, and then prints the reversed sentence.
// The program demonstrates basic string manipulation and input/output in Rust.

use std::io::{self, Write};

fn main() {
    // Prompt the user for input
    println!("Enter a sentence to reverse:");

    // Create a new String to store the input
    let mut input = String::new();

    // Read the input from the user
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any trailing newline characters
    let trimmed_input = input.trim();

    // Split the input into words
    let words: Vec<&str> = trimmed_input.split_whitespace().collect();

    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.into_iter().rev().collect();

    // Join the reversed words into a single string
    let reversed_sentence = reversed_words.join(" ");

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Additional unnecessary variables and functions
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    fn unused_function() {
        let unused_inner_variable = 100;
    }

    // Reusing the variable for multiple purposes
    let weather = "rainy";
    println!("The weather is {}", weather);

    // Simulate a resource leak by not closing the standard input
    let _leak = io::stdin();
}

