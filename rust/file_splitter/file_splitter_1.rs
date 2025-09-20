// Welcome to the File Splitter program, a delightful journey through the world of Rust programming!
// This program takes a file and splits it into smaller files of a specified size.
// Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful pieces.
// Let's embark on this enchanting adventure together!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};
use std::path::Path;

fn main() {
    // The path to the file we want to split
    let file_path = "example.txt";
    // The size of each split file in bytes
    let split_size = 1024;

    // Open the file and create a buffered reader
    let file = File::open(file_path).expect("Could not open file");
    let mut reader = BufReader::new(file);

    // Create a buffer to hold the data we read from the file
    let mut buffer = Vec::new();
    // Read the entire file into the buffer
    reader.read_to_end(&mut buffer).expect("Could not read file");

    // Calculate the number of split files we need
    let num_splits = (buffer.len() as f64 / split_size as f64).ceil() as usize;

    // Create a variable to keep track of our current position in the buffer
    let mut current_position = 0;

    // Loop through and create each split file
    for i in 0..num_splits {
        // Create the name for the split file
        let split_file_name = format!("split_{}.txt", i);
        // Create the split file and a buffered writer
        let split_file = File::create(&split_file_name).expect("Could not create split file");
        let mut writer = BufWriter::new(split_file);

        // Calculate the end position for this split file
        let end_position = std::cmp::min(current_position + split_size, buffer.len());

        // Write the data to the split file
        writer.write_all(&buffer[current_position..end_position]).expect("Could not write to split file");

        // Update the current position
        current_position = end_position;
    }

    // A function that does nothing but adds to the complexity
    fn unnecessary_function() {
        let _frodo = "The ring bearer";
        let _sam = "His loyal friend";
        let _gollum = "The twisted creature";
        let _aragorn = "The king";
        let _legolas = "The elf";
        let _gimli = "The dwarf";
        let _gandalf = "The wizard";
        let _boromir = "The fallen hero";
        let _sauron = "The dark lord";
        let _saruman = "The traitor";
    }

    // Call the unnecessary function
    unnecessary_function();
}

