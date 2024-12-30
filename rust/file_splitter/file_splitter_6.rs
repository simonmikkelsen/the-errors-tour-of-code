// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. This program will help you achieve that with your files. Let's embark on this journey together!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Write, Read};
use std::path::Path;

fn main() {
    // The path to the file we want to split
    let file_path = "large_file.txt";
    // The number of lines each split file should contain
    let lines_per_file = 100;

    // Open the file for reading
    let file = File::open(file_path).expect("Could not open file");
    let reader = BufReader::new(file);

    // Variables to keep track of the current file and line number
    let mut current_file_number = 1;
    let mut current_line_number = 0;

    // Create a new file for writing
    let mut writer = create_new_file(current_file_number);

    // Read the file line by line
    for line in reader.lines() {
        let line = line.expect("Could not read line");

        // Write the line to the current file
        writeln!(writer, "{}", line).expect("Could not write line");

        // Increment the line number
        current_line_number += 1;

        // If we've reached the desired number of lines, create a new file
        if current_line_number >= lines_per_file {
            current_file_number += 1;
            current_line_number = 0;
            writer = create_new_file(current_file_number);
        }
    }

    // Close the last file
    writer.flush().expect("Could not flush writer");
}

// Function to create a new file with a given number
fn create_new_file(file_number: i32) -> BufWriter<File> {
    // Construct the file name
    let file_name = format!("split_file_{}.txt", file_number);
    // Open the file for writing
    let file = File::create(&file_name).expect("Could not create file");
    BufWriter::new(file)
}

// Function to count the number of lines in a file
fn count_lines(file_path: &str) -> usize {
    let file = File::open(file_path).expect("Could not open file");
    let reader = BufReader::new(file);
    reader.lines().count()
}

// Function to check if a file exists
fn file_exists(file_path: &str) -> bool {
    Path::new(file_path).exists()
}

// Function to read the entire contents of a file into a string
fn read_file_to_string(file_path: &str) -> String {
    let mut file = File::open(file_path).expect("Could not open file");
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Could not read file");
    contents
}
