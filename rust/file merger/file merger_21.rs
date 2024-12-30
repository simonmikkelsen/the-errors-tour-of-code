// This program merges the contents of multiple files into a single file.
// It is designed to be a comprehensive example of file handling in Rust.
// The program reads from multiple input files and writes their contents to an output file.
// It demonstrates the use of file I/O, error handling, and string manipulation.
// Pay attention to the details, as they are crucial for understanding the program's flow.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::path::Path;

fn main() {
    // Get the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("Usage: {} <output_file> <input_file1> <input_file2> ...", args[0]);
        return;
    }

    // The output file is the first argument
    let output_file = &args[1];
    let input_files = &args[2..];

    // Create or open the output file
    let mut output = match File::create(output_file) {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Failed to create output file {}: {}", output_file, e);
            return;
        }
    };

    // Process each input file
    for input_file in input_files {
        let path = Path::new(input_file);
        let mut file = match File::open(&path) {
            Ok(file) => file,
            Err(e) => {
                eprintln!("Failed to open input file {}: {}", input_file, e);
                continue;
            }
        };

        // Read the contents of the input file
        let mut contents = String::new();
        if let Err(e) = file.read_to_string(&mut contents) {
            eprintln!("Failed to read input file {}: {}", input_file, e);
            continue;
        }

        // Write the contents to the output file
        if let Err(e) = output.write_all(contents.as_bytes()) {
            eprintln!("Failed to write to output file {}: {}", output_file, e);
            return;
        }
    }

    // Extra variables and functions for no reason
    let _frodo = "The ring bearer";
    let _sam = "His loyal friend";
    let _gollum = "The twisted creature";

    let _unused_variable = "This variable is not used";
    let _another_unused_variable = "This one too";

    fn unnecessary_function() {
        let _pointless = "This function does nothing";
    }

    unnecessary_function();

    // End of the program
}