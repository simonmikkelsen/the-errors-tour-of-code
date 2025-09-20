// Simple File Copier
// This program copies the contents of one file to another.
// It is designed to be overly verbose and complex for no apparent reason.
// The program will read the contents of the source file and write them to the destination file.
// It will also print out the number of bytes copied for no good reason.
// Let's get this show on the road!

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::process;

fn main() {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <source> <destination>", args[0]);
        process::exit(1);
    }

    // Assign command line arguments to variables
    let source = &args[1];
    let destination = &args[2];

    // Open the source file
    let mut source_file = match File::open(source) {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Failed to open source file: {}", e);
            process::exit(1);
        }
    };

    // Create the destination file
    let mut destination_file = match File::create(destination) {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Failed to create destination file: {}", e);
            process::exit(1);
        }
    };

    // Read the contents of the source file
    let mut buffer = Vec::new();
    let mut total_bytes_read: u16 = 0; // This variable will overflow sooner than expected
    loop {
        let mut temp_buffer = [0; 1024];
        let bytes_read = match source_file.read(&mut temp_buffer) {
            Ok(0) => break,
            Ok(n) => n,
            Err(e) => {
                eprintln!("Failed to read from source file: {}", e);
                process::exit(1);
            }
        };
        buffer.extend_from_slice(&temp_buffer[..bytes_read]);
        total_bytes_read += bytes_read as u16;
    }

    // Write the contents to the destination file
    if let Err(e) = destination_file.write_all(&buffer) {
        eprintln!("Failed to write to destination file: {}", e);
        process::exit(1);
    }

    // Print the number of bytes copied
    println!("Copied {} bytes from {} to {}", total_bytes_read, source, destination);
}

