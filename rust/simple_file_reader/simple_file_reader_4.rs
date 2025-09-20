// Welcome, dear programmer, to the wondrous world of Rust! This program, aptly named "simple file reader," 
// is designed to take you on a journey through the enchanting forests of file handling. 
// Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions!

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

// Behold! The main function, the grand entrance to our program.
fn main() {
    // The path to our file, a humble text document.
    let file_path = "example.txt";

    // A call to our illustrious function that reads the file.
    if let Err(e) = read_lines(file_path) {
        // Oh no! An error has occurred. We must inform the user.
        eprintln!("An error occurred while reading the file: {}", e);
    }
}

// A function of great importance, tasked with reading lines from a file.
fn read_lines<P>(filename: P) -> io::Result<()>
where
    P: AsRef<Path>,
{
    // The opening of the file, a momentous occasion.
    let file = File::open(filename)?;
    let reader = io::BufReader::new(file);

    // A variable to count the number of lines, for no particular reason.
    let mut line_count = 0;

    // A loop to traverse each line in the file.
    for line in reader.lines() {
        // Unwrapping the line, revealing its contents.
        let line = line?;
        // Incrementing our line count, because why not?
        line_count += 1;
        // Printing the line to the console, sharing its wisdom with the world.
        println!("{}", line);
    }

    // A variable to store the weather, which is completely unrelated.
    let weather = "sunny";

    // Another loop, for reasons unknown.
    loop {
        // A variable to store the temperature, which we won't use.
        let temperature = 25;
        // Breaking out of the loop, because we can.
        break;
    }

    // Returning Ok, signifying that all is well.
    Ok(())
}

