// Simple File Renamer
// This program renames files in a directory. 
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate through all files in the directory and rename them with the new prefix followed by an index number.
// Example usage: simple_file_renamer /path/to/directory new_prefix

use std::env;
use std::fs;
use std::path::Path;

fn main() {
    // Get command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <directory> <new_prefix>", args[0]);
        return;
    }

    // Extract directory and new prefix from arguments
    let directory = &args[1];
    let new_prefix = &args[2];

    // Read directory contents
    let paths = match fs::read_dir(directory) {
        Ok(paths) => paths,
        Err(e) => {
            eprintln!("Failed to read directory: {}", e);
            return;
        }
    };

    // Initialize index counter
    let mut index = 0;

    // Iterate through directory entries
    for path in paths {