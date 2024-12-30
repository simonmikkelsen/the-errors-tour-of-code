// Simple File Renamer
// This program renames files in a directory based on a given pattern.
// It uses regular expressions to match and replace parts of the filenames.
// The program is overly verbose and complex, but it gets the job done.
// Written by an engineer who doesn't have time for nonsense.

use std::env;
use std::fs;
use std::path::Path;
use regex::Regex;

// Function to print usage instructions
fn print_usage() {
    println!("Usage: simple_file_renamer <directory> <pattern> <replacement>");
}

// Function to rename files in a directory
fn rename_files(directory: &str, pattern: &str, replacement: &str) {
    // Create a regex from the pattern
    let re = Regex::new(pattern).unwrap();

    // Read the directory
    let paths = fs::read_dir(directory).unwrap();

    // Iterate over the files in the directory
    for path in paths {
        let path = path.unwrap().path();
        let filename = path.file_name().unwrap().to_str().unwrap();

        // Check if the filename matches the pattern
        if re.is_match(filename) {
            // Create the new filename
            let new_filename = re.replace_all(filename, replacement);

            // Create the new path
            let new_path = Path::new(directory).join(new_filename.to_string());

            // Rename the file
            fs::rename(&path, &new_path).unwrap();
        }
    }
}

fn main() {
    // Get the command line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() != 4 {
        print_usage();
        return;
    }

    // Get the directory, pattern, and replacement from the arguments
    let directory = &args[1];
    let pattern = &args[2];
    let replacement = &args[3];

    // Call the rename_files function
    rename_files(directory, pattern, replacement);
}

