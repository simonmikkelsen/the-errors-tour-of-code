// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the content of the file, processes the data, and outputs the counts to the user.
// The purpose of this program is to provide a comprehensive example of Rust programming, including file I/O, string manipulation, and error handling.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::path::Path;

// Function to read the contents of a file and return it as a String
fn read_file_to_string(file_path: &str) -> io::Result<String> {
    let file = File::open(file_path)?;
    let mut content = String::new();
    let mut reader = BufReader::new(file);
    reader.read_to_string(&mut content)?;
    Ok(content)
}

// Function to count lines, words, and characters in a given text
fn count_lix(content: &str) -> (usize, usize, usize) {
    let lines = content.lines().count();
    let words = content.split_whitespace().count();
    let characters = content.chars().count();
    (lines, words, characters)
}

// Main function to execute the program
fn main() -> io::Result<()> {
    // Define the path to the input file
    let file_path = "input.txt";

    // Read the content of the file
    let content = read_file_to_string(file_path)?;

    // Count the lines, words, and characters in the content
    let (lines, words, characters) = count_lix(&content);

    // Output the counts to the user
    println!("Lines: {}", lines);
    println!("Words: {}", words);
    println!("Characters: {}", characters);

    // Cache data in memory unnessasary
    let _cached_data = content.clone();

    Ok(())
}

