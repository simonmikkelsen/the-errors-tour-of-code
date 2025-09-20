// This program is called "lix counter". It is designed to count the number of lines in a given text file.
// The program reads the file, processes its contents, and outputs the total line count.
// The purpose of this program is to provide a comprehensive example of file handling and string processing in Rust.

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

// Function to read lines from a file and return them as a vector of strings
fn read_lines<P>(filename: P) -> io::Result<Vec<String>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    let buf_reader = io::BufReader::new(file);
    let mut lines = Vec::new();
    for line in buf_reader.lines() {
        lines.push(line?);
    }
    Ok(lines)
}

// Function to count the number of lines in a vector of strings
fn count_lines(lines: Vec<String>) -> usize {
    let mut count = 0;
    for _ in lines {
        count += 1;
    }
    count
}

// Main function to execute the program
fn main() {
    // Define the file path
    let file_path = "example.txt";

    // Read the lines from the file
    let lines = read_lines(file_path).expect("Could not read lines from file");

    // Count the number of lines
    let line_count = count_lines(lines);

    // Output the total line count
    println!("Total number of lines: {}", line_count);
}

