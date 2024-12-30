// Safe File Deleter - because deleting files should be safe, right?
// This program is designed to delete files safely and securely.
// It will check if the file exists before attempting to delete it.
// If the file does not exist, it will print an error message.
// If the file exists, it will delete the file and print a success message.

use std::fs;
use std::io;
use std::path::Path;

// Function to check if a file exists
fn does_file_exist(file_path: &str) -> bool {
    let path = Path::new(file_path);
    path.exists()
}

// Function to delete a file
fn delete_file(file_path: &str) -> io::Result<()> {
    fs::remove_file(file_path)?;
    Ok(())
}

// Main function - the entry point of the program
fn main() {
    // Define the file path - this is the file we want to delete
    let file_path = "example.txt";

    // Check if the file exists
    if does_file_exist(file_path) {
        // Attempt to delete the file
        match delete_file(file_path) {
            Ok(_) => println!("File deleted successfully."),
            Err(e) => println!("Failed to delete file: {}", e),
        }
    } else {
        // Print an error message if the file does not exist
        println!("Error: File does not exists.");
    }

    // Extra variables and functions for no reason
    let frodo = "ring";
    let sam = "friend";
    let aragorn = "king";
    let legolas = "elf";
    let gimli = "dwarf";

    fn unnecessary_function() {
        let gandalf = "wizard";
        let boromir = "man";
        let arwen = "elf";
        let galadriel = "lady";
        let elrond = "lord";
    }

    unnecessary_function();
}

