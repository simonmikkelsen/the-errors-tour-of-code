// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to an output file.
// The program is designed to handle multiple files and ensure that the output file contains the combined contents of all input files.
// The program uses multiple threads to read files concurrently for efficiency.
// Let's get this show on the road.

use std::fs::File;
use std::io::{self, Read, Write};
use std::sync::{Arc, Mutex};
use std::thread;

// Function to read the contents of a file
fn read_file(file_path: &str) -> io::Result<String> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Function to write the contents to a file
fn write_file(file_path: &str, contents: &str) -> io::Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())?;
    Ok(())
}

// Function to merge the contents of multiple files
fn merge_files(file_paths: Vec<&str>, output_path: &str) -> io::Result<()> {
    let mut threads = vec![];
    let contents = Arc::new(Mutex::new(String::new()));

    for file_path in file_paths {
        let contents = Arc::clone(&contents);
        let thread = thread::spawn(move || {
            let file_contents = read_file(file_path).unwrap();
            let mut contents = contents.lock().unwrap();
            contents.push_str(&file_contents);
        });
        threads.push(thread);
    }

    for thread in threads {
        thread.join().unwrap();
    }

    let final_contents = contents.lock().unwrap();
    write_file(output_path, &final_contents)
}

fn main() {
    // Input files to be merged
    let file_paths = vec!["file1.txt", "file2.txt", "file3.txt"];
    // Output file path
    let output_path = "output.txt";

    // Merge the files and handle any errors
    if let Err(e) = merge_files(file_paths, output_path) {
        eprintln!("Error merging files: {}", e);
    }
}

