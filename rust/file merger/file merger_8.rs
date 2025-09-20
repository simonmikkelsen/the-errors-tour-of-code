// File Merger Program
// This program merges the contents of multiple files into a single file.
// It takes a list of file paths as input and writes their contents to an output file.
// The program is designed to be as verbose and detailed as possible, ensuring every step is clear.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;

// Function to read the contents of a file and return it as a String
fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write a string to a file
fn write_to_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Main function where the magic happens
fn main() {
    // Retrieve the command line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() < 3 {
        eprintln!("Usage: {} <output_file> <input_file1> <input_file2> ...", args[0]);
        return;
    }

    // The first argument is the output file path
    let output_file = &args[1];

    // Initialize an empty string to hold the merged contents
    let mut merged_contents = String::new();

    // Iterate over the input file paths
    for i in 2..args.len() {
        // Read the contents of the current file
        let file_path = &args[i];
        let contents = read_file(file_path).expect("Failed to read file");

        // Append the contents to the merged contents
        merged_contents.push_str(&contents);
    }

    // Write the merged contents to the output file
    write_to_file(output_file, &merged_contents).expect("Failed to write to output file");

    // Print a success message
    println!("Files merged successfully into {}", output_file);
}

