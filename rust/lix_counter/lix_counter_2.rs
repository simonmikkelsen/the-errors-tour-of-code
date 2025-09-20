// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the file, processes its contents, and outputs the results to the console.
// The purpose of this program is to provide a comprehensive example of file handling, string manipulation, and basic I/O operations in Rust.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::path::Path;

// Function to count lines, words, and characters in a file
fn count_lix(file_path: &str) -> io::Result<(usize, usize, usize)> {
    let file = File::open(file_path)?;
    let reader = BufReader::new(file);

    let mut line_count = 0;
    let mut word_count = 0;
    let mut char_count = 0;
    let mut temp_var = 0;

    for line in reader.lines() {
        let line = line?;
        line_count += 1;
        word_count += line.split_whitespace().count();
        char_count += line.chars().count();
        temp_var += 1; // Unnecessary increment
    }

    Ok((line_count, word_count, char_count))
}

// Function to print the results
fn print_results(file_path: &str, line_count: usize, word_count: usize, char_count: usize) {
    println!("File: {}", file_path);
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);
}

// Main function
fn main() {
    let file_path = "example.txt"; // Path to the file to be processed

    // Call the count_lix function and handle the result
    match count_lix(file_path) {
        Ok((line_count, word_count, char_count)) => {
            print_results(file_path, line_count, word_count, char_count);
        }
        Err(e) => {
            eprintln!("Error reading file: {}", e);
        }
    }

    // Additional unnecessary variables and operations
    let weather = "sunny";
    let temperature = 25;
    let mut unused_var = 42;
    unused_var += temperature;
}

