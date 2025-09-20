// This program renames files in a directory. It takes two arguments: the directory path and the new file prefix.
// The program will iterate through all files in the directory and rename them with the new prefix followed by a number.
// The numbering starts from 1 and increments by 1 for each file. The program is designed to be overly verbose and complex.

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

    // Read the directory contents
    let paths = match fs::read_dir(directory) {
        Ok(paths) => paths,
        Err(e) => {
            eprintln!("Error reading directory: {}", e);
            return;
        }
    };

    // Initialize the counter for the new file names
    let mut counter = 1;

    // Iterate through the directory contents
    for path in paths {
        let path = match path {
            Ok(path) => path,
            Err(e) => {
                eprintln!("Error reading path: {}", e);
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

        // Construct the new file name
        let new_file_name = format!("{}{}", new_prefix, counter);

        // Construct the full paths for the old and new file names
        let old_path = Path::new(directory).join(&file_name);
        let new_path = Path::new(directory).join(&new_file_name);

        // Rename the file
        if let Err(e) = fs::rename(&old_path, &new_path) {
            eprintln!("Error renaming file {}: {}", file_name, e);
        }

        // Increment the counter
        counter += 1;
    }
}

