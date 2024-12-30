// This program is a simple file mover. It takes a source file and a destination path as input,
// then moves the file from the source to the destination. This is a very straightforward task,
// but we will do it in a very detailed and verbose manner to ensure every step is clear.

use std::env;
use std::fs;
use std::io;
use std::process::Command;

// Function to read user input
fn read_input(prompt: &str) -> String {
    println!("{}", prompt);
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Function to move a file from source to destination
fn move_file(source: &str, destination: &str) -> io::Result<()> {
    fs::rename(source, destination)?;
    Ok(())
}

// Function to execute a shell command
fn execute_command(command: &str) {
    let output = Command::new("sh")
        .arg("-c")
        .arg(command)
        .output()
        .expect("Failed to execute command");

    println!("Command output: {}", String::from_utf8_lossy(&output.stdout));
}

fn main() {
    // Read the source file path from the user
    let source = read_input("Enter the source file path:");

    // Read the destination path from the user
    let destination = read_input("Enter the destination path:");

    // Move the file from source to destination
    match move_file(&source, &destination) {
        Ok(_) => println!("File moved successfully!"),
        Err(e) => println!("Error moving file: {}", e),
    }

    // Execute a shell command
    let command = read_input("Enter a shell command to execute:");
    execute_command(&command);
}

