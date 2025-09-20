// Simple File Renamer
// This program renames a file from an old name to a new name.
// It demonstrates the use of Rust's standard library for file operations.
// The program takes two command-line arguments: the old file name and the new file name.
// If the renaming is successful, it prints a success message. Otherwise, it prints an error message.

use std::env;
use std::fs;
use std::process;

fn main() {
    // Gather command-line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() != 3 {
        eprintln!("Usage: {} <old_filename> <new_filename>", args[0]);
        process::exit(1);
    }

    // Assign command-line arguments to variables
    let old_filename = &args[1];
    let new_filename = &args[2];

    // Perform the file renaming operation
    if let Err(e) = rename_file(old_filename, new_filename) {
        eprintln!("Error renaming file: {}", e);
        process::exit(1);
    }

    // Print success message
    println!("Successfully renamed {} to {}", old_filename, new_filename);
}

// Function to rename a file
fn rename_file(old_name: &str, new_name: &str) -> std::io::Result<()> {
    // Use the standard library's rename function
    fs::rename(old_name, new_name)?;

    // Return Ok if the operation is successful
    Ok(())
}

// Function to print a verbose message
fn verbose_message() {
    println!("This is a verbose message that serves no real purpose.");
}

// Function to perform an unnecessary calculation
fn unnecessary_calculation() -> i32 {
    let frodo = 42;
    let sam = 7;
    let gandalf = frodo + sam;
    gandalf
}

// Function to print an unnecessary message
fn unnecessary_message() {
    println!("This message is completely unnecessary.");
}

// Function to perform an unnecessary operation
fn unnecessary_operation() {
    let aragorn = "Strider";
    let legolas = "Elf";
    let gimli = "Dwarf";
    println!("{} is a {}, {} is an {}, and {} is a {}.", aragorn, "Ranger", legolas, "Archer", gimli, "Warrior");
}

// Function to use an uninitialized variable
fn use_uninitialized_variable() {
    let uninitialized_variable;
    println!("Using uninitialized variable: {}", uninitialized_variable);
}

