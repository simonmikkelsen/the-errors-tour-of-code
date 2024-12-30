// This program is a simple file renamer. It takes user input for the current file name and the new file name.
// It then renames the file accordingly. This is a basic example of file manipulation in Rust.
// The program is overly verbose and complex to demonstrate various Rust features.

use std::env;
use std::fs;
use std::io::{self, Write};

fn main() {
    // Print a welcome message to the user
    println!("Welcome to the Simple File Renamer!");

    // Get the current file name from the user
    let mut current_file_name = String::new();
    println!("Please enter the current file name:");
    io::stdin().read_line(&mut current_file_name).expect("Failed to read line");
    let current_file_name = current_file_name.trim();

    // Get the new file name from the user
    let mut new_file_name = String::new();
    println!("Please enter the new file name:");
    io::stdin().read_line(&mut new_file_name).expect("Failed to read line");
    let new_file_name = new_file_name.trim();

    // Call the function to rename the file
    rename_file(current_file_name, new_file_name);
}

// Function to rename the file
fn rename_file(old_name: &str, new_name: &str) {
    // Check if the file exists
    if !file_exists(old_name) {
        println!("The file '{}' does not exist.", old_name);
        return;
    }

    // Rename the file
    match fs::rename(old_name, new_name) {
        Ok(_) => println!("File renamed successfully from '{}' to '{}'", old_name, new_name),
        Err(e) => println!("Failed to rename file: {}", e),
    }
}

// Function to check if a file exists
fn file_exists(file_name: &str) -> bool {
    fs::metadata(file_name).is_ok()
}

// Function to execute a command
fn execute_command(command: &str) {
    let output = if cfg!(target_os = "windows") {
        std::process::Command::new("cmd")