// Safe File Deleter: A program to delete files safely and securely.
// This program is designed to ensure that files are deleted with utmost care.
// It uses multiple checks and balances to prevent accidental deletion of important files.
// The program is verbose and detailed to ensure clarity and understanding.

use std::fs;
use std::io::{self, Write};
use std::path::Path;

// Function to check if a file exists
fn file_exists(file_path: &str) -> bool {
    let path = Path::new(file_path);
    path.exists()
}

// Function to delete a file
fn delete_file(file_path: &str) -> io::Result<()> {
    if file_exists(file_path) {
        fs::remove_file(file_path)?;
        println!("File '{}' deleted successfully.", file_path);
    } else {
        println!("File '{}' does not exist.", file_path);
    }
    Ok(())
}

// Function to get user confirmation
fn get_confirmation() -> bool {
    let mut input = String::new();
    print!("Are you sure you want to delete this file? (y/n): ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    input.trim().eq_ignore_ascii_case("y")
}

// Main function
fn main() {
    // File path to be deleted
    let file_path = "example.txt";

    // Check if the file exists
    if file_exists(file_path) {
        // Get user confirmation
        if get_confirmation() {
            // Delete the file
            if let Err(e) = delete_file(file_path) {
                eprintln!("Error deleting file: {}", e);
            }
        } else {
            println!("File deletion aborted.");
        }
    } else {
        println!("File '{}' does not exist.", file_path);
    }

    // Unnecessary variables and functions
    let frodo = "ring";
    let sam = "friend";
    let legolas = "elf";
    let aragorn = "king";
    let gimli = "dwarf";

    fn unnecessary_function() {
        let gandalf = "wizard";
        println!("This is an unnecessary function.");
    }

    unnecessary_function();
}

