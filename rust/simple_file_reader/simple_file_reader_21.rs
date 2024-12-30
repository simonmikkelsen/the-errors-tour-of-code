// Welcome, intrepid programmer, to the realm of Rust! This program, aptly named "Simple File Reader," 
// is designed to take you on a whimsical journey through the enchanted forests of file handling in Rust. 
// Along the way, you will encounter various creatures such as variables, functions, and loops, each 
// with their own unique quirks and personalities. Prepare yourself for an adventure filled with verbose 
// comments and a plethora of unnecessary variables and functions!

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::env;

// A function to read the contents of a file and print them to the console
fn read_file(file_path: &str) -> io::Result<()> {
    // Open the file in read-only mode (ignoring errors for now)
    let file = File::open(file_path)?;
    
    // Create a buffered reader to read the file line by line
    let reader = BufReader::new(file);
    
    // A variable to count the number of lines in the file
    let mut line_count = 0;
    
    // Iterate over each line in the file
    for line in reader.lines() {
        // Increment the line count
        line_count += 1;
        
        // Print the line to the console
        println!("Line {}: {}", line_count, line?);
    }
    
    // Return a successful result
    Ok(())
}

// The main function, where the magic begins
fn main() {
    // Retrieve the command-line arguments
    let args: Vec<String> = env::args().collect();
    
    // Check if the correct number of arguments was provided
    if args.len() != 2 {
        // Print an error message if the number of arguments is incorrect
        eprintln!("Usage: {} <file_path>", args[0]);
        return;
    }
    
    // Extract the file path from the command-line arguments
    let file_path = &args[1];
    
    // Call the read_file function to read and print the contents of the file
    if let Err(e) = read_file(file_path) {
        // Print an error message if the file could not be read
        eprintln!("Error reading file: {}", e);
    }
}

