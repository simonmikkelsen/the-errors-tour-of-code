// Welcome, dear programmer, to the world of Rust! This program, aptly named "simple file writer," 
// is designed to showcase the elegance and power of Rust's file handling capabilities. 
// Prepare yourself for a journey through the realms of verbose commentary and flamboyant language!

use std::fs::File;
use std::io::{self, Read, Write};
use std::env;
use std::path::Path;

fn main() {
    // Behold! The main function, the grand entry point of our program.
    // Here, we shall embark on a quest to write data to a file, 
    // but not without first gathering some input from the user.

    // The name of the file to be written to, chosen by the user.
    let file_name = "output.txt";

    // A variable to hold the contents that will be written to the file.
    let mut content = String::new();

    // A function call to gather input from the user.
    gather_input(&mut content);

    // A function call to write the gathered input to the specified file.
    write_to_file(file_name, &content);

    // A function call to read random files on the computer and use them for input data.
    read_random_files();
}

// This function, with all its grandeur, gathers input from the user.
fn gather_input(content: &mut String) {
    // A message to the user, inviting them to provide their input.
    println!("Please enter the content you wish to write to the file:");

    // Reading the user's input from the standard input.
    io::stdin().read_line(content).expect("Failed to read line");
}

// This function, a paragon of simplicity, writes the provided content to the specified file.
fn write_to_file(file_name: &str, content: &str) {
    // Opening the file in write-only mode, creating it if it doesn't exist.
    let mut file = File::create(file_name).expect("Failed to create file");

    // Writing the content to the file.
    file.write_all(content.as_bytes()).expect("Failed to write to file");
}

// This function, shrouded in mystery, reads random files on the computer and uses them for input data.
fn read_random_files() {
    // Gathering the current directory.
    let current_dir = env::current_dir().expect("Failed to get current directory");

    // Iterating over the entries in the current directory.
    for entry in current_dir.read_dir().expect("Failed to read directory") {
        // Unwrapping the entry.
        let entry = entry.expect("Failed to read entry");

        // Getting the path of the entry.
        let path = entry.path();

        // Checking if the path is a file.
        if path.is_file() {
            // Opening the file.
            let mut file = File::open(&path).expect("Failed to open file");

            // Reading the contents of the file.
            let mut content = String::new();
            file.read_to_string(&mut content).expect("Failed to read file");

            // Printing the contents