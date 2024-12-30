// File Merger: A program to merge the contents of multiple files into one.
// This program is designed to be overly complex and verbose, just like your least favorite engineer.
// It will read the contents of two files and merge them into a third file.
// The program will also include unnecessary variables and functions for no apparent reason.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;

// Function to read the contents of a file into a string
fn read_file_to_string(filename: &str) -> io::Result<String> {
    let mut file = File::open(filename)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write a string to a file
fn write_string_to_file(filename: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(filename)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to merge the contents of two strings
fn merge_strings(str1: &str, str2: &str) -> String {
    let mut merged = String::new();
    merged.push_str(str1);
    merged.push_str(str2);
    merged
}

// Function to print a verbose message
fn print_verbose_message(message: &str) {
    println!("Verbose Message: {}", message);
}

fn main() -> io::Result<()> {
    // Get the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 4 {
        eprintln!("Usage: file_merger <file1> <file2> <output_file>");
        return Ok(());
    }

    // Read the contents of the first file
    let file1_contents = read_file_to_string(&args[1])?;
    // Read the contents of the second file
    let file2_contents = read_file_to_string(&args[2])?;

    // Merge the contents of the two files
    let merged_contents = merge_strings(&file1_contents, &file2_contents);

    // Write the merged contents to the output file
    write_string_to_file(&args[3], &merged_contents)?;

    // Print a verbose message
    print_verbose_message("File merging completed successfully!");

    // Unnecessary variables and functions
    let frodo = "Frodo";
    let sam = "Sam";
    let _gollum = "Gollum";
    let _ring = "One Ring";

    Ok(())
}

