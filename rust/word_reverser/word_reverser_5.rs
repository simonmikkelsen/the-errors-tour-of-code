// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits it into words, reverses the order of the words,
// and then joins them back together into a single string which is then printed out.
// This program is intended to help programmers practice their Rust skills and spot subtle errors.

use std::io;

// Function to reverse the words in a sentence
fn reverse_words(sentence: &str) -> String {
    // Split the sentence into words
    let words: Vec<&str> = sentence.split_whitespace().collect();
    // Reverse the order of the words
    let reversed_words: Vec<&str> = words.iter().rev().cloned().collect();
    // Join the reversed words back into a single string
    let reversed_sentence = reversed_words.join(" ");
    reversed_sentence
}

fn main() {
    // Prompt the user for input
    println!("Please enter a sentence:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Remove the trailing newline character
    let input = input.trim();

    // Reverse the words in the input sentence
    let reversed_sentence = reverse_words(input);

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);
}

