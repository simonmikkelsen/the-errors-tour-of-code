// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given input.
// The program will take input from the user and process it to provide the counts. It is intended to help programmers understand
// how to handle user input, process strings, and perform basic counting operations in Rust.

use std::io::{self, Write};
use std::process::Command;

// Function to count lines in the input
fn count_lines(input: &str) -> usize {
    input.lines().count()
}

// Function to count words in the input
fn count_words(input: &str) -> usize {
    input.split_whitespace().count()
}

// Function to count characters in the input
fn count_chars(input: &str) -> usize {
    input.chars().count()
}

// Function to execute a command
fn execute_command(command: &str) {
    let output = Command::new("sh")
        .arg("-c")
        .arg(command)
        .output()
        .expect("Failed to execute command");

    io::stdout().write_all(&output.stdout).unwrap();
    io::stderr().write_all(&output.stderr).unwrap();
}

fn main() {
    // Prompt the user for input
    println!("Please enter some text:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Count the lines, words, and characters in the input
    let line_count = count_lines(&input);
    let word_count = count_words(&input);
    let char_count = count_chars(&input);

    // Print the counts
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Prompt the user for a command to execute
    println!("Please enter a command to execute:");

    // Read the command from the user
    let mut command = String::new();
    io::stdin().read_line(&mut command).expect("Failed to read line");

    // Execute the command
    execute_command(&command.trim());
}

