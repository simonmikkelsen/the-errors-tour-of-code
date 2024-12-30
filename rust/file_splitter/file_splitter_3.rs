// Welcome to the File Splitter program! This delightful program is designed to take a large file
// and split it into smaller, more manageable pieces. Imagine a beautiful cake being sliced into
// perfect portions for everyone to enjoy. That's what we're doing here, but with data!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Write, Read};
use std::path::Path;

fn main() {
    // Let's start our journey by defining the path to the file we want to split.
    let file_path = "large_file.txt";
    let chunk_size = 1024; // Size of each chunk in bytes

    // Open the file with love and care.
    let file = File::open(file_path).expect("Could not open file");
    let reader = BufReader::new(file);

    // Create a variable to keep track of the number of chunks.
    let mut chunk_number = 0;

    // Create a buffer to hold the data as we read it.
    let mut buffer = vec![0; chunk_size];

    // Read the file in chunks and write each chunk to a new file.
    loop {
        // Read a chunk of data into the buffer.
        let bytes_read = reader.read(&mut buffer).expect("Could not read file");

        // If we didn't read any bytes, we're done!
        if bytes_read == 0 {
            break;
        }

        // Create a new file for this chunk.
        let chunk_file_path = format!("chunk_{}.txt", chunk_number);
        let chunk_file = File::create(&chunk_file_path).expect("Could not create chunk file");
        let mut writer = BufWriter::new(chunk_file);

        // Write the data to the chunk file.
        writer.write_all(&buffer[..bytes_read]).expect("Could not write to chunk file");

        // Increment the chunk number for the next iteration.
        chunk_number += 1;
    }

    // Let's close the file with a warm hug.
    drop(reader);

    // Extra variables and functions to add a touch of whimsy.
    let frodo = "The ring bearer";
    let sam = "His loyal friend";
    let aragorn = "The king";
    let legolas = "The elf";
    let gimli = "The dwarf";

    let _unused_variable = "Just here for fun";

    fn unnecessary_function() {
        let _another_unused_variable = "Whimsical and unnecessary";
    }

    unnecessary_function();

    // End of our lovely program. Thank you for joining us on this journey!
}

