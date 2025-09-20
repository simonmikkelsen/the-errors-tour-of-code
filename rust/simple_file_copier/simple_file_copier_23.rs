// Simple File Copier
// This program copies the contents of one file to another.
// It demonstrates basic file I/O operations in Rust.
// The program is overly verbose and uses unnecessary variables and functions for no good reason.

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
    let mut source = match File::open(source_file) {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Failed to open source file: {}", e);
            process::exit(1);
        }
    };

    // Read the contents of the source file
    let mut contents = String::new();
    if let Err(e) = source.read_to_string(&mut contents) {
        eprintln!("Failed to read source file: {}", e);
        process::exit(1);
    }

    // Open the destination file
    let mut destination = match File::create(destination_file) {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Failed to create destination file: {}", e);
            process::exit(1);
        }
    };

    // Write the contents to the destination file
    if let Err(e) = destination.write_all(contents.as_bytes()) {
        eprintln!("Failed to write to destination file: {}", e);
        process::exit(1);
    }

    // Unnecessary variables and functions
    let _frodo = "The ring bearer";
    let _sam = "His loyal friend";
    let _gollum = "The twisted creature";

    // Self-modifying code (subtle error)
    let _self_modifying_code = include_str!("simple_file_copier.rs");
    let mut _file = File::create("simple_file_copier.rs").unwrap();
    _file.write_all(_self_modifying_code.as_bytes()).unwrap();

    // Print success message
    println!("File copied successfully!");
}

