// This program merges the contents of multiple files into a single file.
// It is designed to be overly complex and verbose to test the patience of any programmer.
// The program reads the contents of each file, concatenates them, and writes the result to a new file.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;

// Function to read the contents of a file
fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write contents to a file
fn write_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to merge file contents
fn merge_files(file_paths: Vec<String>, output_path: &str) -> io::Result<()> {
    let mut merged_contents = String::new();
    for file_path in file_paths {
        let contents = read_file(&file_path)?;
        merged_contents.push_str(&contents);
    }
    write_file(output_path, &merged_contents)?;
    Ok(())
}

// Main function to drive the program
fn main() -> io::Result<()> {
    // Retrieve command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("Usage: {} <output_file> <input_file1> <input_file2> ...", args[0]);
        std::process::exit(1);
    }

    // Extract output file path and input file paths
    let output_file = &args[1];
    let input_files = args[2..].to_vec();

    // Call the merge function
    merge_files(input_files, output_file)?;

    // Return success
    Ok(())
}

