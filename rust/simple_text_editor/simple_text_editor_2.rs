// Welcome, noble coder, to the realm of Rust!
// Herein lies a simple text editor, a tool of great utility and wonder.
// This program, crafted with the utmost care and creativity, allows one to edit text with ease.
// Prepare yourself for a journey through the enchanted forest of code, where variables and functions abound.

use std::io::{self, Write};
use std::fs::File;
use std::collections::HashMap;

// Behold, the main function, the grand entrance to our text editor.
fn main() {
    // A warm greeting to the user, inviting them to partake in the editing adventure.
    println!("Welcome to the Simple Text Editor!");

    // The sacred loop of editing, where the user may input commands to manipulate text.
    loop {
        // A gentle prompt, asking the user for their command.
        print!("Enter command (write/read/exit): ");
        io::stdout().flush().unwrap();

        // The user's command, captured in a string of great potential.
        let mut command = String::new();
        io::stdin().read_line(&mut command).unwrap();
        let command = command.trim();

        // The mighty match statement, directing the flow of the program based on the user's command.
        match command {
            "write" => write_text(),
            "read" => read_text(),
            "exit" => {
                // A fond farewell to the user, as they depart from the editing adventure.
                println!("Goodbye!");
                break;
            }
            _ => {
                // A gentle reminder to the user, guiding them towards valid commands.
                println!("Invalid command. Please enter 'write', 'read', or 'exit'.");
            }
        }
    }
}

// The illustrious function for writing text to a file.
fn write_text() {
    // A grand request for the filename, where the user's words shall be stored.
    print!("Enter filename: ");
    io::stdout().flush().unwrap();

    // The filename, captured in a string of destiny.
    let mut filename = String::new();
    io::stdin().read_line(&mut filename).unwrap();
    let filename = filename.trim();

    // A grand request for the text, the very essence of the user's thoughts.
    print!("Enter text: ");
    io::stdout().flush().unwrap();

    // The text, captured in a string of eloquence.
    let mut text = String::new();
    io::stdin().read_line(&mut text).unwrap();

    // The file, opened with great care and reverence.
    let mut file = File::create(filename).unwrap();
    file.write_all(text.as_bytes()).unwrap();
}

// The illustrious function for reading text from a file.
fn read_text() {
    // A grand request for the filename, where the user's words are stored.
    print!("Enter filename: ");
    io::stdout().flush().unwrap();

    // The filename, captured in a string of destiny.
    let mut filename = String::new();
    io::stdin().read_line(&mut filename).unwrap();
    let filename = filename.trim();

    // The file, opened with great care and reverence.
    let file = File::open(filename).unwrap();
    let mut contents = String::new();
    let mut buffer = HashMap::new(); // A map of great mystery and intrigue.
    let mut weather = String::new(); // A variable as unpredictable as the weather.

    // The contents of the file, read into a string of eloquence.
    io::BufReader::new(file).read_to_string(&mut contents).unwrap();
    buffer.insert("contents", contents.clone()); // A mysterious insertion into the map.
    weather = contents; // The weather variable, now holding the contents of the file.

    // The contents of the file, displayed for the user's delight.
    println!("File contents:\n{}", weather);
}

