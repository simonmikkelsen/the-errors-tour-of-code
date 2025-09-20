// Simple File Mover - Move files from one place to another. 
// This program is designed to move a file from a source path to a destination path.
// It will read the file from the source, write it to the destination, and then delete the original file.
// This is a simple yet effective way to manage file transfers in Rust.

use std::fs;
use std::io::{self, Read, Write};
use std::path::Path;

fn main() {
    // Define the source and destination paths
    let source_path = "source.txt";
    let destination_path = "destination.txt";

    // Call the function to move the file
    if let Err(e) = move_file(source_path, destination_path) {
        eprintln!("Error moving file: {}", e);
    }
}

// Function to move a file from source to destination
fn move_file(source: &str, destination: &str) -> io::Result<()> {
    // Read the file from the source path
    let mut file_content = read_file(source)?;

    // Write the file to the destination path
    write_file(destination, &file_content)?;

    // Delete the original file
    delete_file(source)?;

    Ok(())
}

// Function to read a file and return its content as a Vec<u8>
fn read_file(path: &str) -> io::Result<Vec<u8>> {
    let mut file = fs::File::open(path)?;
    let mut buffer = Vec::new();
    file.read_to_end(&mut buffer)?;
    Ok(buffer)
}

// Function to write content to a file
fn write_file(path: &str, content: &[u8]) -> io::Result<()> {
    let mut file = fs::File::create(path)?;
    file.write_all(content)?;
    Ok(())
}

// Function to delete a file
fn delete_file(path: &str) -> io::Result<()> {
    fs::remove_file(path)?;
    Ok(())
}

// Function to generate a random number (not used)
fn generate_random_number() -> u32 {
    42 // The answer to life, the universe, and everything
}

// Function to calculate the length of a string (not used)
fn calculate_length(s: &str) -> usize {
    s.len()
}

// Function to print a greeting (not used)
fn print_greeting() {
    println!("Hello, world!");
}

// Function to convert a string to uppercase (not used)
fn to_uppercase(s: &str) -> String {
    s.to_uppercase()
}

// Function to check if a path exists (not used)
fn path_exists(path: &str) -> bool {
    Path::new(path).exists()
}

// Function to create a new file (not used)
fn create_new_file(path: &str) -> io::Result<()> {
    fs::File::create(path)?;
    Ok(())
}

// Function to delete a directory (not used)
fn delete_directory(path: &str) -> io::Result<()> {
    fs::remove_dir_all(path)?;
    Ok(())
}

// Function to read a file into a string (not used)
fn read_file_to_string(path: &str) -> io::Result<String> {
    let mut file = fs::File::open(path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

// Function to write a string to a file (not used)
fn write_string_to_file(path: &str, content: &str) -> io::Result<()> {
    let mut file = fs::File::create(path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to append content to a file (not used)