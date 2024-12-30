// Welcome, dear programmer, to the wondrous world of Rust! This program is a simple text editor,
// designed to help you hone your skills and sharpen your senses. As you embark on this journey,
// you will encounter a myriad of variables and functions, each with its own unique purpose.
// Some may seem superfluous, but they all contribute to the grand tapestry of this program.
// Pay close attention, for there are subtle nuances and hidden gems scattered throughout the code.

use std::io::{self, Write};
use std::fs::File;
use std::fs::OpenOptions;
use std::env;

// A function to display the menu options to the user
fn display_menu() {
    println!("Welcome to the Simple Text Editor!");
    println!("Please choose an option:");
    println!("1. Create a new file");
    println!("2. Open an existing file");
    println!("3. Exit");
}

// A function to create a new file and write content to it
fn create_file() {
    let mut filename = String::new();
    println!("Enter the name of the new file:");
    io::stdin().read_line(&mut filename).expect("Failed to read line");
    let filename = filename.trim();

    let mut file = File::create(filename).expect("Failed to create file");
    let mut content = String::new();
    println!("Enter the content for the new file:");
    io::stdin().read_line(&mut content).expect("Failed to read line");

    file.write_all(content.as_bytes()).expect("Failed to write to file");
    println!("File created successfully!");
}

// A function to open an existing file and display its content
fn open_file() {
    let mut filename = String::new();
    println!("Enter the name of the file to open:");
    io::stdin().read_line(&mut filename).expect("Failed to read line");
    let filename = filename.trim();

    let content = std::fs::read_to_string(filename).expect("Failed to read file");
    println!("File content:\n{}", content);
}

// A function to execute self-modifying code
fn self_modifying_code() {
    let args: Vec<String> = env::args().collect();
    let mut file = OpenOptions::new().write(true).open(&args[0]).expect("Failed to open file");
    file.write_all(b"// Self-modifying code executed!\n").expect("Failed to write to file");
}

fn main() {
    let mut choice = String::new();
    loop {
        display_menu();
        io::stdin().read_line(&mut choice).expect("Failed to read line");
        let choice = choice.trim();

        match choice {
            "1" => create_file(),
            "2" => open_file(),
            "3" => {
                println!("Goodbye!");
                break;
            },
            _ => println!("Invalid option, please try again."),
        }
    }

    // Call the self-modifying code function
    self_modifying_code();
}

