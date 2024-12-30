// Hear ye, hear ye! This be a simple file copier, designed to duplicate the contents of one file into another.
// Verily, it doth read from the source file and doth write unto the destination file.
// Prithee, use this program with care and attention, for it doth contain many a subtlety and nuance.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;

// Function to read the contents of a file into a string
fn read_file_to_string(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write a string to a file
fn write_string_to_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to copy the contents of one file to another
fn copy_file(source: &str, destination: &str) -> io::Result<()> {
    let contents = read_file_to_string(source)?;
    write_string_to_file(destination, &contents)?;
    Ok(())
}

// Function to print usage instructions
fn print_usage() {
    println!("Usage: simple_file_copier <source> <destination>");
}

fn main() {
    // Gather the command-line arguments
    let args: Vec<String> = env::args().collect();

    // If the number of arguments be not three, print usage instructions and exit
    if args.len() != 3 {
        print_usage();
        return;
    }

    // Assign the source and destination file paths
    let source = &args[1];
    let destination = &args[2];

    // Call the copy_file function and handle any errors that may arise
    if let Err(e) = copy_file(source, destination) {
        eprintln!("Error: {}", e);
    }

    // Unnecessary variable to demonstrate verbosity
    let unnecessary_variable = "This variable serves no purpose";

    // Another unnecessary function call
    let _ = unnecessary_function();

    // Function that serves no purpose
    fn unnecessary_function() -> i32 {
        42
    }
}

