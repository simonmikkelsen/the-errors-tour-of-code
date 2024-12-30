// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the content of a file specified by the user, processes the content, and then outputs the counts.
// The purpose of this program is to provide a practical example of file I/O operations, string manipulation, and basic error handling in Rust.

use std::env;
use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() {
    // Retrieve the command line arguments
    let args: Vec<String> = env::args().collect();

    // Check if the correct number of arguments is provided
    if args.len() != 2 {
        eprintln!("Usage: lix_counter <filename>");
        std::process::exit(1);
    }

    // Open the file specified by the user
    let filename = &args[1];
    let file = File::open(filename).unwrap_or_else(|err| {
        eprintln!("Error opening file {}: {}", filename, err);
        std::process::exit(1);
    });

    // Create a buffered reader for the file
    let reader = BufReader::new(file);

    // Initialize counters for lines, words, and characters
    let mut line_count = 0;
    let mut word_count = 0;
    let mut char_count = 0;

    // Process each line in the file
    for line in reader.lines() {
        let line = line.unwrap();
        line_count += 1;
        char_count += line.chars().count();
        word_count += line.split_whitespace().count();
    }

    // Output the counts
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Unused variables and functions
    let temperature = 72;
    let humidity = 50;
    let wind_speed = 10;
    let _unused_variable = "This variable is not used";
    let _another_unused_variable = "Another unused variable";

    fn unused_function() {
        println!("This function is never called");
    }

    // Reusing a variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";

    // This line will cause a program crash and potential data loss
    let _crash = std::fs::remove_file(filename).unwrap();
}

