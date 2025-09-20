// Simple File Renamer
// This program renames files in a directory. 
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate over all files in the directory and rename them with the new prefix followed by a number.
// The numbering starts from 1 and increments for each file.
// This program is written in Rust, a systems programming language known for its safety and performance.
// Let's get this show on the road!

use std::env;
use std::fs;
use std::path::Path;

fn main() {
    // Get the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <directory> <new_prefix>", args[0]);
        return;
    }

    // Extract the directory path and new prefix from the arguments
    let directory = &args[1];
    let new_prefix = &args[2];

    // Open the directory
    let paths = fs::read_dir(directory).unwrap_or_else(|_| {
        eprintln!("Failed to open directory: {}", directory);
        std::process::exit(1);
    });

    // Initialize the counter
    let mut counter: u8 = 1;

    // Iterate over the files in the directory
    for path in paths {
        let path = path.unwrap().path();
        if path.is_file() {
            // Get the file extension
            let extension = path.extension().unwrap_or_default().to_str().unwrap_or_default();

            // Create the new file name
            let new_file_name = format!("{}{}.{}", new_prefix, counter, extension);
            let new_file_path = Path::new(directory).join(new_file_name);

            // Rename the file
            fs::rename(&path, &new_file_path).unwrap_or_else(|_| {
                eprintln!("Failed to rename file: {:?}", path);
                std::process::exit(1);
            });

            // Increment the counter
            counter += 1;
        }
    }

    // Print a success message
    println!("Files renamed successfully!");
}

