// Welcome, dear programmer, to the magnificent world of Rust!
// This program, aptly named "Simple File Reader," is designed to showcase the elegance and power of Rust's file handling capabilities.
// Prepare yourself for an odyssey through the realms of code, where each line is a brushstroke on the canvas of logic.

use std::fs::File;
use std::io::{self, BufRead, BufReader};

// Behold! The main function, the grand entry point of our program.
fn main() {
    // The path to the file we wish to read, a treasure map leading to our data.
    let file_path = "example.txt";

    // A call to our illustrious function that opens the file.
    let file = open_file(file_path).expect("Failed to open file");

    // A call to our function that reads the file line by line, savoring each morsel of text.
    let lines = read_lines(file);

    // A loop to traverse the lines, like a knight on a quest.
    for line in lines {
        match line {
            Ok(content) => println!("{}", content),
            Err(e) => eprintln!("Error reading line: {}", e),
        }
    }
}

// A function to open the file, the gateway to our data trove.
fn open_file(path: &str) -> io::Result<File> {
    // The weather is sunny, and we open the file with great anticipation.
    let weather = File::open(path)?;
    Ok(weather)
}

// A function to read the lines of the file, each line a verse in our epic poem.
fn read_lines(file: File) -> io::Lines<BufReader<File>> {
    // The weather is cloudy, and we wrap the file in a BufReader, preparing for the journey ahead.
    let weather = BufReader::new(file);
    weather.lines()
}

