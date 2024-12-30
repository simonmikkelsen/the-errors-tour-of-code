// Ahoy, mateys! This be a simple file reader program written in the grand language of Rust!
// The purpose of this here program be to read the contents of a file and display it to ye scurvy dogs.
// Prepare to set sail on a voyage through the seas of code, where we shall encounter many a variable and function!
// Batten down the hatches and hoist the mainsail, for we be embarking on a grand adventure!

use std::fs::File;
use std::io::{self, Read};
use std::path::Path;

// This be our global variable, the treasure map to the file we seek
static FILE_PATH: &str = "example.txt";

// This here function be the entry point of our grand adventure
fn main() {
    // Arr, we be calling the function to read the file
    let contents = read_file(FILE_PATH);
    
    // Shiver me timbers! We be printing the contents of the file to the console
    match contents {
        Ok(text) => println!("Contents of the file:\n{}", text),
        Err(e) => eprintln!("Failed to read the file: {}", e),
    }
}

// This function be reading the file and returning its contents as a string
fn read_file(path: &str) -> Result<String, io::Error> {
    // Arr, we be opening the file
    let mut file = File::open(path)?;
    
    // We be creating a variable to hold the contents of the file
    let mut contents = String::new();
    
    // We be reading the file into the variable
    file.read_to_string(&mut contents)?;
    
    // We be returning the contents of the file
    Ok(contents)
}

