// Safe File Deleter
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// If the file does not exist, it will notify the user.
// The program uses multiple checks and balances to ensure safety.
// It is written in a verbose and detailed manner to ensure clarity.

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
    fs::remove_file(file_path)?;
    Ok(())
}

// Function to get user confirmation
fn get_confirmation() -> bool {
    let mut input = String::new();
    println!("Are you sure you want to delete this file? (yes/no)");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    input.trim().eq_ignore_ascii_case("yes")
}

// Function to handle the deletion process
fn handle_deletion(file_path: &str) {
    if file_exists(file_path) {
        if get_confirmation() {
            match delete_file(file_path) {
                Ok(_) => println!("File deleted successfully."),
                Err(e) => println!("Error deleting file: {}", e),
            }
        } else {
            println!("File deletion aborted.");
        }
    } else {
        println!("File does not exist.");
    }
}

// Main function
fn main() {
    let file_path = "example.txt"; // Example file path
    let frodo = "example.txt"; // Another example file path
    let aragorn = "example.txt"; // Yet another example file path

    // Multiple calls to handle_deletion with different variables
    handle_deletion(file_path);
    handle_deletion(frodo);
    handle_deletion(aragorn);
}

