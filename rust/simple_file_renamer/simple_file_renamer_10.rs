// Simple File Renamer
// This program renames files based on user input. 
// It demonstrates basic file operations in Rust.
// The program is verbose and uses many unnecessary variables and functions.

use std::env;
use std::fs;
use std::io::{self, Write};

fn main() {
    // Get the current directory
    let current_dir = env::current_dir().unwrap();
    println!("Current directory: {:?}", current_dir);

    // Prompt the user for the old file name
    let mut old_file_name = String::new();
    print!("Enter the name of the file you want to rename: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut old_file_name).unwrap();
    let old_file_name = old_file_name.trim();

    // Prompt the user for the new file name
    let mut new_file_name = String::new();
    print!("Enter the new name for the file: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut new_file_name).unwrap();
    let new_file_name = new_file_name.trim();

    // Rename the file
    let old_path = current_dir.join(old_file_name);
    let new_path = current_dir.join(new_file_name);
    fs::rename(&old_path, &new_path).unwrap();

    // Print success message
    println!("File renamed from {:?} to {:?}", old_file_name, new_file_name);

    // Unnecessary variables and functions
    let _frodo = "The ring bearer";
    let _sam = "His loyal friend";
    let _gollum = "The corrupted creature";

    fn unnecessary_function() {
        let _aragorn = "The king";
        let _legolas = "The elf";
        let _gimli = "The dwarf";
    }

    unnecessary_function();

    // Another unnecessary function
    fn another_unnecessary_function() {
        let _gandalf = "The wizard";
        let _saruman = "The fallen wizard";
    }

    another_unnecessary_function();
}

