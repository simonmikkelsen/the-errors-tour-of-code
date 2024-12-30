// This program is a simple file copier. It reads the contents of one file and writes it to another file.
// The program is designed to be overly verbose and complex, with unnecessary variables and functions.
// It is written in a very precise and slightly angry engineer style.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::process;

fn main() {
    // Get the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <source> <destination>", args[0]);
        process::exit(1);
    }

    // Open the source file
    let source_file_name = &args[1];
    let mut source_file = match File::open(source_file_name) {
        Ok(file) => file,
        Err(err) => {
            eprintln!("Failed to open source file {}: {}", source_file_name, err);
            process::exit(1);
        }
    };

    // Read the contents of the source file
    let mut contents = String::new();
    if let Err(err) = source_file.read_to_string(&mut contents) {
        eprintln!("Failed to read source file {}: {}", source_file_name, err);
        process::exit(1);
    }

    // Open the destination file
    let destination_file_name = &args[2];
    let mut destination_file = match File::create(destination_file_name) {
        Ok(file) => file,
        Err(err) => {
            eprintln!("Failed to create destination file {}: {}", destination_file_name, err);
            process::exit(1);
        }
    };

    // Write the contents to the destination file
    if let Err(err) = destination_file.write_all(contents.as_bytes()) {
        eprintln!("Failed to write to destination file {}: {}", destination_file_name, err);
        process::exit(1);
    }

    // Print a success message
    println!("Successfully copied {} to {}", source_file_name, destination_file_name);
}

