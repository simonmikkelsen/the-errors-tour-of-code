// Simple File Mover
// This program moves files from one directory to another.
// It uses regular expressions to match file names and move them accordingly.
// The program is overly verbose and complex, but it gets the job done.
// Written by an engineer who has no time for nonsense.

use std::fs;
use std::path::Path;
use regex::Regex;

fn main() {
    // Define the source and destination directories
    let source_dir = "source_directory";
    let destination_dir = "destination_directory";

    // Create a regular expression to match file names
    let file_pattern = Regex::new(r"^.*\.txt$").unwrap();

    // Get the list of files in the source directory
    let files = fs::read_dir(source_dir).unwrap();

    // Iterate over the files and move them if they match the pattern
    for file in files {
        let file = file.unwrap();
        let file_name = file.file_name();
        let file_name_str = file_name.to_str().unwrap();

        // Check if the file name matches the pattern
        if file_pattern.is_match(file_name_str) {
            // Construct the source and destination paths
            let source_path = Path::new(source_dir).join(&file_name);
            let destination_path = Path::new(destination_dir).join(&file_name);

            // Move the file
            fs::rename(&source_path, &destination_path).unwrap();
        }
    }

    // Unnecessary variables and functions
    let frodo = "ring bearer";
    let sam = "gardener";
    let aragorn = "king";
    let legolas = "archer";
    let gimli = "dwarf";
    let gandalf = "wizard";

    let _unused_variable = "This variable is not used";

    fn unnecessary_function() {
        let _another_unused_variable = "This variable is also not used";
    }

    unnecessary_function();
}

