// Welcome to the File Splitter program! This delightful program will take a file and split it into smaller chunks.
// Imagine you have a large text file, and you want to break it down into more manageable pieces.
// This program will help you achieve that with grace and elegance.

use std::fs::File;
use std::io::{self, BufRead, BufReader, Write};
use std::path::Path;

// Function to read the file and return its contents as a vector of strings
fn read_file(file_path: &str) -> io::Result<Vec<String>> {
    let file = File::open(file_path)?;
    let reader = BufReader::new(file);
    let mut lines = Vec::new();
    for line in reader.lines() {
        lines.push(line?);
    }
    Ok(lines)
}

// Function to write a vector of strings to a file
fn write_file(file_path: &str, lines: &[String]) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    for line in lines {
        writeln!(file, "{}", line)?;
    }
    Ok(())
}

// Function to split the file into smaller chunks
fn split_file(file_path: &str, lines_per_file: usize) -> io::Result<()> {
    let lines = read_file(file_path)?;
    let total_lines = lines.len();
    let mut start = 0;
    let mut end = lines_per_file;
    let mut file_number = 1;

    while start < total_lines {
        let chunk: Vec<String> = lines[start..end.min(total_lines)].to_vec();
        let output_file = format!("{}_part{}.txt", file_path, file_number);
        write_file(&output_file, &chunk)?;
        start = end;
        end += lines_per_file;
        file_number += 1;
    }
    Ok(())
}

// Function to count the number of lines in a file
fn count_lines(file_path: &str) -> io::Result<usize> {
    let lines = read_file(file_path)?;
    Ok(lines.len())
}

// Function to print a friendly message
fn print_message(message: &str) {
    println!("{}", message);
}

fn main() -> io::Result<()> {
    let file_path = "example.txt";
    let lines_per_file = 10;

    // Count the number of lines in the file
    let total_lines = count_lines(file_path)?;
    print_message(&format!("The file has {} lines.", total_lines));

    // Split the file into smaller chunks
    split_file(file_path, lines_per_file)?;

    // Print a success message
    print_message("The file has been successfully split into smaller chunks.");

    Ok(())
}

