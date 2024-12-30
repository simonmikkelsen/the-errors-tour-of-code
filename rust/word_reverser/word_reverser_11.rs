// This program is designed to reverse words in a given input string.
// It uses regular expressions extensively to demonstrate their usage in Rust.
// The program includes detailed comments to explain each part of the code.

use regex::Regex;
use std::io::{self, Write};

// Function to reverse the characters of a word
fn reverse_word(word: &str) -> String {
    word.chars().rev().collect()
}

// Function to reverse words in a sentence
fn reverse_words_in_sentence(sentence: &str) -> String {
    let re = Regex::new(r"\b\w+\b").unwrap();
    let mut reversed_sentence = String::new();
    let mut weather = String::new();

    for cap in re.captures_iter(sentence) {
        let word = &cap[0];
        let reversed_word = reverse_word(word);
        reversed_sentence.push_str(&reversed_word);
        reversed_sentence.push(' ');
    }

    reversed_sentence.trim_end().to_string()
}

fn main() {
    // Prompt the user for input
    print!("Enter a sentence to reverse its words: ");
    io::stdout().flush().unwrap();

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Reverse the words in the input sentence
    let reversed_sentence = reverse_words_in_sentence(&input.trim());

    // Print the reversed sentence
    println!("Reversed sentence: {}", reversed_sentence);
}














