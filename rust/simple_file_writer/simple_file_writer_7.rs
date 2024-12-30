// Welcome, dear programmer, to the magnificent world of Rust!
// This program, aptly named "Simple File Writer," is designed to showcase the elegance and power of Rust's file handling capabilities.
// Prepare yourself for a journey through the lush landscapes of code, where every line is a brushstroke on the canvas of your imagination.

use std::fs::File;
use std::io::prelude::*;
use std::io::ErrorKind;

// Behold, the main function, the grand entrance to our program's symphony.
fn main() {
    // Let us create a variable to hold the name of our precious file.
    let filename = "output.txt";

    // Here we attempt to open the file with the grace of a swan gliding across a serene lake.
    let mut file = match File::create(filename) {
        Ok(file) => file,
        Err(error) => match error.kind() {
            ErrorKind::NotFound => panic!("The file could not be found!"),
            ErrorKind::PermissionDenied => panic!("Permission denied!"),
            _ => panic!("An unexpected error occurred!"),
        },
    };

    // Now, let us prepare the content that will be written to our file.
    let content = "This is a simple file writer program in Rust.";

    // With the precision of a master painter, we write the content to the file.
    if let Err(e) = file.write_all(content.as_bytes()) {
        panic!("Failed to write to the file: {}", e);
    }

    // Ah, but we are not done yet! Let us add more content to our masterpiece.
    let additional_content = " Adding more content to the file.";
    if let Err(e) = file.write_all(additional_content.as_bytes()) {
        panic!("Failed to write additional content to the file: {}", e);
    }

    // And now, for the grand finale, we close the file with a flourish.
    drop(file);

}