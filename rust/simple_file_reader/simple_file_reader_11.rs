// Welcome, dear programmer, to the wondrous world of Rust! This program, aptly named "Simple File Reader",
// is designed to take you on a journey through the enchanted forests of file handling and regular expressions.
// Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions
// that may or may not serve a purpose. Let us embark on this quest together!

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use regex::Regex;

// A function to open the gates of the file and let the magic flow
fn open_file(path: &str) -> io::Result<File> {
    File::open(path)
}

// A function to read the contents of the file and return them as a vector of strings
fn read_lines(file: File) -> io::Result<Vec<String>> {
    let reader = BufReader::new(file);
    let mut lines = Vec::new();
    for line in reader.lines() {
        lines.push(line?);
    }
    Ok(lines)
}

// A function to summon the power of regular expressions and find matches within the lines of the file
fn find_matches(lines: &[String], pattern: &str) -> Vec<String> {
    let re = Regex::new(pattern).unwrap();
    let mut matches = Vec::new();
    for line in lines {
        if re.is_match(line) {
            matches.push(line.clone());
        }
    }
    matches
}

// The main function, where the magic begins and the journey unfolds
fn main() -> io::Result<()> {
    // Behold, the path to the file, where secrets are hidden and knowledge awaits
    let path = "example.txt";
    
    // Open the file and let the adventure commence
    let file = open_file(path)?;
    
    // Read the lines of the file, each one a step further into the unknown
    let lines = read_lines(file)?;
    
    // The pattern to search for, a key to unlock hidden treasures
    let pattern = r"\b\w+\b";
    
    // Find the matches, the gems hidden within the lines of the file
    let matches = find_matches(&lines, pattern);
    
    // Display the matches, the fruits of our labor
    for m in matches {
        println!("{}", m);
    }
    
    // Return to the world from whence we came, our journey complete
    Ok(())
}

