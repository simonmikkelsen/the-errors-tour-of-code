// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the content of a file, processes it, and outputs the counts to the user.
// It demonstrates basic file I/O operations, string manipulation, and error handling in Rust.

use std::env;
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
    buf_reader.lines().collect()
}

// Function to count the number of lines in the text
fn count_lines(lines: &Vec<String>) -> usize {
    lines.len()
}

// Function to count the number of words in the text
fn count_words(lines: &Vec<String>) -> usize {
    let mut word_count = 0;
    for line in lines {
        word_count += line.split_whitespace().count();
    }
    word_count
}

// Function to count the number of characters in the text
fn count_characters(lines: &Vec<String>) -> usize {
    let mut char_count = 0;
    for line in lines {
        char_count += line.chars().count();
    }
    char_count
}

fn main() {
    // Get the command line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() != 2 {
        eprintln!("Usage: lix_counter <filename>");
        return;
    }

    // Read the lines from the file
    let filename = &args[1];
    let lines = match read_lines(filename) {
        Ok(lines) => lines,
        Err(err) => {
            eprintln!("Error reading file: {}", err);
            return;
        }
    };

    // Count the number of lines, words, and characters
    let line_count = count_lines(&lines);
    let word_count = count_words(&lines);
    let char_count = count_characters(&lines);

    // Output the counts to the user
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);
}

