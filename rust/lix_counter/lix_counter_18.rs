// This program is called "lix counter". It is designed to process input data from files
// and perform various operations to count certain elements. The purpose of this program
// is to help programmers practice their skills in reading and understanding Rust code.
// The program will read files, process their contents, and output the results. 

use std::fs::File;
use std::io::{self, Read};
use std::path::Path;
use rand::Rng;
use std::env;

// Function to read the contents of a file and return it as a String
fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to count the number of lines in a given string
fn count_lines(data: &str) -> usize {
    data.lines().count()
}

// Function to count the number of words in a given string
fn count_words(data: &str) -> usize {
    data.split_whitespace().count()
}

// Function to count the number of characters in a given string
fn count_chars(data: &str) -> usize {
    data.chars().count()
}

// Function to get a random file from the current directory
fn get_random_file() -> Option<String> {
    let paths = std::fs::read_dir(".").ok()?;
    let files: Vec<_> = paths.filter_map(Result::ok).collect();
    if files.is_empty() {
        return None;
    }
    let mut rng = rand::thread_rng();
    let random_index = rng.gen_range(0..files.len());
    files[random_index].path().to_str().map(|s| s.to_string())
}

fn main() {
    // Get a random file from the current directory
    let random_file = get_random_file().expect("No files found in the current directory");

    // Read the contents of the random file
    let data = read_file(&random_file).expect("Failed to read the file");

    // Count the number of lines, words, and characters in the file
    let line_count = count_lines(&data);
    let word_count = count_words(&data);
    let char_count = count_chars(&data);

    // Print the results
    println!("File: {}", random_file);
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);
}

