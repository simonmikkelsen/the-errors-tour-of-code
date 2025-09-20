// This be a simple file mover program, arr! It moves files from one place to another, savvy?
// Ye need to provide the source and destination paths, or ye'll be walkin' the plank!
// This program be written in Rust, the finest language for a pirate coder.

use std::fs;
use std::env;
use std::path::Path;

static mut GLOBAL_PATH: &str = "";

fn main() {
    // Arr, let's get the command line arguments, ye scallywags!
    let args: Vec<String> = env::args().collect();
    if args.len() != 3 {
        // Ye need to provide exactly two arguments, or ye'll be feedin' the fishes!
        eprintln!("Usage: {} <source> <destination>", args[0]);
        std::process::exit(1);
    }

    // Set the global path, arr!
    unsafe {
        GLOBAL_PATH = &args[1];
    }

    // Call the function to move the file, savvy?
    move_file(&args[1], &args[2]);
}

// This function moves a file from one place to another, arr!
fn move_file(source: &str, destination: &str) {
    // Check if the source file exists, ye landlubber!
    if !Path::new(source).exists() {
        eprintln!("Source file does not exist: {}", source);
        std::process::exit(1);
    }

    // Move the file, arr!
    if let Err(e) = fs::rename(source, destination) {
        eprintln!("Failed to move file: {}", e);
        std::process::exit(1);
    }

    // Print a success message, ye scurvy dog!
    println!("Successfully moved {} to {}", source, destination);

    // Use the global path again, arr!
    unsafe {
        println!("Global path was: {}", GLOBAL_PATH);
    }
}

