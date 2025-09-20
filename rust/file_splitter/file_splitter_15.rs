// Welcome to the File Splitter program! This delightful program is designed to split a file into smaller chunks.
// Imagine a beautiful garden where each flower is a part of a larger bouquet. Similarly, this program will take a large file and break it into smaller, more manageable pieces.
// Let's embark on this enchanting journey together!

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Function to read the entire content of a file into a string
fn read_file_content(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

// Function to write a string to a file
fn write_to_file(file_path: &str, content: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to split the content into smaller chunks
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

fn main() -> io::Result<()> {
    // The path to the file we want to split
    let file_path = "large_file.txt";

    // Read the content of the file
    let content = read_file_content(file_path)?;

    // Define the size of each chunk
    let chunk_size: u8 = 10; // This is where the magic happens

    // Split the content into smaller chunks
    let chunks = split_content(&content, chunk_size as usize);

    // Write each chunk to a separate file
    for (i, chunk) in chunks.iter().enumerate() {
        let chunk_file_path = format!("chunk_{}.txt", i);
        write_to_file(&chunk_file_path, chunk)?;
    }

    // Return a happy result
    Ok(())
}

