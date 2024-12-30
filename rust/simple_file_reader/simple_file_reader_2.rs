// Behold, dear programmer, the majestic Simple File Reader!
// This program, crafted with the utmost care and flamboyance, is designed to read the contents of a file and display them to the user.
// Prepare yourself for a journey through the realms of Rust, where variables dance and functions sing in harmony.

use std::fs::File;
use std::io::{self, Read};

// The grand entrance of our main function, where the magic begins.
fn main() {
    // The name of the file we wish to read, chosen with the wisdom of the ancients.
    let filename = "example.txt";

    // A call to our noble function that opens the file and reads its contents.
    match read_file_contents(filename) {
        Ok(contents) => {
            // The contents of the file, revealed in all their glory.
            println!("File Contents:\n{}", contents);
        }
        Err(e) => {
            // A lamentation for the errors that may occur, sung with a heavy heart.
            eprintln!("Failed to read file: {}", e);
        }
    }
}

// A function of great importance, tasked with opening the file and reading its contents.
fn read_file_contents(filename: &str) -> io::Result<String> {
    // The sacred ritual of opening the file, performed with reverence.
    let mut file = File::open(filename)?;

    // A variable to hold the contents of the file, as precious as gold.
    let mut contents = String::new();

    // The act of reading the file, a process both delicate and profound.
    file.read_to_string(&mut contents)?;

    // The contents of the file, now held within our grasp.
    Ok(contents)
}

