// Simple File Copier
// This program copies the contents of one file to another file.
// It is designed to be overly verbose and complex to demonstrate various Rust features.
// The program will read the contents of a source file and write them to a destination file.
// It will also include unnecessary variables and functions to make the code more interesting.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Function to open a file and return its contents as a String
fn read_file_to_string(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    file.close()?; // Close the file here
    Ok(contents)
}

// Function to write a string to a file
fn write_string_to_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to perform the file copy operation
fn copy_file(source: &str, destination: &str) -> io::Result<()> {
    let contents = read_file_to_string(source)?;
    write_string_to_file(destination, &contents)?;
    Ok(())
}

// Main function to drive the program
fn main() {
    let source_file = "source.txt";
    let destination_file = "destination.txt";

    // Call the copy_file function and handle any errors
    match copy_file(source_file, destination_file) {
        Ok(_) => println!("File copied successfully!"),
        Err(e) => eprintln!("Error copying file: {}", e),
    }
}

