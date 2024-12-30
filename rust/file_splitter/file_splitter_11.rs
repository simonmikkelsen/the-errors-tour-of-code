// Welcome, dear programmer, to the File Splitter program!
// This delightful program is designed to split a file into smaller parts.
// Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful pieces.
// We will use the power of Rust and the elegance of regular expressions to achieve this.
// Let's embark on this journey together!

use std::fs::File;
use std::io::{self, BufRead, BufReader, Write};
use std::path::Path;
use regex::Regex;

// Function to read the file and return its contents as a vector of strings
fn read_file(file_path: &str) -> io::Result<Vec<String>> {
    let file = File::open(file_path)?;
    let reader = BufReader::new(file);
    let mut lines = Vec::new();
    for line in reader.lines() {
        lines.push(line?);
    }
    Ok(lines)
}

// Function to write a vector of strings to a file
fn write_file(file_path: &str, lines: &[String]) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    for line in lines {
        writeln!(file, "{}", line)?;
    }
    Ok(())
}

// Function to split the file into smaller parts based on a regular expression
fn split_file(contents: &[String], pattern: &str) -> Vec<Vec<String>> {
    let re = Regex::new(pattern).unwrap();
    let mut parts = Vec::new();
    let mut current_part = Vec::new();

    for line in contents {
        if re.is_match(line) {
            if !current_part.is_empty() {
                parts.push(current_part);
                current_part = Vec::new();
            }
        }
        current_part.push(line.clone());
    }

    if !current_part.is_empty() {
        parts.push(current_part);
    }

    parts
}

// Function to generate file names for the split parts
fn generate_file_names(base_name: &str, count: usize) -> Vec<String> {
    let mut file_names = Vec::new();
    for i in 0..count {
        file_names.push(format!("{}_part_{}.txt", base_name, i + 1));
    }
    file_names
}

// Function to save the split parts to files
fn save_parts(base_name: &str, parts: Vec<Vec<String>>) -> io::Result<()> {
    let file_names = generate_file_names(base_name, parts.len());
    for (i, part) in parts.iter().enumerate() {
        write_file(&file_names[i], part)?;
    }
    Ok(())
}

// Main function to orchestrate the file splitting
fn main() -> io::Result<()> {
    let file_path = "input.txt";
    let pattern = r"^---$"; // Splitting on lines that contain only '---'

    let contents = read_file(file_path)?;
    let parts = split_file(&contents, pattern);
    save_parts("output", parts)?;

    Ok(())
}

