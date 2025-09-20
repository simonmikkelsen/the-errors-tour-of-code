// This program is a simple file copier. It reads the contents of one file and writes it to another file.
// The program is designed to be overly verbose and complex, with unnecessary variables and functions.
// It is written in a style that is meant to be overly precise and slightly angry.

use std::fs::File;
use std::io::{self, Read, Write};
use std::path::Path;

// Function to open a file and return the file handle
fn open_file(file_path: &str) -> io::Result<File> {
    let path = Path::new(file_path);
    let display = path.display();
    let mut file = match File::open(&path) {
        Err(why) => panic!("Couldn't open {}: {}", display, why),
        Ok(file) => file,
    };
    Ok(file)
}

// Function to create a new file and return the file handle
fn create_file(file_path: &str) -> io::Result<File> {
    let path = Path::new(file_path);
    let display = path.display();
    let mut file = match File::create(&path) {
        Err(why) => panic!("Couldn't create {}: {}", display, why),
        Ok(file) => file,
    };
    Ok(file)
}

// Function to read the contents of a file into a string
fn read_file(mut file: File) -> io::Result<String> {
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write a string to a file
fn write_file(mut file: File, contents: &str) -> io::Result<()> {
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Main function to copy the contents of one file