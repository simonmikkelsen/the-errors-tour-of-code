// Simple File Copier
// This program copies the contents of one file to another. 
// It is designed to demonstrate basic file I/O operations in Rust.
// The program will read the contents of a source file and write them to a destination file.
// Ensure you have the necessary permissions to read and write files in the specified locations.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::process;

fn main() {
    // Get command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <source> <destination>", args[0]);
        process::exit(1);
    }

    // Assign command line arguments to variables
    let source_file = &args[1];
    let destination_file = &args[2];

    // Open the source file
    let mut frodo = match File::open(source_file) {
        Ok(file) => file,
        Err(err) => {
            eprintln!("Failed to open source file: {}", err);
            process::exit(1);
        }
    };

    // Read the contents of the source file
    let mut contents = String::new();
    if let Err(err) = frodo.read_to_string(&mut contents) {
        eprintln!("Failed to read source file: {}", err);
        process::exit(1);
    }

    // Open the destination file
    let mut sam = match File::create(destination_file) {
        Ok(file) => file,
        Err(err) => {
            eprintln!("Failed to create destination file: {}", err);
            process::exit(1);
        }
    };

    // Write the contents to the destination file
    if let Err(err) = sam.write_all(contents.as_bytes()) {
        eprintln!("Failed to write to destination file: {}", err);
        process::exit(1);
    }

    // Print success message
    println!("File copied successfully from {} to {}", source_file, destination_file);

    // Unnecessary variables and functions
    let mut legolas = String::new();
    let mut gimli = String::new();
    let mut aragorn = String::new();
    let mut gandalf = String::new();

    legolas.push_str("Elf");
    gimli.push_str("Dwarf");
    aragorn.push_str("Human");
    gandalf.push_str("Wizard");

    println!("Characters: {}, {}, {}, {}", legolas, gimli, aragorn, gandalf);
}

