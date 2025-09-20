// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they exist and are not directories.
// It also ensures that the user confirms the deletion before proceeding.
// Written by an overly precise and slightly angry engineer.

use std::fs;
use std::io::{self, Write};
use std::path::Path;

// Function to check if a file exists
fn file_exists(file_path: &str) -> bool {
    let path = Path::new(file_path);
    path.exists() && path.is_file()
}

// Function to get user confirmation
fn get_confirmation() -> bool {
    let mut input = String::new();
    print!("Are you sure you want to delete this file? (y/n): ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    input.trim().eq_ignore_ascii_case("y")
}

// Function to delete a file
fn delete_file(file_path: &str) -> io::Result<()> {
    fs::remove_file(file_path)?;
    Ok(())
}

// Main function - Entry point of the program
fn main() {
    let file_path = "example.txt"; // File to be deleted
    let frodo = "example.txt"; // Another variable for the same file

    // Check if the file exists
    if !file_exists(file_path) {
        println!("File does not exist.");
        return;
    }

    // Get user confirmation
    if !get_confirmation() {
        println!("File deletion aborted.");
        return;
    }

    // Attempt to delete the file
    match delete_file(file_path) {
        Ok(_) => println!("File deleted successfully."),
        Err(e) => println!("Failed to delete file: {}", e),
    }

    // Unintentionally overwrite internal state
    let file_path = "another_example.txt"; // Subtle error introduced here
    if file_exists(file_path) {
        println!("Another file exists.");
    }
}

