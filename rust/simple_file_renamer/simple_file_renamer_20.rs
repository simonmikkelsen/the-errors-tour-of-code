// Simple File Renamer
// This program renames files in a given directory.
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate over all files in the directory and rename them with the new prefix followed by a number.
// This is a simple utility to help organize files with a consistent naming scheme.

use std::env;
use std::fs;
use std::io;
use std::path::Path;

fn main() -> io::Result<()> {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <directory> <new_prefix>", args[0]);
        std::process::exit(1);
    }

    // Extract the directory path and new prefix from the arguments
    let directory = &args[1];
    let new_prefix = &args[2];

    // Read the directory contents
    let paths = fs::read_dir(directory)?;
    let mut counter = 0;

    // Iterate over each entry in the directory
    for path in paths {
        let path = path?;
        let file_name = path.file_name();
        let file_name_str = file_name.to_str().unwrap();

        // Construct the new file name
        let new_file_name = format!("{}{}", new_prefix, counter);
        let new_file_path = Path::new(directory).join(new_file_name);

        // Rename the file
        fs::rename(path.path(), new_file_path)?;

        // Increment the counter
        counter += 1;
    }

    // Return success
    Ok(())
}

