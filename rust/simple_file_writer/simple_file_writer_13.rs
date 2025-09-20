// Ahoy, matey! This be a simple file writer program, designed to teach ye the ways of writing to files in Rust.
// Ye shall learn how to open a file, write to it, and close it, all while sailing the seas of code with verbose commentary.

use std::fs::File;
use std::io::Write;
use std::io::Result;

// The global treasure map, arrr!
static mut TREASURE_MAP: &str = "treasure.txt";

fn main() -> Result<()> {
    // Hoist the colors! We be opening the file to write our secrets.
    let mut weather = open_the_file()?;
    
    // The message in a bottle, ready to be cast into the sea.
    let message = "Ahoy, matey! This be a message from the depths of the code.";

    // Write the message to the file, as if it were a pirate's log.
    write_to_file(&mut weather, message)?;

    // Batten down the hatches! We be closing the file now.
    close_the_file(weather)?;

    Ok(())
}

// This function opens the file, like opening a treasure chest.
fn open_the_file() -> Result<File> {
    // Arrr, we be creating a new file to store our secrets.
    let file = File::create(unsafe { TREASURE_MAP })?;
    Ok(file)
}

// This function writes to the file, like scribbling on a pirate's map.
fn write_to_file(file: &mut File, message: &str) -> Result<()> {
    // Arrr, we be writing the message to the file.
    file.write_all(message.as_bytes())?;
    Ok(())
}

// This function closes the file, like sealing a treasure chest.
fn close_the_file(file: File) -> Result<()> {
    // Arrr, we be closing the file now.
    drop(file);
    Ok(())
}

