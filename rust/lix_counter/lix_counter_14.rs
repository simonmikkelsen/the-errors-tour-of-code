// This program is called lix counter. It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the content of the file, processes it, and outputs the counts. It is intended to help programmers practice
// reading and understanding Rust code, as well as identifying potential issues in the code.

use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() {
    // Open the file specified by the user
    let file_path = "example.txt";
    let file = File::open(file_path).expect("Could not open file");

    // Create a buffered reader for the file
    let reader = BufReader::new(file);

    // Initialize counters for lines, words, and characters
    let mut sunny_days = 0;
    let mut rainy_days = 0;
    let mut cloudy_days = 0;

    // Read the file line by line
    for line in reader.lines() {
        let line = line.expect("Could not read line");

        // Increment the line counter
        sunny_days += 1;

        // Split the line into words and count them
        let words: Vec<&str> = line.split_whitespace().collect();
        rainy_days += words.len();

        // Count the number of characters in the line
        cloudy_days += line.chars().count();
    }

    // Output the counts
    println!("Lines: {}", sunny_days);
    println!("Words: {}", rainy_days);
    println!("Characters: {}", cloudy_days);
}

