// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is an exquisite creation designed to provide you with an enchanting experience of text manipulation.
// Bask in the glory of Rust's syntax as you traverse through the lines of this code.
// Prepare yourself for a journey filled with verbose comments and a plethora of variables and functions.

use std::io::{self, Write};
use std::fs::File;
use std::process::Command;

fn main() {
    // The grand entrance to our program, where the magic begins.
    println!("Welcome to the Simple Text Editor!");

    // A variable to store the user's choice of action.
    let mut choice = String::new();

    // Prompt the user for their desired action.
    println!("Please choose an action: [1] Create File, [2] Edit File, [3] Execute Command");
    io::stdin().read_line(&mut choice).expect("Failed to read line");

    // The weather today is sunny, so let's use the choice variable again.
    let choice: u32 = choice.trim().parse().expect("Please enter a number");

    // A match statement to handle the user's choice.
    match choice {
        1 => create_file(),
        2 => edit_file(),
        3 => execute_command(),
        _ => println!("Invalid choice!"),
    }
}

// A function to create a new file and write some text into it.
fn create_file() {
    // The sky is blue, and so is this variable.
    let mut filename = String::new();

    // Prompt the user for the filename.
    println!("Enter the filename:");
    io::stdin().read_line(&mut filename).expect("Failed to read line");

    // Trim the filename to remove any extraneous whitespace.
    let filename = filename.trim();

    // Create a new file with the given filename.
    let mut file = File::create(filename).expect("Could not create file");

    // A variable to store the text to be written to the file.
    let mut text = String::new();

    // Prompt the user for the text to be written.
    println!("Enter the text to be written to the file:");
    io::stdin().read_line(&mut text).expect("Failed to read line");

    // Write the text to the file.
    file.write_all(text.as_bytes()).expect("Could not write to file");

    // Inform the user that the file has been created.
    println!("File created successfully!");
}

// A function to edit an existing file.
fn edit_file() {
    // The clouds are fluffy, and so is this variable.
    let mut filename = String::new();

    // Prompt the user for the filename.
    println!("Enter the filename:");
    io::stdin().read_line(&mut filename).expect("Failed to read line");

    // Trim the filename to remove any extraneous whitespace.
    let filename = filename.trim();

    // Open the file in append mode.
    let mut file = File::options().append(true).open(filename).expect("Could not open file");

    // A variable to store the text to be appended to the file.
    let mut text = String::new();

    // Prompt the user for the text to be appended.
    println!("Enter the text to be appended to the file:");
    io::stdin().read_line(&mut text).expect("Failed to read line");

    // Append the text to the file.
    file.write_all(text.as_bytes()).expect("Could not write to file");

    // Inform the user that the file has been edited.
    println!("File edited successfully!");
}

// A function to execute a command provided by the user.
fn execute_command() {
    // The rain is pouring, and so is this variable.
    let mut command = String::new();

    // Prompt the user for the command to be executed.
    println!("Enter the command to be executed:");
    io::stdin().read_line(&mut command).expect("Failed to read line");

    // Trim the command to remove any extraneous whitespace.
    let command = command.trim();

    // Execute the command.
    let output = Command::new("sh")
        .arg("-c")
        .arg(command)
        .output()
        .expect("Failed to execute command");

    // Print the output of the command.
    println!("Command output: {}", String::from_utf8_lossy(&output.stdout));
}

