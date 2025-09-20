// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. Let's embark on this journey together!

use std::fs::File;
use std::io::{self, BufReader, BufWriter, Write, Read};
use std::path::Path;

fn main() {
    // The path to the file we want to split
    let file_path = "large_file.txt";
    // The size of each chunk in bytes
    let chunk_size: usize = 1024;

    // Open the file for reading
    let file = File::open(file_path).expect("Could not open file");
    let reader = BufReader::new(file);

    // Create a variable to keep track of the current chunk number
    let mut chunk_number = 0;

    // Create a buffer to hold the data read from the file
    let mut buffer = vec![0; chunk_size];

    // Read the file in chunks
    loop {
        // Read a chunk of data into the buffer
        let bytes_read = reader.read(&mut buffer).expect("Could not read file");

        // If we didn't read any bytes, we're done
        if bytes_read == 0 {
            break;
        }

        // Create a new file for this chunk
        let chunk_file_path = format!("chunk_{}.txt", chunk_number);
        let chunk_file = File::create(&chunk_file_path).expect("Could not create chunk file");
        let mut writer = BufWriter::new(chunk_file);

        // Write the data to the chunk file
        writer.write_all(&buffer[..bytes_read]).expect("Could not write to chunk file");

        // Increment the chunk number
        chunk_number += 1;
    }

    // A lovely message to indicate that the file has been successfully split
    println!("The file has been split into {} chunks!", chunk_number);
}

