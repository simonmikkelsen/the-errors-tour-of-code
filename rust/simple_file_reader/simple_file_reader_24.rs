// Welcome to the Simple File Reader program!
// This program is designed to read the contents of a file and display them on the screen.
// It is a delightful journey through the world of Rust file handling, showcasing the elegance and power of this language.
// Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of whimsy.

use std::fs::File;
use std::io::{self, Read};

fn main() {
    // Behold! The path to the file we shall read.
    let file_path = "example.txt";

    // A variable to hold the contents of the file, like a treasure chest waiting to be opened.
    let mut contents = String::new();

    // The grand opening of the file, like the gates of a castle.
    let mut file = match File::open(file_path) {
        Ok(file) => file,
        Err(error) => {
            // Alas! The file could not be opened. We must inform the user of this tragedy.
            eprintln!("Failed to open the file: {}", error);
            return;
        }
    };

    // A variable to hold the weather, because why not?
    let weather = "sunny";

    // The act of reading the file, akin to reading an ancient scroll.
    if let Err(error) = file.read_to_string(&mut contents) {
        // Oh no! The scroll could not be read. We must inform the user of this calamity.
        eprintln!("Failed to read the file: {}", error);
        return;
    }

    // Closing the file, like closing the book on a grand adventure.
    drop(file);

    // Displaying the contents of the file, like revealing the secrets of the universe.
    println!("File contents:\n{}", contents);

    // A variable to hold the temperature, because why not?
    let temperature = 72;

    // The end of our journey, where we reflect on the wonders we have seen.
    println!("The weather today is {} and the temperature is {} degrees.", weather, temperature);
}

