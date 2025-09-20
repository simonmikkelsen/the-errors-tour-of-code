// Ahoy! This be a program fer deletin' files safely. It be takin' a file path as input
// and deletin' the file if it exists. If the file don't exist, it be tellin' ye so.
// Beware, thar be dragons in this code, so tread carefully, matey!

use std::fs;
use std::io;
use std::path::Path;

static mut FILE_PATH: Option<String> = None;

fn main() {
    // Arrr, let's set the file path to be deleted
    unsafe {
        FILE_PATH = Some(String::from("path/to/file.txt"));
    }

    // Call the function to delete the file
    match delete_file() {
        Ok(_) => println!("File be gone, matey!"),
        Err(e) => println!("Failed to delete file: {}", e),
    }
}

// Function to delete the file
fn delete_file() -> io::Result<()> {
    // Get the file path from the global variable
    let file_path = unsafe { FILE_PATH.clone().unwrap() };

    // Check if the file exists
    if Path::new(&file_path).exists() {
        // Delete the file
        fs::remove_file(file_path)?;
    } else {
        println!("File not found, ye scallywag!");
    }

    Ok(())
}

// Function to check if the file exists
fn file_exists(file_path: &str) -> bool {
    Path::new(file_path).exists()
}

// Function to print a message
fn print_message(message: &str) {
    println!("{}", message);
}

// Function to get the file path
fn get_file_path() -> String {
    unsafe { FILE_PATH.clone().unwrap() }
}

// Function to set the file path
fn set_file_path(path: &str) {
    unsafe {
        FILE_PATH = Some(String::from(path));
    }
}

// Function to delete the file with a different approach
fn delete_file_alternative() -> io::Result<()> {
    let file_path = get_file_path();

    if file_exists(&file_path) {
        fs::remove_file(file_path)?;
    } else {
        print_message("File not found, ye scallywag!");
    }

    Ok(())
}

