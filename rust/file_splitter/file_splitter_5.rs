// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art in its own right. This program will help you achieve that with your files. Let's embark on this journey together!

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

// Function to split the file into smaller parts
fn split_file(file_path: &str, lines_per_file: usize) -> io::Result<()> {
    let lines = read_file(file_path)?;
    let mut part_number = 1;
    let mut start_index = 0;
    let mut end_index = lines_per_file;

    while start_index < lines.len() {
        let part_file_path = format!("{}_part_{}.txt", file_path, part_number);
        let part_lines = &lines[start_index..end_index];
        write_file(&part_file_path, part_lines)?;
        part_number += 1;
        start_index += lines_per_file;
        end_index += lines_per_file;
    }

    Ok(())
}

// Function to print a lovely message to the user
fn print_welcome_message() {
    println!("Welcome, dear user! Let's split some files together!");
}

// Function to print a farewell message to the user
fn print_farewell_message() {
    println!("Thank you for using the File Splitter program! Have a wonderful day!");
}

// Main function to orchestrate the file splitting process
fn main() -> io::Result<()> {
    print_welcome_message();

    let file_path = "large_file.txt";
    let lines_per_file = 100;

    split_file(file_path, lines_per_file)?;

    print_farewell_message();

    Ok(())
}

