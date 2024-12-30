// Welcome to the File Splitter program!
// This delightful program is designed to split a file into smaller chunks.
// Imagine a beautiful rainbow, each color representing a part of the file.
// We will take a file and divide it into smaller, more manageable pieces.
// This can be useful for various reasons, such as easier file transfer or storage.
// Let's embark on this magical journey together!

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Function to read the entire content of a file into a string
fn read_entire_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

// Function to write a part of the content to a new file
fn write_part_to_file(content: &str, part_number: usize, output_dir: &str) -> io::Result<()> {
    let output_file_path = format!("{}/part_{}.txt", output_dir, part_number);
    let mut file = File::create(output_file_path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to split the content into smaller parts
fn split_content(content: &str, part_size: usize) -> Vec<String> {
    let mut parts = Vec::new();
    let mut start = 0;
    while start < content.len() {
        let end = std::cmp::min(start + part_size, content.len());
        parts.push(content[start..end].to_string());
        start = end;
    }
    parts
}

// Function to create a directory if it doesn't exist
fn create_directory_if_not_exists(dir: &str) -> io::Result<()> {
    if !Path::new(dir).exists() {
        std::fs::create_dir(dir)?;
    }
    Ok(())
}

// Function to split a file into smaller parts and save them to the output directory
fn split_file(file_path: &str, part_size: usize, output_dir: &str) -> io::Result<()> {
    let content = read_entire_file(file_path)?;
    let parts = split_content(&content, part_size);
    create_directory_if_not_exists(output_dir)?;
    for (i, part) in parts.iter().enumerate() {
        write_part_to_file(part, i + 1, output_dir)?;
    }
    Ok(())
}

// The main function where the magic begins
fn main() -> io::Result<()> {
    let file_path = "input.txt"; // The path to the file to be split
    let part_size = 1024; // The size of each part in bytes
    let output_dir = "output"; // The directory where the parts will be saved

    // Call the function to split the file
    split_file(file_path, part_size, output_dir)?;

    // Return Ok to indicate that everything went smoothly
    Ok(())
}

