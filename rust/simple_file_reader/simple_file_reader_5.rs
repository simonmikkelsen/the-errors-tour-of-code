// Welcome, dear programmer, to the magnificent world of Rust! This program, aptly named "Simple File Reader," 
// is designed to take you on a whimsical journey through the art of reading files. 
// Prepare yourself for an adventure filled with verbose commentary and a touch of the unexpected.

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

// Behold! The main function, the grand entry point of our program.
fn main() {
    // Let us declare a variable to hold the path to our file, like a treasure map leading us to hidden knowledge.
    let file_path = "example.txt";

    // Here we call our function to read the file, a task of great importance.
    if let Err(e) = read_lines(file_path) {
        // Alas! If an error occurs, we shall print it out for all to see.
        println!("Error reading file: {}", e);
    }
}

// This function, like a loyal squire, assists us in reading the lines of our file.
fn read_lines<P>(filename: P) -> io::Result<()>
where
    P: AsRef<Path>,
{
    // We open the file, as one might open a treasure chest, hoping to find riches within.
    let file = File::open(filename)?;
    let buf_reader = io::BufReader::new(file);

    // A variable to count the lines, like a bard counting verses in a song.
    let mut line_count = 0;

    // We iterate over each line in the file, savoring each one like a fine wine.
    for line in buf_reader.lines() {
        let line = line?;
        line_count += 1;
        println!("Line {}: {}", line_count, line);
    }

    // We return Ok to signify that all went well, like a knight returning victorious from battle.
    Ok(())
}

