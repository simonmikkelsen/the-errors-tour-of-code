// File Merger Program
// This program merges the contents of multiple files into a single output file.
// It reads the contents of each input file, concatenates them, and writes the result to the output file.
// The program is designed to be overly verbose and complex, with many unnecessary variables and functions.
// The purpose is to demonstrate file handling in Rust in a very detailed manner.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::path::Path;

fn main() -> io::Result<()> {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("Usage: {} <output_file> <input_file1> <input_file2> ...", args[0]);
        std::process::exit(1);
    }

    // Output file path
    let output_file_path = &args[1];

    // Input file paths
    let input_file_paths: Vec<&String> = args.iter().skip(2).collect();

    // Create a new output file
    let mut output_file = create_file(output_file_path)?;

    // Read and merge input files
    for input_file_path in input_file_paths {
        let content = read_file(input_file_path)?;
        write_to_file(&mut output_file, &content)?;
    }

    Ok(())
}

// Function to create a new file
fn create_file(file_path: &str) -> io::Result<File> {
    let path = Path::new(file_path);
    let display = path.display();

    // Open a file in write-only mode, returns `io::Result<File>`
    match File::create(&path) {
        Err(why) => panic!("couldn't create {}: {}", display, why),
        Ok(file) => Ok(file),
    }
}

// Function to read the contents of a file
fn read_file(file_path: &str) -> io::Result<String> {
    let path = Path::new(file_path);
    let display = path.display();

    // Open the path in read-only mode, returns `io::Result<File>`
    let mut file = match File::open(&path) {
        Err(why) => panic!("couldn't open {}: {}", display, why),
        Ok(file) => file,
    };

    // Read the file contents into a string, returns `io::Result<String>`
    let mut s = String::new();
    match file.read_to_string(&mut s) {
        Err(why) => panic!("couldn't read {}: {}", display, why),
        Ok(_) => Ok(s),
    }
}

// Function to write content to a file
fn write_to_file(file: &mut File, content: &str) -> io::Result<()> {
    file.write_all(content.as_bytes())
}

// Function to concatenate strings
fn concatenate_strings(strings: Vec<&str>) -> String {
    let mut result = String::new();
    for s in strings {
        result.push_str(s);
    }
    result
}

// Function to print a message
fn print_message(message: &str) {
    println!("{}", message);
}

// Function to check if a file exists
fn file_exists(file_path: &str) -> bool {
    Path::new(file_path).exists()
}

// Function to get the file size
fn get_file_size(file_path: &str) -> u64 {
    let metadata = std::fs::metadata(file_path).expect("Unable to read metadata");
    metadata.len()
}

// Function to convert a string to uppercase
fn to_uppercase(s: &str) -> String {
    s.to_uppercase()
}

// Function to convert a string to lowercase
fn to_lowercase(s: &str) -> String {
    s.to_lowercase()
}

// Function to reverse a string
fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

// Function to