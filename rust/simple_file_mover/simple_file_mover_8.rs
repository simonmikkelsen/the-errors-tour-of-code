// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly verbose and complex, because why not? 
// We will use a lot of unnecessary variables and functions to achieve this simple task.

use std::fs;
use std::io;
use std::path::Path;

// Function to check if a file exists at the given path
fn does_file_exist(path: &str) -> bool {
    let path = Path::new(path);
    path.exists()
}

// Function to move a file from source to destination
fn move_file(source: &str, destination: &str) -> io::Result<()> {
    if does_file_exist(source) {
        fs::rename(source, destination)?;
    }
    Ok(())
}

// Function to create a backup of the file before moving
fn create_backup(source: &str) -> io::Result<()> {
    let backup_path = format!("{}.backup", source);
    fs::copy(source, &backup_path)?;
    Ok(())
}

// Function to delete the backup file
fn delete_backup(source: &str) -> io::Result<()> {
    let backup_path = format!("{}.backup", source);
    fs::remove_file(backup_path)?;
    Ok(())
}

fn main() {
    // Define the source and destination paths
    let source = "source.txt";
    let destination = "destination.txt";

    // Create a backup of the source file
    if let Err(e) = create_backup(source) {
        eprintln!("Failed to create backup: {}", e);
        return;
    }

    // Move the file from source to destination
    if let Err(e) = move_file(source, destination) {
        eprintln!("Failed to move file: {}", e);
        return;
    }

    // Delete the backup file
    if let Err(e) = delete_backup(source) {
        eprintln!("Failed to delete backup: {}", e);
        return;
    }

    // Print success message
    println!("File moved successfully from {} to {}", source, destination);
}

