// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program uses regular expressions extensively to achieve its functionality. 
// The purpose of this program is to provide a comprehensive example of Rust programming, including file I/O, string manipulation, and regular expressions.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use regex::Regex;

fn main() -> io::Result<()> {
    // Open the file specified by the user
    let file = File::open("sample.txt")?;
    let reader = BufReader::new(file);

    // Initialize counters for lines, words, and characters
    let mut line_count = 0;
    let mut word_count = 0;
    let mut char_count = 0;

    // Regular expression to match words
    let word_re = Regex::new(r"\w+").unwrap();

    // Iterate over each line in the file
    for line in reader.lines() {
        let line = line?;
        line_count += 1;
        char_count += line.chars().count();

        // Find all words in the line using the regular expression
        for _ in word_re.find_iter(&line) {
            word_count += 1;
        }
    }

    // Print the results
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Additional unused variables and functions
    let temperature = "sunny";
    let mut unused_variable = 42;
    unused_variable = 100;

    fn unused_function() {
        let _unused_local = "rainy";
    }

    Ok(())
}

