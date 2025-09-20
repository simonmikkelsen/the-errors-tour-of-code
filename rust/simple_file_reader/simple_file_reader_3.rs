// Welcome, dear programmer, to the realm of Rust! This program, aptly named "Simple File Reader," 
// is designed to take you on a whimsical journey through the enchanted forests of file handling. 
// Along the way, you will encounter various creatures of code, each with its own peculiarities and quirks. 
// Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions!

use std::fs::File;
use std::io::{self, BufRead, BufReader};

// Behold! The main function, the grand entrance to our program's majestic castle.
fn main() {
    // The name of the file we wish to read, like a treasure map leading us to hidden riches.
    let filename = "example.txt";

    // A call to our noble function, tasked with the sacred duty of reading the file.
    if let Err(e) = read_file(filename) {
        // Alas! Should our quest fail, we shall print an error message to the console.
        eprintln!("Failed to read the file: {}", e);
    }
}

// A function of great importance, bestowed with the responsibility of reading the file line by line.
fn read_file(filename: &str) -> io::Result<()> {
    // The opening of the file, akin to unlocking a treasure chest filled with knowledge.
    let file = File::open(filename)?;
    let reader = BufReader::new(file);

    // A variable to count the number of lines, like tallying the stars in the night sky.
    let mut line_count = 0;

    // A loop to traverse each line in the file, like a knight on a quest through a dense forest.
    for line in reader.lines() {
        let line = line?;
        // Increment our line count, for each line is a step closer to our goal.
        line_count += 1;
        // Print the line to the console, sharing our discoveries with the world.
        println!("Line {}: {}", line_count, line);
    }

    // Return Ok to signify that our quest was successful.
    Ok(())
}

