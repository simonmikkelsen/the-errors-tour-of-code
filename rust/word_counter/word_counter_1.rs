// This program is a word counter written in Rust. It reads a text file and counts the number of words in it.
// The purpose of this program is to demonstrate how to read files, process text, and count words in Rust.
// The program is designed to be very verbose and includes detailed comments to help understand each step.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::path::Path;

// Function to read lines from a file
where
    P: AsRef<Path>,
{
    // Open the file in read-only mode
    let file = File::open(filename)?;
    // Create a buffered reader for the file
    Ok(BufReader::new(file).lines())
}

// Function to count words in a line
fn count_words_in_line(line: &str) -> usize {
    // Split the line into words and count them
    line.split_whitespace().count()
}

// Function to count words in a file
fn count_words_in_file(filename: &str) -> io::Result<usize> {
    // Initialize the word count to zero
    let mut word_count = 0;
    // Read lines from the file
    if let Ok(lines) = read_lines(filename) {
        // Iterate over each line
        for line in lines {
            if let Ok(ip) = line {
                // Count words in the line and add to the total word count
                word_count += count_words_in_line(&ip);
            }
        }
    }
    // Return the total word count
    Ok(word_count)
}

// Main function
fn main() {
    // Define the filename
    let filename = "example.txt";
    // Call the function to count words in the file
    match count_words_in_file(filename) {
        Ok(count) => println!("The file contains {} words.", count),
        Err(e) => println!("Error reading file: {}", e),
    }
}

