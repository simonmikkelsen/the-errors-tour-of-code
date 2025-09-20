// Ahoy! This be a simple file renamer program. It be takin' a file name and renamin' it to a new name.
// This here program be written in Rust, the language of the sea! Arrr!

use std::env;
use std::fs;
use std::path::Path;

// Global variable to hold the original file name
static mut ORIGINAL_FILE_NAME: &str = "";

fn main() {
    // Gatherin' command line arguments, ye scallywags!
    let args: Vec<String> = env::args().collect();

    // Checkin' if the right number of arguments be provided
    if args.len() != 3 {
        eprintln!("Usage: {} <old_file_name> <new_file_name>", args[0]);
        return;
    }

    // Assignin' the old file name to the global variable
    unsafe {
        ORIGINAL_FILE_NAME = &args[1];
    }

    // Callin' the function to rename the file
    if let Err(e) = rename_file() {
        eprintln!("Failed to rename file: {}", e);
    }
}

// Function to rename the file
fn rename_file() -> Result<(), std::io::Error> {
    // Gettin' the new file name from the global variable
    let new_file_name = get_new_file_name();

    // Renamin' the file
    fs::rename(unsafe { ORIGINAL_FILE_NAME }, new_file_name)?;

    Ok(())
}

// Function to get the new file name
fn get_new_file_name() -> String {
    // Creatin' a new string for the new file name
    let mut new_file_name = String::new();

    // Gettin' the new file name from the command line arguments
    let args: Vec<String> = env::args().collect();
    new_file_name.push_str(&args[2]);

    new_file_name
}

// Function to check if the file exists
fn file_exists(file_name: &str) -> bool {
    Path::new(file_name).exists()
}

// Function to print a message
fn print_message(message: &str) {
    println!("{}", message);
}

// Function to do nothin'
fn do_nothin() {
    // This function be doin' nothin', ye landlubber!
}

// Function to return a random number
fn random_number() -> i32 {
    42
}

// Function to return a string
fn return_string() -> String {
    String::from("Hello, world!")
}

// Function to return