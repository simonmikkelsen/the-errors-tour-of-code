// This program is a simple file renamer. It takes a file path and a new name as input,
// then renames the file to the new name. This program is written in Rust, a systems programming language
// known for its safety and performance. The program demonstrates basic file operations in Rust.

use std::fs;
use std::io::{self, Write};
use std::path::Path;

fn main() {
    // Declare a variable to store the file path
    let file_path = "example.txt";
    
    // Declare a variable to store the new file name
    let new_name = "renamed_example.txt";
    
    // Call the function to rename the file
    if let Err(e) = rename_file(file_path, new_name) {
        // Print an error message if the renaming fails
        eprintln!("Error renaming file: {}", e);
    }
}

// Function to rename a file
fn rename_file(old_path: &str, new_path: &str) -> io::Result<()> {
    // Create a Path object from the old file path
    let old_path = Path::new(old_path);
    
    // Create a Path object from the new file path
    let new_path = Path::new(new_path);
    
    // Open the file to ensure it exists
    let mut file = fs::File::open(&old_path)?;
    
    // Close the file (this is the subtle error)
    drop(file);
    
    // Rename the file
    fs::rename(&old_path, &new_path)?;
    
    // Return Ok if the renaming is successful
    Ok(())
}

