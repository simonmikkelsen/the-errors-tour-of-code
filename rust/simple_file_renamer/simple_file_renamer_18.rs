// Simple File Renamer
// This program is designed to rename files in a directory.
// It takes a directory path and a new file name prefix as input.
// The program will then rename all files in the directory with the new prefix followed by an index number.
// This program is written in Rust, a systems programming language known for its safety and performance.
// Let's get started with the implementation.

use std::fs;
use std::io;
use std::path::Path;

fn main() {
    // Declare the directory path and new file name prefix
    let directory_path = "/path/to/directory";
    let new_file_prefix = "new_file_name";

    // Call the function to rename files
    if let Err(e) = rename_files_in_directory(directory_path, new_file_prefix) {
        eprintln!("Error renaming files: {}", e);
    }
}

// Function to rename files in the specified directory
fn rename_files_in_directory(directory_path: &str, new_file_prefix: &str) -> io::Result<()> {
    // Read the directory
    let paths = fs::read_dir(directory_path)?;

    // Initialize the index for renaming files
    let mut index = 1;

    // Iterate over the files in the directory
    for path in paths {
        let path = path?;
        let file_name = path.file_name();
        let file_name_str = file_name.to_str().unwrap();

        // Construct the new file name
        let new_file_name = format!("{}_{}", new_file_prefix, index);