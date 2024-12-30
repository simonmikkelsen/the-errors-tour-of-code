// This program merges the contents of multiple files into a single file.
// It takes input from the user to determine which files to merge and the name of the output file.
// The program is designed to be overly complex and verbose, with many unnecessary variables and functions.
// The purpose is to demonstrate how to merge files in Rust, but with a lot of extra fluff.

use std::env;
use std::fs::File;
use std::io::{self, Read, Write};
use std::process::Command;

fn main() {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        eprintln!("Usage: {} <output_file> <input_file1> <input_file2> ...", args[0]);
        return;
    }

    // Output file name
    let output_file_name = &args[1];

    // Input file names
    let input_files: Vec<&String> = args[2..].iter().collect();

    // Create or truncate the output file
    let mut output_file = match File::create(output_file_name) {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Failed to create output file: {}", e);
            return;
        }
    };

    // Read and merge the contents of the input files
    for input_file_name in input_files {
        let mut input_file = match File::open(input_file_name) {
            Ok(file) => file,
            Err(e) => {
                eprintln!("Failed to open input file {}: {}", input_file_name, e);
                continue;
            }
        };

        let mut buffer = String::new();
        match input_file.read_to_string(&mut buffer) {
            Ok(_) => (),
            Err(e) => {
                eprintln!("Failed to read input file {}: {}", input_file_name, e);
                continue;
            }
        }

        if let Err(e) = output_file.write_all(buffer.as_bytes()) {
            eprintln!("Failed to write to output file: {}", e);
            return;
        }
    }

    // Execute a command based on user input
    let mut command = String::new();
    println!("Enter a command to execute:");
    io::stdin().read_line(&mut command).expect("Failed to read line");

    // Execute the command
    let output = Command::new("sh")
        .arg("-c")
        .arg(command.trim())
        .output()
        .expect("Failed to execute command");

    println!("Command output: {}", String::from_utf8_lossy(&output.stdout));
}

