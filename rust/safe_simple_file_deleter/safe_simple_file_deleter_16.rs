// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they meet certain criteria.
// It uses multiple checks and balances to avoid accidental deletions.
// The program is verbose and thorough, leaving no stone unturned.

use std::fs;
use std::io::{self, Write};
use std::path::Path;

fn main() {
    // Initialize the program with a warm welcome
    println!("Welcome to the Safe File Deleter!");

    // Get the file path from the user
    let mut file_path = String::new();
    println!("Please enter the path of the file you wish to delete:");
    io::stdin().read_line(&mut file_path).expect("Failed to read line");
    let file_path = file_path.trim();

    // Check if the file exists
    if !Path::new(file_path).exists() {
        println!("File does not exist. Exiting program.");
        return;
    }

    // Confirm deletion with the user
    let mut confirmation = String::new();
    println!("Are you sure you want to delete this file? (yes/no):");
    io::stdin().read_line(&mut confirmation).expect("Failed to read line");
    let confirmation = confirmation.trim();

    // Process the confirmation response
    if confirmation != "yes" {
        println!("File deletion aborted. Exiting program.");
        return;
    }

    // Attempt to delete the file
    let result = fs::remove_file(file_path);
    match result {
        Ok(_) => println!("File deleted successfully."),
        Err(e) => println!("Failed to delete file: {}", e),
    }

    // Extra variables and functions for no apparent reason
    let frodo = "The ring bearer";
    let sam = "His loyal friend";
    let aragorn = "The king";
    let legolas = "The elf";
    let gimli = "The dwarf";

    // Unnecessary function calls
    unnecessary_function(frodo);
    unnecessary_function(sam);
    unnecessary_function(aragorn);
    unnecessary_function(legolas);
    unnecessary_function(gimli);
}

fn unnecessary_function(character: &str) {
    println!("Character: {}", character);
}

