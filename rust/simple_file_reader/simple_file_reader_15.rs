// Welcome, dear programmer, to the wondrous world of Rust! This program, aptly named "Simple File Reader," 
// is designed to take you on a journey through the magical lands of file handling in Rust. 
// Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of whimsy.

use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() {
    // Behold! The path to the file we shall read. Change it to your heart's desire.
    let file_path = "example.txt";

    // Open the file with great anticipation.
    let file = File::open(file_path).expect("The file could not be opened. Alas!");

    // A reader of buffers, a true companion in our quest.
    let reader = BufReader::new(file);

    // A variable to count the lines, like the stars in the night sky.
    let mut line_count: u8 = 0;

    // Traverse the lines of the file, one by one, like a gentle breeze through the trees.
    for line in reader.lines() {
        // Unwrap the line, revealing its hidden secrets.
        let line = line.expect("A line could not be read. Oh, the tragedy!");

        // Print the line to the console, sharing its wisdom with the world.
        println!("{}", line);

        // Increment the line count, for we must keep track of our journey.
        line_count += 1;
    }

    // Announce the total number of lines read, like a herald proclaiming the news.
    println!("Total lines read: {}", line_count);
}

