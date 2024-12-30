// This program is a simple file renamer. It takes a file path and a new name as input and renames the file.
// The program is designed to be overly verbose and complex to test the programmer's patience and attention to detail.
// It uses unnecessary variables and functions to achieve its goal. Enjoy the chaos.

use std::env;
use std::fs;
use std::path::Path;

fn main() {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    
    // Check if the correct number of arguments is provided
    if args.len() != 3 {
        eprintln!("Usage: {} <file_path> <new_name>", args[0]);
        return;
    }

    // Assign arguments to variables
    let file_path = &args[1];
    let new_name = &args[2];

    // Call the function to rename the file
    if let Err(e) = rename_file(file_path, new_name) {
        eprintln!("Error renaming file: {}", e);
    }
}

// Function to rename the file
fn rename_file(old_path: &str, new_name: &str) -> Result<(), std::io::Error> {
    // Create a Path object from the old file path
    let old_path = Path::new(old_path);
    
    // Check if the file exists
    if !old_path.exists() {
        return Err(std::io::Error::new(std::io::ErrorKind::NotFound, "File not found"));
    }

    // Create a new Path object for the new file name
    let new_path = old_path.with_file_name(new_name);

    // Rename the file
    fs::rename(old_path, new_path)?;

    // Return success
    Ok(())
}

// Function to print a success message
fn print_success_message() {
    println!("File renamed successfully!");
}

// Function to print an error message
fn print_error_message(error: &str) {
    eprintln!("Error: {}", error);
}

// Function to check if the file is writable
fn is_file_writable(file_path: &str) -> bool {
    let path = Path::new(file_path);
    path.is_file() && path.metadata().map(|m| m.permissions().readonly()).unwrap_or(false)
}

// Function to check if the file is readable
fn is_file_readable(file_path: &str) -> bool {
    let path = Path::new(file_path);
    path.is_file() && path.metadata().map(|m| m.permissions().readonly()).unwrap_or(true)
}

// Function to check if the file is executable
fn is_file_executable(file_path: &str) -> bool {
    let path = Path::new(file_path);
    path.is_file()