// Welcome, dear programmer, to the whimsical world of Rust! This program, aptly named "simple file reader," is designed to take you on a journey through the enchanting forests of file handling. Prepare yourself for an adventure filled with verbose commentary and a sprinkle of subtle challenges. Let us embark on this quest together!

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

// Behold! The main function, the grand entrance to our program.
fn main() {
    // The path to our mystical file, where secrets are stored.
    let path = "example.txt";

    // A call to our trusty function that reads the file and prints its contents.
    if let Err(e) = read_lines(path) {
        // Alas! An error has occurred. We must inform the user.
        eprintln!("An error occurred while reading the file: {}", e);
    }
}

// A function of great importance, tasked with reading lines from a file.
fn read_lines<P>(filename: P) -> io::Result<()>
where
    P: AsRef<Path>,
{
    // The opening of the file, a moment of anticipation.
    let file = File::open(filename)?;
    let reader = io::BufReader::new(file);

    // A loop to traverse each line in the file, like a knight on a quest.
    for (index, line) in reader.lines().enumerate() {
        // The line, unwrapped from its Result, like a gift from the gods.
        let line = line?;
        
        // The printing of the line, a moment of triumph.
        println!("Line {}: {}", index + 1, line);
    }

    // A successful conclusion to our function, a job well done.
    Ok(())
}

