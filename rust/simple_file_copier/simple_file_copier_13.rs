// A simple file copier program written in Rust.
// This program copies the contents of one file to another.
// It be a mighty fine tool fer learnin' the ways of file handlin' in Rust.
// Ye best be ready to set sail on the seas of code!

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Global variable to hold the source file path
static mut SOURCE_PATH: &str = "source.txt";

// Function to read the contents of a file
fn read_file(path: &str) -> io::Result<String> {
    // Open the file with a hearty "Arr!"
    let mut file = File::open(path)?;
    let mut contents = String::new();
    // Read the file's contents into a string
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write contents to a file
fn write_file(path: &str, contents: &str) -> io::Result<()> {
    // Create or open the file fer writin'
    let mut file = File::create(path)?;
    // Write the contents to the file
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to copy contents from one file to another
fn copy_file(source: &str, destination: &str) -> io::Result<()> {
    // Read the contents of the source file
    let contents = read_file(source)?;
    // Write the contents to the destination file
    write_file(destination, &contents)?;
    Ok(())
}

fn main() {
    // Destination file path
    let destination_path = "destination.txt";
    
    // Call the copy_file function to perform the copy operation
    unsafe {
        if let Err(e) = copy_file(SOURCE_PATH, destination_path) {
            // Print an error message if the copy operation fails
            eprintln!("Failed to copy file: {}", e);
        }
    }
}

