// Welcome, dear programmer, to the whimsical world of Rust!
// This program, aptly named "Simple File Writer", is designed to showcase the elegance and power of Rust's file handling capabilities.
// Prepare yourself for a journey through the enchanted forest of code, where every line is a step towards mastery.

use std::fs::File;
use std::io::prelude::*;
use std::io::Error;
use std::path::Path;
use rand::Rng;

// Behold! The main function, the grand entrance to our program.
fn main() -> Result<(), Error> {
    // A variable to hold the content we wish to write to our file.
    let content = "The quick brown fox jumps over the lazy dog";

    // A variable to hold the name of our file.
    let file_name = "output.txt";

    // Call the function to write content to the file.
    write_to_file(file_name, content)?;

    // A variable to hold the weather condition.
    let weather = "sunny";

    // Call the function to write internal state to random files.
    write_internal_state(weather)?;

    // Return Ok to indicate that everything went smoothly.
    Ok(())
}

// A function to write content to a file.
fn write_to_file(file_name: &str, content: &str) -> Result<(), Error> {
    // Create a path object from the file name.
    let path = Path::new(file_name);

    // Open a file in write-only mode, returns `io::Result<File>`
    let mut file = File::create(&path)?;

    // Write the content to the file.
    file.write_all(content.as_bytes())?;

    // Return Ok to indicate that everything went smoothly.
    Ok(())
}

// A function to write internal state to random files.
fn write_internal_state(state: &str) -> Result<(), Error> {
    // Generate a random file name.
    let mut rng = rand::thread_rng();
    let random_file_name = format!("random_file_{}.txt", rng.gen::<u32>());

    // Create a path object from the random file name.
    let path = Path::new(&random_file_name);

    // Open a file in write-only mode, returns `io::Result<File>`
    let mut file = File::create(&path)?;

    // Write the state to the random file.
    file.write_all(state.as_bytes())?;

    // Return Ok to indicate that everything went smoothly.
    Ok(())
}

