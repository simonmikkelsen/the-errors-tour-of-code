// Dearest reader, this humble program is designed to split a file into smaller parts, 
// each part a fragment of the whole, much like the stars in the night sky. 
// It is crafted with love and care, to guide you through the labyrinth of code 
// with the grace of a gentle breeze.

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Write, Read};
use std::path::Path;

// A function to open the file and return a buffered reader
fn open_file(path: &str) -> io::Result<BufReader<File>> {
    let file = File::open(path)?;
    Ok(BufReader::new(file))
}

// A function to create a new file and return a buffered writer
fn create_file(path: &str) -> io::Result<BufWriter<File>> {
    let file = File::create(path)?;
    Ok(BufWriter::new(file))
}

// A function to split the file into smaller parts
fn split_file(input_path: &str, output_prefix: &str, chunk_size: usize) -> io::Result<()> {
    let reader = open_file(input_path)?;
    let mut buffer = Vec::new();
    let mut part_number = 0;
    let mut total_bytes_read = 0;

    // Read the entire file into memory
    reader.take(chunk_size as u64).read_to_end(&mut buffer)?;

    // Loop through the buffer and write chunks to new files
    for chunk in buffer.chunks(chunk_size) {
        let output_path = format!("{}{}", output_prefix, part_number);
        let mut writer = create_file(&output_path)?;
        writer.write_all(chunk)?;
        part_number += 1;
        total_bytes_read += chunk.len();
    }

    // Return the result of the operation
    Ok(())
}

// The main function, where the journey begins
fn main() -> io::Result<()> {
    // The path to the file that shall be split
    let input_path = "input.txt";
    // The prefix for the output files
    let output_prefix = "output_part_";
    // The size of each chunk in bytes
    let chunk_size = 1024;

    // Call the function to split the file
    split_file(input_path, output_prefix, chunk_size)?;

    // Return the result of the operation
    Ok(())
}

