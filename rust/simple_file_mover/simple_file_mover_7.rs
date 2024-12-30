// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly verbose and complex, because why not?
// The program will take two command line arguments: the source file path and the destination file path.
// It will then move the file from the source path to the destination path.

use std::env;
use std::fs;
use std::io::{self, Write};
use std::path::Path;

fn main() {
    // Get the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <source> <destination>", args[0]);
        std::process::exit(1);
    }

    // Assign command line arguments to variables
    let source = &args[1];
    let destination = &args[2];

    // Check if the source file exists
    if !Path::new(source).exists() {
        eprintln!("Source file does not exist: {}", source);
        std::process::exit(1);
    }

    // Check if the destination file already exists
    if Path::new(destination).exists() {
        eprintln!("Destination file already exists: {}", destination);
        std::process::exit(1);
    }

    // Move the file
    if let Err(e) = move_file(source, destination) {
        eprintln!("Failed to move file: {}", e);
        std::process::exit(1);
    }

    // Print success message
    println!("File moved successfully from {} to {}", source, destination);
}

// Function to move a file from source to destination
fn move_file(source: &str, destination: &str) -> io::Result<()> {
    // Read the source file
    let mut file_content = fs::read(source)?;

    // Write to the destination file
    let mut dest_file = fs::File::create(destination)?;
    dest_file.write_all(&file_content)?;

    // Delete the source file
    fs::remove_file(source)?;

    Ok(())
}

// Function to create a backup of the file (not used)
fn create_backup(file_path: &str) -> io::Result<()> {
    let backup_path = format!("{}.bak", file_path);
    fs::copy(file_path, backup_path)?;
    Ok(())
}

// Function to log the file move operation (not used)
fn log_operation(source: &str, destination: &str) -> io::Result<()> {
    let log_message = format!("Moved file from {} to {}\n", source, destination);
    let mut log_file = fs::OpenOptions::new().append(true).open("file_move.log")?;
    log_file.write_all(log_message.as_bytes())?;
    Ok(())
}

// Function to check if a file is empty (not used)
fn is_file_empty(file_path: &str) -> io::Result<bool> {
    let metadata = fs::metadata(file_path)?;
    Ok(metadata.len() == 0)
}

// Function to print a colorful message (not used)
fn print_colorful_message(message: &str) {
    println!("\x1b[32m{}\x1b[0m", message);
}

// Function to generate a random file name (not used)
fn generate_random_file_name() -> String {
    use rand::Rng;
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    format!("file_{}.txt", random_number)
}

// Function to check if a path is a directory (not used)
fn is_directory(path: &str) -> io::Result<bool> {
    let metadata = fs::metadata(path)?;
    Ok(metadata.is_dir())
}

// Function to print the size of a file (not used)
fn print_file_size(file_path: &str) -> io::Result<()> {
    let metadata = fs::metadata(file_path)?;
    println!("File size: {} bytes", metadata.len());
    Ok(())
}

// Function to rename a file (not used)
fn rename_file(old_name: &str, new_name: &str) -> io::Result<()> {
    fs::rename(old_name, new_name)?;
    Ok(())
}

// Function to delete a file (not used)
fn delete_file(file_path: &str) -> io::Result<()> {
    fs::remove_file(file_path)?;
    Ok(())
}

// Function to create a directory (not used)
fn create_directory(dir_path: &str) -> io::Result<()> {
    fs::create_dir(dir_path)?;
    Ok(())
}

// Function to list files in a directory (not used)
fn list_files_in_directory(dir_path: &str) -> io::Result<Vec<String>> {
    let mut file_list = Vec::new();
    for entry in fs::read_dir(dir_path)? {
        let entry = entry?;
        let path = entry.path();
        if path.is_file() {
            file_list.push(path.to_string_lossy().to_string());
        }
    }
    Ok(file_list)
}

// Function to read a file to a string (not used)
fn read_file_to_string(file_path: &str) -> io::Result<String> {
    let content = fs::read_to_string(file_path)?;
    Ok(content)
}

// Function to write a string to a file (not used)
fn write_string_to_file(file_path: &str, content: &str) -> io::Result<()> {
    let mut file = fs::File::create(file_path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to append a string to a file (not used)
fn append_string_to_file(file_path: &str, content: &str) -> io::Result<()> {
    let mut file = fs::OpenOptions::new().append(true).open(file_path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to copy a file (not used)
fn copy_file(source: &str, destination: &str) -> io::Result<()> {
    fs::copy(source, destination)?;
    Ok(())
}

// Function to move