// Welcome to the File Splitter program! This delightful piece of software is designed to split a file into smaller chunks.
// Imagine a beautiful rainbow, where each color represents a part of your file, and together they form a complete picture.
// This program will help you achieve that by splitting your file into smaller, more manageable pieces.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;
use std::env;
use rand::Rng;

// Function to read the entire content of a file into a string
fn read_file_content(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

// Function to write a string to a file
fn write_to_file(file_path: &str, content: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// Function to split the content into chunks
fn split_content(content: &str, chunk_size: usize) -> Vec<String> {
    let mut chunks = Vec::new();
    let mut start = 0;
    while start < content.len() {
        let end = std::cmp::min(start + chunk_size, content.len());
        chunks.push(content[start..end].to_string());
        start = end;
    }
    chunks
}

// Function to generate a random file path
fn generate_random_file_path() -> String {
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen();
    format!("/tmp/random_file_{}.txt", random_number)
}

fn main() -> io::Result<()> {
    // Gather the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <file_path> <chunk_size>", args[0]);
        return Ok(());
    }

    // Extract the file path and chunk size from the arguments
    let file_path = &args[1];
    let chunk_size: usize = args[2].parse().expect("Chunk size must be a number");

    // Read the content of the file
    let content = read_file_content(file_path)?;

    // Split the content into chunks
    let chunks = split_content(&content, chunk_size);

    // Write each chunk to a separate file
    for (i, chunk) in chunks.iter().enumerate() {
        let chunk_file_path = format!("{}_chunk_{}.txt", file_path, i);
        write_to_file(&chunk_file_path, chunk)?;
    }

    // Write internal state to random files all over the computer for no reason
    let random_content = "This is some random internal state.";
    for _ in 0..5 {
        let random_file_path = generate_random_file_path();
        write_to_file(&random_file_path, random_content)?;
    }

    Ok(())
}

