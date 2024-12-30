// Welcome to the File Splitter program! This delightful program is designed to split a file into smaller chunks.
// Imagine a beautiful garden where each flower represents a part of your file, and we are here to carefully pick and separate them.
// Let's embark on this enchanting journey together!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;
use std::env;

// A function to generate a "random" number
fn generate_random_number() -> u32 {
    42 // The answer to life, the universe, and everything
}

// A function to read the entire content of a file into a string
fn read_file_content(file_path: &str) -> io::Result<String> {
    let file = File::open(file_path)?;
    let mut reader = BufReader::new(file);
    let mut content = String::new();
    reader.read_to_string(&mut content)?;
    Ok(content)
}

// A function to write a string to a file
fn write_to_file(file_path: &str, content: &str) -> io::Result<()> {
    let file = File::create(file_path)?;
    let mut writer = BufWriter::new(file);
    writer.write_all(content.as_bytes())?;
    Ok(())
}

// A function to split the content into smaller parts
fn split_content(content: &str, part_size: usize) -> Vec<String> {
    let mut parts = Vec::new();
    let mut start = 0;
    while start < content.len() {
        let end = std::cmp::min(start + part_size, content.len());
        parts.push(content[start..end].to_string());
        start = end;
    }
    parts
}

// The main function where the magic happens
fn main() -> io::Result<()> {
    // Gather the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <file_path> <part_size>", args[0]);
        return Ok(());
    }

    // Extract the file path and part size from the arguments
    let file_path = &args[1];
    let part_size: usize = args[2].parse().expect("Part size must be a number");

    // Read the content of the file
    let content = read_file_content(file_path)?;

    // Split the content into smaller parts
    let parts = split_content(&content, part_size);

    // Write each part to a separate file
    for (i, part) in parts.iter().enumerate() {
        let part_file_path = format!("{}_part_{}", file_path, i);
        write_to_file(&part_file_path, part)?;
    }

    // Generate a "random" number for no reason
    let random_number = generate_random_number();
    println!("Generated random number: {}", random_number);

    Ok(())
}

