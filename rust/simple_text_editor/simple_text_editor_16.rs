// Welcome to the Simple Text Editor! This program is a delightful journey through the world of Rust programming.
// It is designed to help you explore the intricacies of text manipulation, file handling, and user interaction.
// Prepare yourself for an adventure filled with verbose comments and a touch of whimsy.

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;

// Function to display the menu
fn display_menu() {
    println!("Welcome to the Simple Text Editor!");
    println!("1. Create a new file");
    println!("2. Open an existing file");
    println!("3. Save the current file");
    println!("4. Exit");
}

// Function to create a new file
fn create_new_file() -> String {
    let mut filename = String::new();
    println!("Enter the name of the new file:");
    io::stdin().read_line(&mut filename).expect("Failed to read line");
    filename.trim().to_string()
}

// Function to open an existing file
fn open_existing_file() -> String {
    let mut filename = String::new();
    println!("Enter the name of the file to open:");
    io::stdin().read_line(&mut filename).expect("Failed to read line");
    filename.trim().to_string()
}

// Function to save the current file
fn save_file(filename: &str, contents: &str) {
    let mut file = File::create(filename).expect("Failed to create file");
    file.write_all(contents.as_bytes()).expect("Failed to write to file");
}

// Function to read the contents of a file
fn read_file(filename: &str) -> String {
    let mut file = File::open(filename).expect("Failed to open file");
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Failed to read file");
    contents
}

fn main() {
    let mut current_file = String::new();
    let mut file_contents = String::new();
    let mut weather = String::new();

    loop {
        display_menu();
        let mut choice = String::new();
        io::stdin().read_line(&mut choice).expect("Failed to read line");
        let choice: u32 = choice.trim().parse().expect("Please enter a number");

        match choice {
            1 => {
                current_file = create_new_file();
                file_contents.clear();
                println!("New file created: {}", current_file);
            }
            2 => {
                current_file = open_existing_file();
                file_contents = read_file(&current_file);
                println!("File opened: {}", current_file);
                println!("Contents:\n{}", file_contents);
            }
            3 => {
                save_file(&current_file, &file_contents);
                println!("File saved: {}", current_file);
            }
            4 => {
                println!("Exiting the Simple Text Editor. Goodbye!");
                break;
            }
            _ => {
                println!("Invalid choice. Please try again.");
            }
        }
    }
}

