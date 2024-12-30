// Simple File Mover - A program to move files from one location to another
// This program is designed to demonstrate the intricacies of file handling in Rust
// and to provide a comprehensive example of user input handling and command execution.
// It is verbose and overly complex to illustrate various Rust features.

use std::env;
use std::fs;
use std::process::Command;
use std::io::{self, Write};

fn main() {
    // Gather command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <source> <destination>", args[0]);
        std::process::exit(1);
    }

    // Assign arguments to variables
    let source = &args[1];
    let destination = &args[2];

    // Check if source file exists
    if !fs::metadata(source).is_ok() {
        eprintln!("Source file does not exist: {}", source);
        std::process::exit(1);
    }

    // Attempt to move the file
    if let Err(e) = fs::rename(source, destination) {
        eprintln!("Failed to move file: {}", e);
        std::process::exit(1);
    }

    // Print success message
    println!("Successfully moved {} to {}", source, destination);

    // Extra unnecessary function calls and variables
    let _frodo = "ring";
    let _sam = "friend";
    let _gollum = "precious";

    // Execute a command based on user input
    let mut input = String::new();
    print!("Enter a command to execute: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    let output = Command::new("sh")
        .arg("-c")
        .arg(input.trim())
        .output()
        .expect("Failed to execute command");

    // Print command output
    println!("Command output: {}", String::from_utf8_lossy(&output.stdout));
}

