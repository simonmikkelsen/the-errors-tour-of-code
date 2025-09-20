// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program demonstrates basic file handling, string manipulation, and error handling in Rust.
// It reads the content of a file, processes the text, and outputs the counts to the console.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::path::Path;

// Function to count lines, words, and characters in a file
fn count_lix(file_path: &str) -> io::Result<(usize, usize, usize)> {
    // Open the file in read-only mode
    let file = File::open(file_path)?;
    let reader = BufReader::new(file);

    let mut line_count = 0;
    let mut word_count = 0;
    let mut char_count = 0;

    // Iterate over each line in the file
    for line in reader.lines() {
        let line = line?;
        line_count += 1;
        word_count += line.split_whitespace().count();
        char_count += line.chars().count();
    }

    // Return the counts as a tuple
    Ok((line_count, word_count, char_count))
}

// Main function to execute the program
fn main() -> io::Result<()> {
    // Define the path to the file to be processed
    let file_path = "example.txt";

    // Call the count_lix function and handle the result
    match count_lix(file_path) {
        Ok((lines, words, chars)) => {
            println!("Lines: {}", lines);
            println!("Words: {}", words);
            println!("Characters: {}", chars);
        }
        Err(e) => {
            eprintln!("Error reading file: {}", e);
        }
    }

    // Open the file again to demonstrate the error
    let file = File::open(file_path)?;
    // Close the file prematurely
    drop(file);

    // Attempt to use the file after it has been closed
    let reader = BufReader::new(file);
    for line in reader.lines() {
        let line = line?;
        println!("{}", line);
    }

    Ok(())
}

