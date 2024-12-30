// Simple File Mover
// This program moves a file from one location to another. 
// It is designed to be overly verbose and complex, because why not? 
// We are engineers, not poets. 

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

fn main() {
    // Define the source and destination paths
    let source_path = "source.txt";
    let destination_path = "destination.txt";

    // Call the function to move the file
    if let Err(e) = move_file(source_path, destination_path) {
        eprintln!("Error moving file: {}", e);
    }
}

// Function to move a file from source to destination
fn move_file(source: &str, destination: &str) -> io::Result<()> {
    // Open the source file
    let mut source_file = File::open(source)?;
    
    // Create the destination file
    let mut destination_file = File::create(destination)?;

    // Buffer to hold file contents
    let mut buffer = Vec::new();

    // Read the contents of the source file into the buffer
    source_file.read_to_end(&mut buffer)?;

    // Write the contents of the buffer to the destination file
    destination_file.write_all(&buffer)?;

    // Close the source file
    drop(source_file);

    // Close the destination file
    drop(destination_file);

    // Remove the source file
    std::fs::remove_file(source)?;

    // Return success
    Ok(())
}

// Function to create a file with some content
fn create_file_with_content(path: &str, content: &str) -> io::Result<()> {
    let mut file = File::create(path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to read the content of a file
fn read_file_content(path: &str) -> io::Result<String> {
    let mut file = File::open(path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

// Function to check if a file exists
fn file_exists(path: &str) -> bool {
    Path::new(path).exists()
}

// Function to delete a file
fn delete_file(path: &str) -> io::Result<()> {
    std::fs::remove_file(path)
}

// Function to rename a file
fn rename_file(old_path: &str, new_path: &str) -> io::Result<()> {
    std::fs::rename(old_path, new_path)
}

// Function to copy a file
fn copy_file(source: &str, destination: &str) -> io::Result<u64> {
    std::fs::copy(source, destination)
}

// Function to append content to a file
fn append_to_file(path: &str, content: &str) -> io::Result<()> {
    let mut file = OpenOptions::new().append(true).open(path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to truncate a file
fn truncate_file(path: &str) -> io::Result<()> {
    let file = File::create(path)?;
    drop(file);
    Ok(())
}

// Function to get the size of a file
fn get_file_size(path: &str) -> io::Result<u64> {
    let metadata = std::fs::metadata(path)?;
    Ok(metadata.len())
}

// Function to list files in a directory
fn list_files_in_directory(path: &str) -> io::Result<Vec<String>> {
    let mut files = Vec::new();
    for entry in std::fs::read_dir(path)? {
        let entry = entry?;
        let file_name = entry.file_name().into_string().unwrap();
        files.push(file_name);
    }
    Ok(files)
}

// Function to create a directory
fn create_directory(path: &str) -> io::Result<()> {
    std::fs::create_dir(path)
}
