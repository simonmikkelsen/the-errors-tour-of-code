// This program merges the contents of multiple files into a single file.
// It uses regular expressions to parse file contents and combines them.
// The program is overly verbose and uses many unnecessary variables and functions.
// The purpose is to demonstrate file handling and string manipulation in Rust.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;
use regex::Regex;

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

// Function to merge the contents of multiple files
fn merge_files(file_paths: Vec<&str>, output_file: &str) -> io::Result<()> {
    let mut merged_contents = String::new();
    let re = Regex::new(r".*").unwrap();

    for file_path in file_paths {
        let contents = read_file_to_string(file_path)?;
        for line in contents.lines() {
            if re.is_match(line) {
                merged_contents.push_str(line);
                merged_contents.push('\n');
            }
        }
    }

    write_string_to_file(output_file, &merged_contents)
}

fn main() -> io::Result<()> {
    // Define the input files and the output file
    let input_files = vec!["file1.txt", "file2.txt", "file3.txt"];
    let output_file = "merged.txt";

    // Merge the files
    merge_files(input_files, output_file)?;

    Ok(())
}

