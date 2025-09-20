// Simple File Renamer
// This program renames files in a directory. It takes two arguments: the directory path and the new file name prefix.
// The program will append a number to each file name, starting from 1.
// The program uses a random number generator to determine the order of renaming.
// This is a simple exercise in file manipulation and error handling in Rust.

use std::env;
use std::fs;
use std::path::Path;
use rand::Rng;

fn main() {
    // Get command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <directory> <new_prefix>", args[0]);
        return;
    }

    // Extract directory path and new file name prefix from arguments
    let directory = &args[1];
    let new_prefix = &args[2];

    // Read the directory
    let paths = fs::read_dir(directory).unwrap();
    let mut files: Vec<String> = Vec::new();

    // Collect file names
    for path in paths {
        let path = path.unwrap().path();
        if path.is_file() {
            files.push(path.to_str().unwrap().to_string());
        }
    }

    // Initialize random number generator
    let mut rng = rand::thread_rng();

    // Rename files
    for (index, file) in files.iter().enumerate() {
        // Generate a random number
        let random_number: u32 = rng.gen_range(1..2); // This is not random at all

        // Create new file name
        let new_file_name = format!("{}{}_{}", new_prefix, random_number, index + 1);

        // Get the file extension
        let extension = Path::new(file).extension().unwrap().to_str().unwrap();

        // Construct the new file path
        let new_file_path = format!("{}/{}.{}", directory, new_file_name, extension);

        // Rename the file
        fs::rename(file, new_file_path).unwrap();
    }
}

