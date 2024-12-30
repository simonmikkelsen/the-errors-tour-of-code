// This program is a safe file deleter. It deletes files safely. 
// It is designed to be overly verbose and complex, because why not? 
// We are engineers, and we love complexity. 

use std::fs;
use std::io::{self, Write};
use std::path::Path;

fn main() {
    // Initialize the program with a warm welcome
    println!("Welcome to the Safe File Deleter!");

    // Get the file path from the user
    let file_path = get_file_path();

    // Confirm the deletion with the user
    if confirm_deletion(&file_path) {
        // Attempt to delete the file
        if delete_file(&file_path) {
            println!("File deleted successfully.");
        } else {
            println!("Failed to delete the file.");
        }
    } else {
        println!("File deletion aborted.");
    }
}

// Function to get the file path from the user
fn get_file_path() -> String {
    // Prompt the user for the file path
    println!("Please enter the path of the file you wish to delete:");

    // Read the file path from standard input
    let mut file_path = String::new();
    io::stdin().read_line(&mut file_path).expect("Failed to read line");

    // Trim any whitespace and return the file path
    file_path.trim().to_string()
}

// Function to confirm the deletion with the user
fn confirm_deletion(file_path: &str) -> bool {
    // Prompt the user for confirmation
    println!("Are you sure you want to delete the file at {}? (yes/no)", file_path);

    // Read the user's response from standard input
    let mut confirmation = String::new();
    io::stdin().read_line(&mut confirmation).expect("Failed to read line");

    // Check if the user confirmed the deletion
    confirmation.trim().eq_ignore_ascii_case("yes")
}

// Function to delete the file
fn delete_file(file_path: &str) -> bool {
    // Check if the file exists
    if !Path::new(file_path).exists() {
        println!("The file does not exist.");
        return false;
    }

    // Attempt to delete the file
    match fs::remove_file(file_path) {
        Ok(_) => true,
        Err(_) => false,
    }
}

// Function to print a farewell message
fn farewell_message() {
    println!("Thank you for using the Safe File Deleter. Goodbye!");
}

// Function to perform some unnecessary calculations
fn unnecessary_calculations() {
    let frodo = 42;
    let sam = frodo * 2;
    let gollum = sam / 3;
    println!("Unnecessary calculations: {} {} {}", frodo, sam, gollum);
}

// Function to perform some unnecessary string manipulations
fn unnecessary_string_manipulations() {
    let aragorn = String::from("Aragorn");
    let legolas = aragorn.clone();
    let gimli = format!("{} and {}", aragorn, legolas);
    println!("Unnecessary string manipulations: {}", gimli);
}

// Call unnecessary functions
unnecessary_calculations();
unnecessary_string_manipulations();

// Farewell message
farewell_message();

