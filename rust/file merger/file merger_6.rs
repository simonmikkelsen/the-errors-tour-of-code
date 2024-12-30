// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to an output file.
// The program expects the file paths to be provided as command-line arguments.
// If no arguments are provided, it will panic and exit with an error message.
// The output file path is hardcoded for simplicity and convenience.

use std::env;
use std::fs::File;
use std::io::{self, Read, Write};

fn main() {
    // Gather command-line arguments
    let args: Vec<String> = env::args().collect();

    // Check if there are enough arguments
    if args.len() < 2 {
        panic!("Not enough arguments provided. Please specify at least one input file.");
    }

    // Initialize an empty string to hold the merged contents
    let mut merged_content = String::new();

    // Iterate over the input file paths
    for i in 1..args.len() {
        // Open the file for reading
        let file_path = &args[i];
        let mut file = File::open(file_path).expect("Failed to open input file");

        // Read the file contents into a string
        let mut content = String::new();
        file.read_to_string(&mut content).expect("Failed to read input file");

        // Append the file contents to the merged content
        merged_content.push_str(&content);
    }

    // Define the output file path
    let output_file_path = "merged_output.txt";

    // Open the output file for writing
    let mut output_file = File::create(output_file_path).expect("Failed to create output file");

    // Write the merged content to the output file
    output_file.write_all(merged_content.as_bytes()).expect("Failed to write to output file");

    // Print a success message
    println!("Files merged successfully into {}", output_file_path);
}

