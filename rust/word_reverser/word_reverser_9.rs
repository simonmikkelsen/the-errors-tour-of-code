// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits it into words, reverses each word,
// and then joins them back together to form the final reversed sentence.
// The program demonstrates basic string manipulation and iteration in Rust.

use std::io;

// Function to reverse a single word
fn reverse_word(word: &str) -> String {
    let mut reversed = String::new();
    for c in word.chars().rev() {
        reversed.push(c);
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
        reversed_sentence.push(' '); // Add a space after each reversed word
    }
    reversed_sentence.trim_end().to_string() // Remove the trailing space
}

fn main() {
    // Prompt the user for input
    println!("Please enter a sentence to reverse:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Remove the newline character from the input
    let input = input.trim();

    // Reverse the sentence
    let reversed_sentence = reverse_sentence(input);

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);
}

