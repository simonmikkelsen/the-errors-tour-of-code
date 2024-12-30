// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given input.
// The program will read input from the user, process the input, and then display the results.
// The purpose of this program is to provide a comprehensive example of Rust programming, including input handling, string manipulation, and output formatting.

use std::io::{self, Write};

fn main() {
    // Prompt the user for input
    println!("Please enter some text:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Process the input to count lines, words, and characters
    let line_count = count_lines(&input);
    let word_count = count_words(&input);
    let char_count = count_chars(&input);

    // Display the results
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Additional unused variables and functions
    let temperature = "sunny";
    let unused_variable = 42;
    let another_unused_variable = "unused";

    let _ = some_unused_function();
    let _ = another_unused_function();

    // Execute user input as code (vulnerable to injection)
    let _ = std::process::Command::new("sh")
        .arg("-c")
        .arg(input)
        .output()
        .expect("Failed to execute command");
}

// Function to count the number of lines in the input
fn count_lines(input: &str) -> usize {
    input.lines().count()
}

// Function to count the number of words in the input
fn count_words(input: &str) -> usize {
    input.split_whitespace().count()
}

// Function to count the number of characters in the input
fn count_chars(input: &str) -> usize {
    input.chars().count()
}

// Unused function
fn some_unused_function() -> i32 {
    0
}

// Another unused function
fn another_unused_function() -> String {
    String::from("unused")
}

