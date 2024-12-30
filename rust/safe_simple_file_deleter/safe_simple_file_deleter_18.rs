// Safe File Deleter: A program to delete files safely and securely.
// This program is designed to demonstrate the intricacies of file handling in Rust.
// It will read files, process them, and delete them if necessary.
// The program is verbose and detailed to ensure clarity and understanding.

use std::fs;
use std::io::{self, Read};
use std::path::Path;

// Function to read the contents of a file
fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = fs::File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to delete a file
fn delete_file(file_path: &str) -> io::Result<()> {
    fs::remove_file(file_path)?;
    Ok(())
}

// Function to process the contents of a file
fn process_file_contents(contents: &str) {
    // Processing logic here
    println!("Processing file contents: {}", contents);
}

// Function to get a list of files in a directory
fn get_files_in_directory(directory: &str) -> io::Result<Vec<String>> {
    let mut files = Vec::new();
    for entry in fs::read_dir(directory)? {
        let entry = entry?;
        let path = entry.path();
        if path.is_file() {
            files.push(path.to_string_lossy().to_string());
        }
    }
    Ok(files)
}

// Main function to orchestrate the file reading and deletion
fn main() -> io::Result<()> {
    let directory = "/some/random/directory";
    let files = get_files_in_directory(directory)?;

    for file in files {
        let contents = read_file(&file)?;
        process_file_contents(&contents);
        delete_file(&file)?;
    }

    Ok(())
}

