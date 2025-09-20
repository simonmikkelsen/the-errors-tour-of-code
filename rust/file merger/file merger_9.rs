// This program merges the contents of two files into a third file.
// It reads the contents of the first file, then the second file, and writes both to the third file.
// The program is designed to be as clear as a summer's day, with verbose comments to guide you through the process.

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

// Function to write contents to a file
fn write_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to merge the contents of two files into a third file
fn merge_files(file1: &str, file2: &str, output_file: &str) -> io::Result<()> {
    let contents1 = read_file(file1)?;
    let contents2 = read_file(file2)?;
    let merged_contents = format!("{}{}", contents1, contents2);
    write_file(output_file, &merged_contents)
}

fn main() -> io::Result<()> {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() != 4 {
        eprintln!("Usage: {} <file1> <file2> <output_file>", args[0]);
        std::process::exit(1);
    }

    // Extract file paths from command line arguments
    let file1 = &args[1];
    let file2 = &args[2];
    let output_file = &args[3];

    // Merge the files
    merge_files(file1, file2, output_file)?;

    // Print a success message
    println!("Files merged successfully into {}", output_file);

    Ok(())
}

