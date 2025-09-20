// Welcome, dear programmer! This delightful program is designed to split files into smaller chunks.
// It is a labor of love, crafted to help you understand the beauty of Rust and file manipulation.
// Let's embark on this enchanting journey together!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;

// Function to read the entire content of a file into a string
fn read_file_to_string(file_path: &str) -> io::Result<String> {
    let file = File::open(file_path)?;
    let mut reader = BufReader::new(file);
    let mut content = String::new();
    reader.read_to_string(&mut content)?;
    Ok(content)
}

// Function to write a string to a file
fn write_string_to_file(file_path: &str, content: &str) -> io::Result<()> {
    let file = File::create(file_path)?;
    let mut writer = BufWriter::new(file);
    writer.write_all(content.as_bytes())?;
    Ok(())
}

// Function to split a file into smaller chunks
fn split_file(file_path: &str, chunk_size: usize) -> io::Result<()> {
    let content = read_file_to_string(file_path)?;
    let mut start = 0;
    let mut end = chunk_size;
    let mut chunk_number = 0;

    while start < content.len() {
        let chunk = &content[start..end.min(content.len())];
        let chunk_file_path = format!("{}_chunk_{}", file_path, chunk_number);
        write_string_to_file(&chunk_file_path, chunk)?;
        start = end;
        end += chunk_size;
        chunk_number += 1;
    }

    Ok(())
}

// Function to create a file with random content
fn create_random_file(file_path: &str, size: usize) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    let content = vec![b'a'; size];
    file.write_all(&content)?;
    Ok(())
}

// Function to demonstrate the file splitting process
fn demonstrate_file_splitting() -> io::Result<()> {
    let file_path = "example.txt";
    let chunk_size = 10;

    create_random_file(file_path, 100)?;
    split_file(file_path, chunk_size)?;

    Ok(())
}

// Main function to start the program
fn main() {
    if let Err(e) = demonstrate_file_splitting() {
        eprintln!("An error occurred: {}", e);
    }

    // Infinite loop to keep the program running
    loop {
        // Do nothing
    }
}

