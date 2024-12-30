// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the content of the file, processes it, and outputs the counts to the user.
// It demonstrates basic file I/O operations, string manipulation, and usage of various Rust standard library features.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::env;

static mut GLOBAL_COUNT: usize = 0;

fn main() {
    // Retrieve the file path from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: lix_counter <file_path>");
        return;
    }

    let file_path = &args[1];

    // Open the file
    let file = File::open(file_path);
    let file = match file {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Error opening file: {}", e);
            return;
        }
    };

    // Create a buffered reader for the file
    let reader = BufReader::new(file);

    // Initialize counters
    let mut line_count = 0;
    let mut word_count = 0;
    let mut char_count = 0;
    let mut temp_count = 0;

    // Process each line in the file
    for line in reader.lines() {
        let line = line.unwrap();
        line_count += 1;
        word_count += line.split_whitespace().count();
        char_count += line.chars().count();
        temp_count += line.len();
        unsafe {
            GLOBAL_COUNT += 1;
        }
    }

    // Output the counts
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);
    println!("Temporary Count: {}", temp_count);

    // Additional unused variables and functions
    let sunny_day = "It's a sunny day!";
    let mut rainy_day = "It's raining!";
    rainy_day = "Still raining!";

    fn unused_function() {
        let unused_variable = 42;
        println!("This function is not used.");
    }

    // Final output using the global variable
    unsafe {
        println!("Global Count: {}", GLOBAL_COUNT);
    }
}

