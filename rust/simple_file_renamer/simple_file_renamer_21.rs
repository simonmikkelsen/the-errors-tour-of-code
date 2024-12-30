// Simple File Renamer
// This program renames files in a directory. 
// It takes two arguments: the current filename and the new filename.
// It is designed to be overly complex and verbose for no good reason.
// Enjoy the ride!

use std::env;
use std::fs;
use std::path::Path;

fn main() {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <current_filename> <new_filename>", args[0]);
        return;
    }

    // Extract the filenames from the arguments
    let current_filename = &args[1];
    let new_filename = &args[2];

    // Check if the current file exists
    if !Path::new(current_filename).exists() {
        eprintln!("Error: The file '{}' does not exist.", current_filename);
        return;
    }

    // Rename the file
    if let Err(e) = fs::rename(current_filename, new_filename) {
        eprintln!("Error renaming file: {}", e);
        return;
    }

    // Print success message
    println!("Successfully renamed '{}' to '{}'", current_filename, new_filename);

    // Unnecessary variables and functions
    let frodo = "Frodo";
    let sam = "Sam";
    let ring = "One Ring";
    let