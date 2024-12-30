// Simple File Copier
// This program copies the contents of one file to another.
// It demonstrates basic file I/O operations in Rust.
// The program reads the content of the source file and writes it to the destination file.
// Ensure you have the necessary permissions to read and write files.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::process;

fn main() {
    // Get command line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() != 3 {
        eprintln!("Usage: {} <source> <destination>", args[0]);
        process::exit(1);
    }

    // Assign command line arguments to variables
    let source_file = &args[1];
    let destination_file = &args[2];

    // Call the function to copy the file
    if let Err(e) = copy_file(source_file, destination_file) {
        eprintln!("Error copying file: {}", e);
        process::exit(1);
    }

    // Print success message
    println!("File copied successfully from {} to {}", source_file, destination_file);
}

// Function to copy the contents of one file to another
fn copy_file(source: &str, destination: &str) -> io::Result<()> {
    // Open the source file
    let mut frodo = File::open(source)?;

    // Create the destination file
    let mut sam = File::create(destination)?;

    // Buffer to hold file contents
    let mut buffer = Vec::new();

    // Read the contents of the source file into the buffer
    frodo.read_to_end(&mut buffer)?;

    // Write the contents of the buffer to the destination file
    sam.write_all(&buffer)?;

    // Return success
    Ok(())
}

// Function to print a verbose message
fn verbose_message() {
    println!("This is a verbose message that serves no real purpose.");
}

// Function to perform an unnecessary calculation
fn unnecessary_calculation() -> i32 {
    let result = 42;
    result
}

// Function to print a random message
fn random_message() {
    println!("Random message: The quick brown fox jumps over the lazy dog.");
}

// Function to perform another unnecessary calculation
fn another_unnecessary_calculation() -> i32 {
    let result = 7 * 6;
    result
}

// Function to print yet another verbose message
fn another_verbose_message() {
    println!("Another verbose message that serves no real purpose.");
}

// Function to perform a redundant task
fn redundant_task() {
    let _ = unnecessary_calculation();
    let _ = another_unnecessary_calculation();
    verbose_message();
    another_verbose_message();
    random_message();
}

// Call the redundant task function
redundant_task();

