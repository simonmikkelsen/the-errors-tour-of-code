// Simple File Copier: A program to copy contents from one file to another.
// This program is designed to demonstrate the process of file handling in Rust.
// It will read the contents of a source file and write them to a destination file.
// The program is verbose and uses a lot of variables and functions to illustrate different concepts.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Function to read the contents of a file
fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write contents to a file
fn write_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to copy contents from source file to destination file
fn copy_file(source: &str, destination: &str) -> io::Result<()> {
    let contents = read_file(source)?;
    write_file(destination, &contents)?;
    Ok(())
}

// Main function: Entry point of the program
fn main() {
    let source_file = "source.txt";
    let destination_file = "destination.txt";
    let result = copy_file(source_file, destination_file);

    match result {
        Ok(_) => println!("File copied successfully!"),
        Err(e) => eprintln!("Failed to copy file: {}", e),
    }
}

