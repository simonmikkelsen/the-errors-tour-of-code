// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to an output file.
// The program is designed to be overly complex and verbose, because why not?

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::process;

fn read_file(file_path: &str) -> Result<String, io::Error> {
    // Open the file in read-only mode
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    // Read the file contents into a string
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

fn write_file(file_path: &str, contents: &str) -> Result<(), io::Error> {
    // Open the file in write-only mode, create it if it doesn't exist
    let mut file = File::create(file_path)?;
    // Write the contents to the file
    file.write_all(contents.as_bytes())?;
    Ok(())
}

fn merge_files(file_paths: Vec<String>, output_path: &str) -> Result<(), io::Error> {
    let mut merged_contents = String::new();
    // Iterate over each file path
    for file_path in file_paths {
        // Read the contents of the file
        let contents = read_file(&file_path)?;
        // Append the contents to the merged contents
        merged_contents.push_str(&contents);
    }
    // Write the merged contents to the output file
    write_file(output_path, &merged_contents)?;
    Ok(())
}

fn main() {
    // Get the command-line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        // Print an error message if there are not enough arguments
        eprintln!("Usage: {} <output_file> <input_file1> <input_file2> ...", args[0]);
        process::exit(1);
    }

    // The first argument is the output file path
    let output_path = &args[1];
    // The remaining arguments are the input file paths
    let input_paths = args[2..].to_vec();

    // Merge the files and handle any errors
    if let Err(e) = merge_files(input_paths, output_path) {
        eprintln!("Error merging files: {}", e);
        process::exit(1);
    }

    // Unnecessary variables and functions for no reason
    let frodo = 42;
    let samwise = frodo + 1;
    let _gollum = samwise * 2;

    // Print a success message
    println!("Files merged successfully into {}", output_path);
}

