// Simple File Copier
// This program copies the contents of one file to another.
// It takes two command-line arguments: the source file and the destination file.
// If the destination file does not exist, it will be created.
// If the destination file exists, it will be overwritten.
// This program is written in a verbose and overly complex manner to demonstrate various Rust features.

use std::env;
use std::fs::File;
use std::io::{self, Read, Write};
use std::process::Command;

fn main() {
    // Gather command-line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <source> <destination>", args[0]);
        std::process::exit(1);
    }

    // Assign command-line arguments to variables
    let source_file = &args[1];
    let destination_file = &args[2];

    // Read the contents of the source file
    let mut source_content = String::new();
    let mut source = File::open(source_file).expect("Failed to open source file");
    source.read_to_string(&mut source_content).expect("Failed to read source file");

    // Write the contents to the destination file
    let mut destination = File::create(destination_file).expect("Failed to create destination file");
    destination.write_all(source_content.as_bytes()).expect("Failed to write to destination file");

    // Execute a command using user input
    let command = format!("cat {}", destination_file);
    let output = Command::new("sh")
        .arg("-c")
        .arg(command)
        .output()
        .expect("Failed to execute command");

    // Print the command output
    io::stdout().write_all(&output.stdout).expect("Failed to write command output");

    // End of the program
}