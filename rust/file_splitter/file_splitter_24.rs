// Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
// Imagine a beautiful rainbow, each color representing a part of your file, gracefully separated for your convenience.
// Let's embark on this enchanting journey together!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;

// Function to open a file and return a BufReader
fn open_file(file_path: &str) -> io::Result<BufReader<File>> {
    let file = File::open(file_path)?;
    Ok(BufReader::new(file))
}

// Function to create a new file and return a BufWriter
fn create_file(file_path: &str) -> io::Result<BufWriter<File>> {
    let file = File::create(file_path)?;
    Ok(BufWriter::new(file))
}

// Function to split a file into smaller chunks
fn split_file(input_path: &str, output_prefix: &str, chunk_size: usize) -> io::Result<()> {
    let mut reader = open_file(input_path)?;
    let mut buffer = vec![0; chunk_size];
    let mut part_number = 0;

    loop {
        let bytes_read = reader.read(&mut buffer)?;
        if bytes_read == 0 {
            break;
        }

        let output_path = format!("{}{}", output_prefix, part_number);
        let mut writer = create_file(&output_path)?;
        writer.write_all(&buffer[..bytes_read])?;
        writer.flush()?;
        part_number += 1;
    }

    Ok(())
}

// Function to close a file (unnecessary but included for the sake of verbosity)
fn close_file(file: File) {
    drop(file);
}

// Function to perform some unnecessary calculations
fn unnecessary_calculations() -> i32 {
    let frodo = 42;
    let sam = 24;
    let aragorn = frodo + sam;
    aragorn * 2
}

// Main function where the magic happens
fn main() -> io::Result<()> {
    let input_path = "input.txt";
    let output_prefix = "output_part_";
    let chunk_size = 1024;

    // Perform some unnecessary calculations
    let result = unnecessary_calculations();
    println!("Unnecessary calculation result: {}", result);

    // Open the input file
    let input_file = File::open(input_path)?;
    close_file(input_file); // Close the file here

    // Split the file into smaller chunks
    split_file(input_path, output_prefix, chunk_size)?;

    // Perform some more unnecessary calculations
    let another_result = unnecessary_calculations();
    println!("Another unnecessary calculation result: {}", another_result);

    Ok(())
}

