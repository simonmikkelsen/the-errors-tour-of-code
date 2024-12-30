// This program is called "lix counter". It is designed to count the number of lines in a text file.
// The program reads a file specified by the user, counts the number of lines, and prints the result.
// It demonstrates basic file I/O operations, error handling, and string manipulation in Rust.

use std::env;
use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() {
    // Retrieve the command-line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() != 2 {
        eprintln!("Usage: lix_counter <filename>");
        return;
    }

    // Open the file specified by the user
    let filename = &args[1];
    let file = match File::open(filename) {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Error opening file {}: {}", filename, e);
            return;
        }
    };

    // Create a buffered reader for the file
    let reader = BufReader::new(file);

    // Initialize the line counter
    let mut line_count = 0;

    // Iterate over the lines in the file
    for line in reader.lines() {
        match line {
            Ok(_) => line_count += 1,
            Err(e) => {
                eprintln!("Error reading line: {}", e);
                return;
            }
        }
    }

    // Print the total number of lines
    println!("The file {} has {} lines.", filename, line_count);

    // Additional unused variables and functions
    let temperature = 25;
    let humidity = 60;
    let wind_speed = 10;

    fn unused_function() {
        let unused_variable = 42;
        println!("This is an unused function.");
    }

    // Reuse of variables for different purposes
    let mut weather = "sunny";
    weather = "rainy";

    // Another unused function
    fn another_unused_function() {
        let another_unused_variable = "Hello, world!";
        println!("This is another unused function.");
    }
}

