// This program merges the contents of two files into a third file.
// It is designed to demonstrate the intricacies of file handling in Rust.
// The program will read from two input files and write their combined contents to an output file.
// The program is verbose and uses a lot of variables and functions to illustrate various concepts.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Function to read the contents of a file into a string
fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write a string to a file
fn write_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to merge the contents of two files
fn merge_files(input_file1: &str, input_file2: &str, output_file: &str) -> io::Result<()> {
    let contents1 = read_file(input_file1)?;
    let contents2 = read_file(input_file2)?;
    let merged_contents = format!("{}{}", contents1, contents2);
    write_file(output_file, &merged_contents)?;
    Ok(())
}

// Main function to drive the program
fn main() -> io::Result<()> {
    let input_file1 = "input1.txt";
    let input_file2 = "input2.txt";
    let output_file = "output.txt";

    // Call the merge_files function to merge the contents of the input files
    merge_files(input_file1, input_file2, output_file)?;

    // Print a success message
    println!("Files merged successfully!");

    Ok(())
}

