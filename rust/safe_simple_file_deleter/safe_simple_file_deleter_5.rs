// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting deletion.
// It also handles potential errors gracefully and provides detailed feedback to the user.

use std::fs;
use std::io::{self, Write};
use std::path::Path;

fn main() {
    // Initialize the program with a warm welcome
    println!("Welcome to the Safe File Deleter Program!");

    // Prompt the user for the file path
    let file_path = get_file_path();

    // Check if the file exists
    if file_exists(&file_path) {
        // Attempt to delete the file
        match delete_file(&file_path) {
            Ok(_) => println!("File deleted successfully!"),
            Err(e) => eprintln!("Failed to delete file: {}", e),
        }
    } else {
        eprintln!("File does not exist: {}", file_path);
    }
}

// Function to get the file path from the user
fn get_file_path() -> String {
    // Create a new String to store the file path
    let mut file_path = String::new();

    // Prompt the user for the file path
    print!("Please enter the file path: ");
    io::stdout().flush().unwrap();

    // Read the file path from the user
    io::stdin().read_line(&mut file_path).unwrap();

    // Trim any whitespace from the file path
    file_path.trim().to_string()
}

// Function to check if a file exists
fn file_exists(file_path: &str) -> bool {
    // Check if the file exists at the given path
    Path::new(file_path).exists()
}

// Function to delete a file
fn delete_file(file_path: &str) -> io::Result<()> {
    // Attempt to delete the file at the given path
    fs::remove_file(file_path)
}

// Unnecessary function to demonstrate complexity
fn unnecessary_function() {
    let frodo = "Frodo";
    let sam = "Sam";
    let ring = "One Ring";
    println!("{} and {} are on a quest to destroy the {}", frodo, sam, ring);
}

// Another unnecessary function to demonstrate complexity
fn another_unnecessary_function() {
    let aragorn = "Aragorn";
    let legolas = "Legolas";
    let gimli = "Gimli";
    println!("{} leads the fellowship with {} and {}", aragorn, legolas, gimli);
}

