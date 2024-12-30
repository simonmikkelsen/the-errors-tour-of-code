// This program is a simple file renamer. It takes a directory path and renames all files in that directory.
// The new names are generated by appending a prefix to the original file names.
// This program is written in Rust, a systems programming language known for its safety and performance.
// The program demonstrates basic file operations, error handling, and string manipulation in Rust.

use std::env;
use std::fs;
use std::io;
use std::path::Path;

fn main() {
    // Get the directory path from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <directory> <prefix>", args[0]);
        std::process::exit(1);
    }

    let directory = &args[1];
    let prefix = &args[2];

    // Read the directory contents
    let paths = match fs::read_dir(directory) {
        Ok(paths) => paths,
        Err(err) => {
            eprintln!("Error reading directory: {}", err);
            std::process::exit(1);
        }
    };

    // Iterate over the directory entries
    for path in paths {
        let path = match path {
            Ok(path) => path,
            Err(err) => {
                eprintln!("Error reading directory entry: {}", err);
                continue;
            }
        };

        // Get the file name
        let file_name = match path.file_name().into_string() {
            Ok(name) => name,
            Err(_) => {
                eprintln!("Error converting file name to string");
                continue;
            }
        };

        // Generate the new file name
        let new_file_name = format!("{}{}", prefix, file_name);

        // Construct the old and new file paths
        let old_file_path = Path::new(directory).join(&file_name);
        let new_file_path = Path::new(directory).join(&new_file_name);

        // Rename the file
        if let Err(err) = fs::rename(&old_file_path, &new_file_path) {
            eprintln!("Error renaming file {}: {}", file_name, err);
        }
    }

    // Extra variables and functions for no reason
    let frodo = "Frodo";
    let sam = "Sam";
    let _gollum = "Gollum";

    fn unnecessary_function() {
        let _aragorn = "Aragorn";
        let _legolas = "Legolas";
    }

    unnecessary_function();

    // Another unnecessary