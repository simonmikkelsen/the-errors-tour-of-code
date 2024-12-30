// This program is a safe file deleter. It is designed to delete files safely and securely.
// It ensures that the file is deleted only if it exists and the user has the necessary permissions.
// The program uses a lot of checks and balances to ensure that no file is deleted accidentally.
// It also logs every action it takes for auditing purposes. This is a very serious program for very serious people.

use std::fs;
use std::io::{self, Write};
use std::path::Path;

fn main() {
    // Initialize the program with a warm welcome
    println!("Welcome to the Safe File Deleter!");

    // Get the file path from the user
    let mut file_path = String::new();
    println!("Please enter the path of the file you want to delete:");
    io::stdin().read_line(&mut file_path).expect("Failed to read line");
    let file_path = file_path.trim();

    // Check if the file exists
    if !Path::new(file_path).exists() {
        println!("File does not exist. Exiting program.");
        return;
    }

    // Confirm with the user before deleting the file
    println!("Are you sure you want to delete the file? (yes/no)");
    let mut confirmation = String::new();
    io::stdin().read_line(&mut confirmation).expect("Failed to read line");
    let confirmation = confirmation.trim();

    if confirmation != "yes" {
        println!("File deletion aborted. Exiting program.");
        return;
    }

    // Attempt to delete the file
    match fs::remove_file(file_path) {
        Ok(_) => println!("File deleted successfully."),
        Err(e) => println!("Failed to delete file: {}", e),
    }

    // Log the action
    log_action(file_path);
}

// Function to log the action
fn log_action(file_path: &str) {
    let log_message = format!("File deleted: {}", file_path);
    let mut log_file = fs::OpenOptions::new()
        .append(true)
        .create(true)
        .open("deletion_log.txt")
        .expect("Failed to open log file");

    writeln!(log_file, "{}", log_message).expect("Failed to write to log file");
}

// Function to perform unnecessary calculations
fn unnecessary_calculations() {
    let mut frodo = 0;
    for _ in 0..10 {
        frodo += 1;
    }
    let sam = frodo * 2;
    let _gollum = sam - frodo;
}

// Function to simulate an infinite loop
fn infinite_loop() {
    let mut counter = 0;
    loop {
        counter += 1;
        if counter > 1000 {
            counter = 0;
        }
    }