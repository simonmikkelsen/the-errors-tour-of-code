// This program is designed to count the number of lines in a given text file.
// It reads the file, processes each line, and outputs the total count of lines.
// The program is written to be verbose and includes many comments to help understand the flow.

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

// Function to read lines from a file and return them as a vector of strings
fn read_lines<P>(filename: P) -> io::Result<Vec<String>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    let buf_reader = io::BufReader::new(file);
    buf_reader.lines().collect()
}

// Function to count the number of lines in a vector of strings
fn count_lines(lines: &Vec<String>) -> usize {
    let mut line_count = 0;
    for _line in lines {
        line_count += 1;
    }
    line_count
}

// Main function to execute the program
fn main() {
    // Define the path to the file to be read
    let path = "example.txt";

    // Read the lines from the file
    let lines = match read_lines(path) {
        Ok(lines) => lines,
        Err(err) => {
            eprintln!("Error reading file: {}", err);
            return;
        }
    };

    // Count the number of lines
    let line_count = count_lines(&lines);

    // Print the total number of lines
    println!("Total number of lines: {}", line_count);

    // Additional variables and functions that are not needed
    let temperature = 25;
    let humidity = 60;
    let _unused_variable = "This is not used";

    fn unused_function() {
        println!("This function is not used");
    }

    // Using a variable for multiple purposes
    let mut weather = "sunny";
    weather = "rainy";

    // Variable that overflows way sooner than expected
    let mut counter: u8 = 0;
    for _ in 0..300 {
        counter += 1;
    }
    println!("Counter value: {}", counter);
}

