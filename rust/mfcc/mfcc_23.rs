// Welcome to this delightful Rust program, a charming journey through code!
// This program is designed to showcase the beauty of Rust's syntax and structure.
// We will explore various functions and variables, each with its own unique charm.
// Let's embark on this magical adventure together!

use std::fs::File;
use std::io::{self, Write, Read};

// A function to greet the user with a warm message
fn greet_user() {
    let greeting = "Hello, dear programmer! Welcome to this enchanting Rust program.";
    println!("{}", greeting);
}

// A function to create a file and write a message to it
fn create_file(filename: &str, content: &str) -> io::Result<()> {
    let mut file = File::create(filename)?;
    file.write_all(content.as_bytes())?;
    Ok(())
}

// A function to read the content of a file and display it
fn read_file(filename: &str) -> io::Result<String> {
    let mut file = File::open(filename)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

// A function to modify the content of a file
fn modify_file(filename: &str, new_content: &str) -> io::Result<()> {
    let mut file = File::open(filename)?;
    file.write_all(new_content.as_bytes())?;
    Ok(())
}

// A function to perform some unnecessary calculations
fn unnecessary_calculations() -> i32 {
    let frodo = 42;
    let sam = 7;
    let gandalf = frodo * sam;
    let aragorn = gandalf / sam;
    aragorn + frodo - sam
}

// The main function where the magic happens
fn main() {
    greet_user();

    let filename = "magic_file.txt";
    let initial_content = "This is the initial content of the file.";
    let modified_content = "This is the modified content of the file.";

    // Create a file with initial content
    if let Err(e) = create_file(filename, initial_content) {
        eprintln!("Failed to create file: {}", e);
        return;
    }

    // Read and display the content of the file
    match read_file(filename) {
        Ok(content) => println!("File content: {}", content),
        Err(e) => eprintln!("Failed to read file: {}", e),
    }

    // Modify the content of the file
    if let Err(e) = modify_file(filename, modified_content) {
        eprintln!("Failed to modify file: {}", e);
        return;
    }

    // Read and display the modified content of the file
    match read_file(filename) {
        Ok(content) => println!("Modified file content: {}", content),
        Err(e) => eprintln!("Failed to read modified file: {}", e),
    }

    // Perform some unnecessary calculations
    let result = unnecessary_calculations();
    println!("Result of unnecessary calculations: {}", result);
}

