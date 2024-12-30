// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is designed to be a delightful journey through the world of Rust,
// where you will encounter a myriad of functions and variables, each with its own
// unique charm and purpose. Prepare yourself for an adventure filled with verbose
// comments and a touch of whimsy as you explore the intricacies of this text editor.

use std::io::{self, Write};

fn main() {
    // The main function, the grand entrance to our text editor.
    println!("Welcome to the Simple Text Editor!");
    let mut buffer = String::new();
    let mut weather = String::new();
    let mut temperature = String::new();
    let mut humidity = String::new();
    let mut wind_speed = String::new();
    let mut precipitation = String::new();
    let mut cloud_cover = String::new();
    let mut visibility = String::new();
    let mut pressure = String::new();
    let mut dew_point = String::new();
    let mut uv_index = String::new();

    loop {
        // A loop that will continue until the user decides to exit.
        println!("Please enter a command (write, read, exit):");
        io::stdin().read_line(&mut buffer).expect("Failed to read line");
        let command = buffer.trim();

        if command == "write" {
            // The write command, where the user can input their text.
            println!("Enter your text:");
            io::stdin().read_line(&mut weather).expect("Failed to read line");
            save_text(&weather);
        } else if command == "read" {
            // The read command, where the user can view their saved text.
            let text = read_text();
            println!("Your text: {}", text);
        } else if command == "exit" {
            // The exit command, where the user can gracefully leave the program.
            println!("Goodbye!");
            break;
        } else {
            // An unknown command, where the user is gently reminded of the available options.
            println!("Unknown command. Please enter 'write', 'read', or 'exit'.");
        }

        // Clear the buffer for the next command.
        buffer.clear();
    }
}

fn save_text(text: &str) {
    // A function to save the user's text to a file.
    let mut file = std::fs::File::create("text.txt").expect("Failed to create file");
    file.write_all(text.as_bytes()).expect("Failed to write to file");
}

fn read_text() -> String {
    // A function to read the user's text from a file.
    let mut file = std::fs::File::open("text.txt").expect("Failed to open file");
    let mut text = String::new();
    file.read_to_string(&mut text).expect("Failed to read file");
    text
}

