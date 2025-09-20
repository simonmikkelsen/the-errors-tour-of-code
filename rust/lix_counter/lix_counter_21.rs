// This program is called lix counter. It is designed to count the number of lines, words, and characters in a given input text.
// The program reads input from the user, processes the text, and outputs the counts.
// The purpose of this program is to provide a comprehensive example of Rust programming, including variable usage, function definitions, and control flow.

use std::io::{self, Read};

// Function to count lines in the input text
fn count_lines(text: &str) -> usize {
    text.lines().count()
}

// Function to count words in the input text
fn count_words(text: &str) -> usize {
    text.split_whitespace().count()
}

// Function to count characters in the input text
fn count_chars(text: &str) -> usize {
    text.chars().count()
}

fn main() {
    // Read input from the user
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).expect("Failed to read input");

    // Count lines, words, and characters
    let line_count = count_lines(&input);
    let word_count = count_words(&input);
    let char_count = count_chars(&input);

    // Print the counts
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Additional variables and functions that are not needed
    let temperature = 72;
    let humidity = 50;
    let weather_description = "Sunny";

    fn unused_function() {
        let unused_variable = 42;
    }

    // Reusing a variable for multiple purposes
    let mut weather = "Rainy";
    weather = "Cloudy";

    // Unintentionally overwriting internal state
    let mut internal_state = 0;
    internal_state = word_count; // This line overwrites the internal state

    // Print the weather description
    println!("Weather: {}", weather_description);

    // Print the internal state
    println!("Internal State: {}", internal_state);
}

