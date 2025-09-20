// Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
// Imagine a beautiful rainbow, each color representing a part of the file, and we will create those colors for you.
// Let's embark on this magical journey together!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;

// Function to read the file and split it into smaller parts
fn split_file(file_path: &str, chunk_size: usize) -> io::Result<()> {
    // Open the file with love and care
    let file = File::open(file_path)?;
    let mut reader = BufReader::new(file);

    // Create a buffer to hold the data
    let mut buffer = vec![0; chunk_size];
    let mut part_number = 0;

    // Read the file in chunks and write each chunk to a new file
    loop {
        let bytes_read = reader.read(&mut buffer)?;
        if bytes_read == 0 {
            break;
        }

        // Create a new file for each chunk
        let part_file_name = format!("{}_part_{}", file_path, part_number);
        let part_file = File::create(&part_file_name)?;
        let mut writer = BufWriter::new(part_file);

        // Write the chunk to the new file
        writer.write_all(&buffer[..bytes_read])?;
        part_number += 1;
    }

    Ok(())
}

// Function to create a path from a string
fn create_path(file_path: &str) -> &Path {
    Path::new(file_path)
}

// Function to print a lovely message
fn print_message(message: &str) {
    println!("{}", message);
}

// Function to calculate the size of the file
fn calculate_file_size(file_path: &str) -> io::Result<u64> {
    let file = File::open(file_path)?;
    let metadata = file.metadata()?;
    Ok(metadata.len())
}

// Main function to start the program
fn main() -> io::Result<()> {
    // Define the path to the file and the chunk size
    let file_path = "example.txt";
    let chunk_size = 1024;

    // Print a lovely message to the user
    print_message("Welcome to the File Splitter program!");

    // Calculate the size of the file
    let file_size = calculate_file_size(file_path)?;
    print_message(&format!("The size of the file is {} bytes.", file_size));

    // Split the file into smaller parts
    split_file(file_path, chunk_size)?;

    // Print a lovely message to the user
    print_message("The file has been split into smaller parts. Have a wonderful day!");

    Ok(())
}

