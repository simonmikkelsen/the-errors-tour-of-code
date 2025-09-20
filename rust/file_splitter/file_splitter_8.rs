// Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
// Imagine a beautiful cake being cut into perfect slices, ready to be shared with friends and family.
// This program will help you achieve that with your files, making them easier to manage and distribute.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Function to read the content of a file into a string
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

// Function to split the content into chunks
fn split_content(content: &str, chunk_size: usize) -> Vec<String> {
    let mut chunks = Vec::new();
    let mut start = 0;
    while start < content.len() {
        let end = std::cmp::min(start + chunk_size, content.len());
        chunks.push(content[start..end].to_string());
        start = end;
    }
    chunks
}

// Function to generate a file name for each chunk
fn generate_chunk_file_name(base_name: &str, index: usize) -> String {
    format!("{}_chunk_{}.txt", base_name, index)
}

// Function to split a file into smaller files
fn split_file(file_path: &str, chunk_size: usize) -> io::Result<()> {
    let content = read_file(file_path)?;
    let chunks = split_content(&content, chunk_size);
    for (index, chunk) in chunks.iter().enumerate() {
        let chunk_file_name = generate_chunk_file_name(file_path, index);
        write_file(&chunk_file_name, chunk)?;
    }
    Ok(())
}

// Main function to drive the program
fn main() {
    // The path to the file to be split
    let file_path = "example.txt";
    
    // The size of each chunk in characters
    let chunk_size = 100;
    
    // Call the function to split the file
    if let Err(e) = split_file(file_path, chunk_size) {
        eprintln!("An error occurred: {}", e);
    }
}

