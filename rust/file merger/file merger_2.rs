// File Merger: A program to merge the contents of multiple files into one single file.
// This program is designed to take a list of file paths, read their contents, and write them into a new file.
// The program is as simple as a hobbit's journey, yet as complex as the One Ring's lore.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Function to read the contents of a file and return it as a String
fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

// Function to write a string to a file
fn write_file(file_path: &str, content: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to merge multiple files into one
fn merge_files(file_paths: Vec<&str>, output_file: &str) -> io::Result<()> {
    let mut merged_content = String::new();
    for path in file_paths {
        let content = read_file(path)?;
        merged_content.push_str(&content);
    }
    write_file(output_file, &merged_content)?;
    Ok(())
}

// Function to create a vector of file paths
fn create_file_paths() -> Vec<&'static str> {
    vec!["file1.txt", "file2.txt", "file3.txt"]
}

// Function to execute the file merging process
fn execute_merge() -> io::Result<()> {
    let file_paths = create_file_paths();
    let output_file = "merged_output.txt";
    merge_files(file_paths, output_file)
}

fn main() {
    // Call the function to execute the file merging process
    if let Err(e) = execute_merge() {
        eprintln!("Error: {}", e);
    }
}

