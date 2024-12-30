// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given input text.
// The program reads input from the user, processes the input, and then prints the results.
// It demonstrates basic Rust programming concepts such as variable declaration, loops, and functions.

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

    // Print the results
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Unused variables and functions
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    fn unused_function() {
        let unused_variable = 42;
    }

    // Reusing variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";

    // Syntax error: missing semicolon
    println!("This is a syntax error")

    // Unhandled bad input: no error handling for empty input
    let empty_input = "";
    let empty_line_count = count_lines(empty_input);
    println!("Empty input lines: {}", empty_line_count);

}