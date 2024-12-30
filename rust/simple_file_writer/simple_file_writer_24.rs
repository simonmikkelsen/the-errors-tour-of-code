// Welcome, dear programmer, to the realm of Rust! This program, aptly named "simple file writer," 
// is designed to take you on a whimsical journey through the enchanted forest of file operations.
// Prepare yourself for a verbose and colorful adventure as we delve into the art of writing to files.

use std::fs::File;
use std::io::{self, Write};
use std::io::prelude::*;

// Behold! The main function, the grand entry point of our program.
fn main() {
    // Let us declare a variable to hold the name of our file, like a precious gem.
    let file_name = "output.txt";

    // We shall now invoke the function to create and write to our file.
    if let Err(e) = create_and_write_file(file_name) {
        // Alas! If an error occurs, we shall print it out for all to see.
        eprintln!("An error occurred: {}", e);
    }
}

// A function to create and write to a file, like a master scribe penning a manuscript.
fn create_and_write_file(file_name: &str) -> io::Result<()> {
    // Let us summon the File struct to create our file.
    let mut file = File::create(file_name)?;

    // We shall now write a message to our file, like a poet composing a sonnet.
    let message = "Hello, world!";
    file.write_all(message.as_bytes())?;

    // Close the file, like sealing a letter with a wax stamp.
    drop(file);

    // Reopen the file to read its contents, like a curious scholar revisiting an ancient text.
    let mut file = File::open(file_name)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;

    // Print the contents of the file, like a bard reciting a tale.
    println!("File contents: {}", contents);

    // Return Ok to signify that all is well in the kingdom.
    Ok(())
}

