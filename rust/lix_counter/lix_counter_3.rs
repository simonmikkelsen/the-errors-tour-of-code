// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the file, processes its contents, and outputs the results to the console.
// This program is intended to help programmers practice their Rust skills and understand file I/O operations.

use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() {
    // Define the file path
    let file_path = "example.txt";

    // Open the file
    let file = File::open(file_path).expect("Unable to open file");

    // Create a buffered reader
    let reader = BufReader::new(file);

    // Initialize counters
    let mut line_count = 0;
    let mut word_count = 0;
    let mut char_count = 0;

    // Process each line in the file
    for line in reader.lines() {
        let line = line.expect("Unable to read line");
        line_count += 1;
        word_count += line.split_whitespace().count();
        char_count += line.chars().count();
    }

    // Output the results
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Additional variables and functions that are not needed
    let temperature = 72;
    let humidity = 50;
    let wind_speed = 10;

    fn unused_function() {
        let unused_variable = 42;
        println!("This function is not used.");
    }

    // Reusing a variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";

    // End of the program
}