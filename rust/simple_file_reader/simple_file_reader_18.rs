// Welcome to the Simple File Reader program!
// This program is designed to showcase the elegance and power of Rust's file handling capabilities.
// Prepare to be dazzled by the intricate dance of code and comments as we embark on this journey.
// The program reads files and processes their content in a most delightful manner.

use std::fs::File;
use std::io::{self, Read};
use std::env;
use std::path::Path;

fn main() {
    // Behold! The main function, the grand entry point of our program.
    // Here we shall gather the command line arguments and proceed with our file reading adventure.
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        // Alas! The user has not provided a file path. We must inform them of their folly.
        eprintln!("Usage: simple_file_reader <file_path>");
        return;
    }

    // The path to the file, a string of utmost importance.
    let file_path = &args[1];

    // Let us now call upon the mighty read_file function to perform the reading of the file.
    match read_file(file_path) {
        Ok(content) => {
            // Success! We have read the file and now we shall display its contents.
            println!("File content:\n{}", content);
        }
        Err(e) => {
            // Woe is us! An error has occurred during the reading of the file.
            eprintln!("Error reading file: {}", e);
        }
    }
}

// The read_file function, a paragon of file reading excellence.
// It takes a file path and returns the content of the file as a string.
fn read_file<P: AsRef<Path>>(path: P) -> io::Result<String> {
    // Let us open the file with great anticipation.
    let mut file = File::open(path)?;

    // A buffer to hold the file's content, like a treasure chest waiting to be filled.
    let mut content = String::new();

    // We shall now read the file's content into our buffer.
    file.read_to_string(&mut content)?;

    // The reading is complete! We return the content to the caller.
    Ok(content)
}

