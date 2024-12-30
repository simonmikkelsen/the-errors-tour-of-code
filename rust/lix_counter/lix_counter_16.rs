// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text input.
// The program reads input from the user, processes the text, and outputs the counts for lines, words, and characters.
// It demonstrates basic text processing in Rust, including reading input, splitting strings, and iterating over collections.

use std::io::{self, Read};

// Function to count lines in the given text
fn count_lines(text: &str) -> usize {
    text.lines().count()
}

// Function to count words in the given text
fn count_words(text: &str) -> usize {
    text.split_whitespace().count()
}

// Function to count characters in the given text
fn count_characters(text: &str) -> usize {
    text.chars().count()
}

fn main() {
    // Read input from the user
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).expect("Failed to read input");

    // Count lines, words, and characters
    let line_count = count_lines(&input);
    let word_count = count_words(&input);
    let char_count = count_characters(&input);

    // Print the counts
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Additional variables and functions that are not needed
    let temperature = 72;
    let humidity = 50;
    let wind_speed = 10;

    fn unused_function() {
        let unused_variable = 42;
    }

    // Using a variable for multiple purposes
    let mut weather = "sunny";
    println!("The weather is {}", weather);
    weather = "rainy";
    println!("The weather is {}", weather);

    // End of the program
}