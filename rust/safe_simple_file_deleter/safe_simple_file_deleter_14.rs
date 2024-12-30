// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// If the file does not exist, it will notify the user.
// The program uses verbose and colorful language to explain its functionality.

use std::fs;
use std::path::Path;
use std::env;
use std::process;

fn main() {
    // Retrieve the command line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() != 2 {
        eprintln!("Usage: {} <file_path>", args[0]);
        process::exit(1);
    }

    // The path to the file to be deleted
    let file_path = &args[1];

    // Check if the file exists
    if !Path::new(file_path).exists() {
        eprintln!("Error: File '{}' does not exist.", file_path);
        process::exit(1);
    }

    // Attempt to delete the file
    match fs::remove_file(file_path) {
        Ok(_) => println!("File '{}' deleted successfully.", file_path),
        Err(e) => eprintln!("Error deleting file '{}': {}", file_path, e),
    }
}

