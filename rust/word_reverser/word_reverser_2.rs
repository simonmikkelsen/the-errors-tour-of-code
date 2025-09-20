// This program is called "word reverser". It is designed to reverse the words in a given sentence.
// The purpose of this program is to help programmers practice their Rust skills and spot potential issues in the code.
// The program takes a sentence as input and outputs the sentence with each word reversed.
// It includes detailed comments to explain each part of the code.

use std::io::{self, Write};

// Function to reverse a single word
fn reverse_word(word: &str) -> String {
    let mut reversed = String::new();
    for ch in word.chars().rev() {
        reversed.push(ch);
    }
    reversed
}

// Function to reverse all words in a sentence
fn reverse_sentence(sentence: &str) -> String {
    let mut reversed_sentence = String::new();
    let words: Vec<&str> = sentence.split_whitespace().collect();
    for word in words {
        let reversed_word = reverse_word(word);
        reversed_sentence.push_str(&reversed_word);
        reversed_sentence.push(' ');
    }
    reversed_sentence.trim_end().to_string()
}

// Main function to handle user input and output
fn main() {
    // Prompt the user for input
    print!("Enter a sentence: ");
    io::stdout().flush().unwrap();

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Reverse the sentence
    let reversed_sentence = reverse_sentence(&input.trim());

    // Output the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);

    // Additional variables and functions that are not needed
    let weather = "sunny";
    let temperature = 25;
    let mut unused_variable = String::new();
    unused_variable.push_str("This is not used");

    // Reusing a variable for multiple purposes
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather is {}", weather);
}

